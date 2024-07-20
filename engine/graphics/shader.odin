package graphics

import "core:strings"
import "core:os"
import gl "../graphics/opengl"

load_shader_spirv :: proc(vs_spirv, fs_spirv: rawptr, vs_size, fs_size: int) -> (program_id: u32, ok: b8) {
    ok = false

    vs_id := compile_shader_from_spirv(vs_spirv, vs_size, .VERTEX_SHADER) or_return
    defer gl.DeleteShader(vs_id)
    fs_id := compile_shader_from_spirv(fs_spirv, fs_size, .FRAGMENT_SHADER) or_return
    defer gl.DeleteShader(fs_id)

    program_id, ok = create_and_link_program([]u32{ vs_id, fs_id })
    return
}

compile_shader_from_spirv :: proc(shader_data: rawptr, shader_data_size: int, shader_type: gl.Shader_Type) -> (shader_id: u32, ok: b8) {
    ok = false
    shader_id = gl.CreateShader(u32(shader_type))
    gl.ShaderBinary(1, &shader_id, gl.SHADER_BINARY_FORMAT_SPIR_V, shader_data, i32(shader_data_size))
    gl.SpecializeShader(shader_id, "main", 0, nil, nil)

    check_error(shader_id, shader_type, gl.COMPILE_STATUS, gl.GetShaderiv, gl.GetShaderInfoLog) or_return
    ok = true
    return
}

create_and_link_program :: proc(shader_ids: []u32, binary_retrievable := false) -> (program_id: u32, ok: b8) {
    ok = false
    program_id = gl.CreateProgram()

    for id in shader_ids {
        gl.AttachShader(program_id, id)
    }

    if binary_retrievable {
        gl.ProgramParameteri(program_id, gl.PROGRAM_BINARY_RETRIEVABLE_HINT, 1)
    }

    gl.LinkProgram(program_id)

    check_error(program_id, .SHADER_LINK, gl.LINK_STATUS, gl.GetProgramiv, gl.GetProgramInfoLog) or_return
    ok = true
    return
}