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
    thstm.Core_init_renderer()

    image := thstm.Graphics_load_image_from_disk("texture.png")
    texture := thstm.Graphics_load_texture_from_image(image, .Nearest)
    
    for thstm.Core_is_running() {
        r := rand.float32()
        g := rand.float32()
        b := rand.float32()
        gl.ClearColor(r, g, b, 1.0)
        gl.Clear(gl.COLOR_BUFFER_BIT)
        
        thstm.Graphics_begin_batch()
        for i in 0 ..= 10 {
            thstm.Graphics_draw_textured_rect({ f32(i) * 74, 200, 64, 64 }, { 0, 0, 64, 64 }, texture)
        }
        thstm.Graphics_end_batch()

        thstm.Core_display()
    }
}