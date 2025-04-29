package thunderstorm

import "vendor:sdl2"

@(private)
color_to_gl :: proc(color: Color) -> GL_Color {
	convert :: #force_inline proc(v: u8) -> f32 {
		return f32(v) / 255.0
	}

	res := GL_Color {
		r = convert(color.r),
		g = convert(color.g),
		b = convert(color.b),
		a = convert(color.a),
	}

	return res
}

Graphics_set_sync_mode :: proc(mode: Sync_Mode) {
	sdl2.GL_SetSwapInterval(i32(mode))
	log(.Info, "Changed sync mode to: %v", mode)
}

Graphics_color_from_hex :: proc(color: u32) -> Color {
	res := Color {
		r = u8(color >> 24) & 255,
		g = u8(color >> 16) & 255,
		b = u8(color >> 8) & 255,
		a = u8(color) & 255,
	}

	return res
}

Color :: struct {
	r, g, b, a: u8,
}

GL_Color :: struct {
	r, g, b, a: f32,
}

Sync_Mode :: enum i32 {
	None = 0,
	Vsync = 1,
	Adaptative = -1,
}