package thunderstorm

import gl "./opengl"
import "base:runtime"

Graphics_check_gl_error :: proc(id: u32, type: gl.Shader_Type, status: u32, iv_proc: proc "c" (u32, u32, [^]i32), log_proc: proc "c" (u32, i32, ^i32, [^]u8)) -> b8 {
    result, log_len: i32
    
    iv_proc(id, status, &result)
    iv_proc(id, gl.INFO_LOG_LENGTH, &log_len)

    if result == 0 {
        error_message := make([]u8, log_len)
        defer delete(error_message)
        log_proc(id, log_len, nil, raw_data(error_message))
        
        if log_proc == gl.GetShaderInfoLog {
            log(.Error, "OpenGL shader error. type: %v, error: %s", type, string(error_message))
        } else if log_proc == gl.GetProgramInfoLog {
            log(.Error, "OpenGL program error. type %v, error: %s", type, string(error_message))
        } else {
        }

        return false
    }

    return true
}

@(private)
gl_debug_callback :: proc "c" (source: u32, type: u32, id: u32, severity: u32, length: i32, message: cstring, user_param: rawptr) {
    context = runtime.default_context()

    level: Log_Level
    if type == gl.DEBUG_TYPE_ERROR && (severity == gl.DEBUG_SEVERITY_HIGH || severity == gl.DEBUG_SEVERITY_HIGH_ARB) {
        level = .Error
    } else {
        level = .Warn
    }

    source_enum: gl.GL_Enum = auto_cast source
    type_enum: gl.GL_Enum = auto_cast type
    severity_enum: gl.GL_Enum = auto_cast severity

    log(level, "[OPENGL DEBUG] source: %w, type: %w, severity: %w, message: %s", source_enum, type_enum, severity_enum, message)
}