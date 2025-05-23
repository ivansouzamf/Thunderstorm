package thunderstorm

import "core:fmt"
import "core:strings"
import "core:time"
import "core:os"

assert_log :: proc(expression: bool, message: string, args: ..any, loc := #caller_location) {
    if !expression {
        log(.Fatal, message, ..args)
        assert(expression, "", loc)
    }
}

log :: proc(level: Log_Level, message: string, args: ..any) {
    // transform everything in a single string
    str_builder := strings.builder_make(len(message))
    defer strings.builder_destroy(&str_builder)
    fmt.sbprintf(&str_builder, message, ..args)
    message := strings.to_string(str_builder)

    log_str: string
    switch level {
        case .Info: log_str = "INFO"
        case .Warn: log_str = "WARN"
        case .Error: log_str = "ERROR"
        case .Fatal: log_str = "FATAL"
    }
    
    buff: [time.MIN_HMS_LEN]byte
    time_str := time.to_string_hms(time.now(), buff[:])
 
    output: os.Handle
    if u8(level) > 1 {
        output = os.stderr
    } else {
        output = os.stdout
    }

    fmt.fprintfln(output, "[%s] [%s] %s", log_str, time_str, message)
}

Log_Level :: enum u8 {
    Info = 0,
    Warn = 1,
    Error = 2, // NOTE: if the error can make the program crash prefer to use '.Fatal'
    Fatal = 3,
}
