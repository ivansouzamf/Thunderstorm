package thunderstorm

import "core:slice"
import "core:image/png"
import "core:image/qoi"
import "core:image"
import "vendor:sdl2"
import gl "./opengl"

Graphics_load_image_from_disk :: proc(path: string, allocator := context.allocator) -> Image {
	img, err := image.load_from_file(path, { .alpha_add_if_missing }, allocator)
	assert_log(err == nil, "Could not load image: %s. Reason: %v", path, err)

	res := Image {
		img.pixels.buf[:],
		i32(img.width),
		i32(img.height),
	}

	return res
}

// NOTE: all textures must be in RGBA8 format
Graphics_load_texture_from_image :: proc(image: Image, filtering: Texture_Filtering) -> Texture {
	texture_id: u32
	gl.CreateTextures(gl.TEXTURE_2D, 1, &texture_id)
	gl.TextureParameteri(texture_id, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_BORDER)
	gl.TextureParameteri(texture_id, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_BORDER)
	gl.TextureParameteri(texture_id, gl.TEXTURE_MIN_FILTER, i32(filtering))
	gl.TextureParameteri(texture_id, gl.TEXTURE_MAG_FILTER, i32(filtering))
	gl.TextureStorage2D(texture_id, 1, gl.RGBA8, image.w, image.h)
	gl.TextureSubImage2D(texture_id, 0, 0, 0, image.w, image.h, gl.RGBA, gl.UNSIGNED_BYTE, raw_data(image.data))

	texture := Texture {
		texture_id,
		u32(image.w),
		u32(image.h),
	}

	return texture
}

@(private)
load_blank_texture :: proc() -> Texture {
	texture := 0xffffffff
	texture_data := slice.bytes_from_ptr(&texture, size_of(u32))

	image := Image {
		texture_data,
		1,
		1,
	}

	return Graphics_load_texture_from_image(image, .Nearest)
}

Image :: struct {
	data: []byte,
	w, h: i32,
}

Texture :: struct {
	id: u32,
	w, h: u32,
}

Texture_Filtering :: enum i32 {
	Linear = gl.LINEAR,
	Nearest = gl.NEAREST,
}