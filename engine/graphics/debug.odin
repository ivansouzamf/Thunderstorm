package graphics

import "../utils"
import gl "../graphics/opengl"

check_error :: proc(id: u32, type: gl.Shader_Type, status: u32, iv_proc: proc "c" (u32, u32, [^]i32), log_proc: proc "c" (u32, i32, ^i32, [^]u8)) -> b8 {
    result, log_len: i32
    
    iv_proc(id, status, &result)
    iv_proc(id, gl.INFO_LOG_LENGTH, &log_len)

    if result == 0 {
        error_message := make([]u8, log_len)
        defer delete(error_message)
        log_proc(id, log_len, nil, raw_data(error_message))
        
        if log_proc == gl.GetShaderInfoLog {
            utils.log(.Error, "OpenGL shader error. type: %v, error: %s", type, string(error_message[0 : len(error_message) - 1]))
        } else if log_proc == gl.GetProgramInfoLog {
            utils.log(.Error, "OpenGL program error. type %v, error: %s", type, string(error_message[0 : len(error_message) - 1]))
        } else {
        }

        return false
    }

    return true
}