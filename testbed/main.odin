package testbed 

import "core:math/rand"
import "core:thread"
import "core:os"
import thstm "../thunderstorm"
import gl "../thunderstorm/opengl"

main :: proc() {
    thstm.Core_init(800, 600, "thunderstorm testbed")
    defer thstm.Core_deinit()

    render_thread := thread.create_and_start(testbed_render)

    for thstm.Core_is_running() {
        thstm.Core_update()
    }
}

testbed_render :: proc() {
    thstm.Core_init_render()

    err: bool
    vs_shader: []byte
    fg_shader: []byte
    vs_shader, err = os.read_entire_file_from_filename("default.vert.glsl.spv")
    thstm.assert_log(err, "Faild to load vertex shader")
    fg_shader, err = os.read_entire_file_from_filename("default.frag.glsl.spv")
    thstm.assert_log(err, "Faild to load fragment shader")

    program_id, error := thstm.Graphics_load_shader_spirv(raw_data(vs_shader), raw_data(fg_shader), len(vs_shader), len(fg_shader))
    thstm.assert_log(bool(error), "Faild to create program")
    gl.UseProgram(program_id)

    vertices := [?]f32 {
        // vertices       // colors
        -0.5,  0.5, 0.0,  0.0, 0.0, 1.0, // top left
         0.5,  0.5, 0.0,  0.0, 0.0, 1.0, // top right
        -0.5, -0.5, 0.0,  1.0, 0.0, 0.0, // bottom left
         0.5, -0.5, 0.0,  0.0, 1.0, 0.0, // bottom right
    }
    indices := [?]u32 {
        0, 2, 3,
        0, 1, 3,
    }

    vertex_buffer: u32
    gl.CreateBuffers(1, &vertex_buffer)
    gl.NamedBufferStorage(vertex_buffer, size_of(vertices), &vertices, gl.DYNAMIC_STORAGE_BIT)
    index_buffer: u32
    gl.CreateBuffers(1, &index_buffer)
    gl.NamedBufferStorage(index_buffer, size_of(indices), &indices, gl.DYNAMIC_STORAGE_BIT)

    vertex_array: u32
    gl.CreateVertexArrays(1, &vertex_array)
    gl.VertexArrayVertexBuffer(vertex_array, 0, vertex_buffer, 0, size_of(f32) * (3 + 3)) // 3 coords (x, y, z) + 3 colors (r, g, b)
    gl.EnableVertexArrayAttrib(vertex_array, 0)
    gl.EnableVertexArrayAttrib(vertex_array, 1)

    gl.VertexArrayAttribFormat(vertex_array, 0, 3, gl.FLOAT, true, 0);
    gl.VertexArrayAttribFormat(vertex_array, 1, 3, gl.FLOAT, true, 3 * size_of(f32))

    gl.VertexArrayAttribBinding(vertex_array, 0, 0)
    gl.VertexArrayAttribBinding(vertex_array, 1, 0)

    
    for thstm.Core_is_running() {
        r := rand.float32()
        g := rand.float32()
        b := rand.float32()
        gl.ClearColor(r, g, b, 1.0)
        
        gl.Clear(gl.COLOR_BUFFER_BIT)
        
        gl.BindVertexArray(vertex_array)
        gl.BindBuffer(gl.ELEMENT_ARRAY_BUFFER, index_buffer)
        gl.DrawElements(gl.TRIANGLES, 6, gl.UNSIGNED_INT, nil)
        gl.BindBuffer(gl.ELEMENT_ARRAY_BUFFER, 0)
        gl.BindVertexArray(0)

        thstm.Core_display()
    }
}
