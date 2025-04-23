package testbed

import "core:math/rand"
import "core:thread"
import "core:os"
import "core:math/linalg/glsl"
import thstm "../thunderstorm"

main :: proc() {
    thstm.Core_init(800, 600, "thunderstorm testbed")
    defer thstm.Core_deinit()

    render_thread := thread.create_and_start(testbed_render)

    for thstm.Core_is_running() {
        thstm.Core_update()
    }
    
    thread.join(render_thread)
}

testbed_render :: proc() {
    thstm.Core_init_renderer()

    //image := thstm.Graphics_load_image_from_disk("texture.png")
    image := thstm.Graphics_load_image_from_disk("sprite.png")
    texture := thstm.Graphics_load_texture_from_image(image, .Nearest)

    frequency := thstm.Core_get_perf_frequency()
    for thstm.Core_is_running() {
        // calc delta && fps
        @(static) last_time: u64
        current_time := thstm.Core_get_perf_counter()
        delta := f32(current_time - last_time) / f32(frequency)
        fps := 1.0 / delta
        if last_time == 0 do delta = 0
        last_time = current_time

        color := thstm.Graphics_color_from_hex(0x6C96D500)
        thstm.Graphics_clear_color(color)

        thstm.Graphics_begin_batch()
        {
            benchmark_test(texture)
            simple_test(delta)
        }
        thstm.Graphics_end_batch()

        thstm.Core_display()
    }
}

simple_test :: proc(delta: f32) {
    red := thstm.Graphics_color_from_hex(0xff00007f)
    @(static) rotate: f32
    rotate += delta * 15

    for i in 0 ..= 10 {
        quad := thstm.Rect { f32(i) * 74, 200, 64, 64 }

        cx := quad.x + quad.w / 2
        cy := quad.y + quad.h / 2
        tmat1 := glsl.mat4Translate({ cx, cy, 0 })
        tmat2 := glsl.mat4Translate({ -cx, -cy, 0 })
        rmat := glsl.mat4Rotate({ 0, 0, 1 }, glsl.radians(-rotate))

        transform := tmat1 * rmat * tmat2
        thstm.Graphics_draw_rect(quad, red, transform)
    }

    thstm.Graphics_draw_line({ 400, 400 }, { 600, 600 }, 1, red)
}

benchmark_test :: proc(spritesheet: thstm.Texture) {
    // spritesheet
    spritesheet_size :: [2]u32 { 128, 128 }
    spritesheet_sprites_number :: 64
    // source
    sprite_source_size :: [2]u32 { 16, 16 }
    // target
    sprite_target_size :: [2]u32 { 64, 64 }
    // sprite count
    max_sprites :: 2048
    max_spritesheets :: max_sprites / spritesheet_sprites_number

    white := thstm.Graphics_color_from_hex(0xffffffff)

    for i in 0 ..< max_spritesheets {
        column: u32
        line: u32
        for j in 0 ..< spritesheet_sprites_number {
            source := thstm.Rect {
                w = f32(sprite_source_size.x),
                h = f32(sprite_source_size.y),
                x = f32(column),
                y = f32(line),
            }
            target := thstm.Rect {
                w = f32(sprite_target_size.x),
                h = f32(sprite_target_size.y),
                x = f32(rand.uint32() % (1920 - sprite_target_size.x)),
                y = f32(rand.uint32() % (1080 - sprite_target_size.y)),
            }

            column += sprite_source_size.x
            if column >= spritesheet_size.x {
                column = 0
                line += sprite_source_size.y
            } else if line >= spritesheet_size.y {
                break
            }

            thstm.Graphics_draw_textured_rect(target, source, spritesheet, white)
        }
    }
}
