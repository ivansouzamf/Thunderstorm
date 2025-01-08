package thunderstorm

import "core:strings"
import "core:slice"
import "vendor:sdl2"
import sdl2img "vendor:sdl2/image"
import gl "./opengl"

// FIXME: it's converting the image to the right format properly
Graphics_load_image_from_disk :: proc(path: string, allocator := context.allocator) -> Image {
	path_cstr := strings.clone_to_cstring(path)
	defer delete(path_cstr)
	
	surface := sdl2img.Load(path_cstr)
	defer sdl2.FreeSurface(surface)
	rbga_surface := sdl2.ConvertSurfaceFormat(surface, u32(sdl2.PixelFormatEnum.RGBA8888), 0)
	defer sdl2.FreeSurface(rbga_surface)
	
	data_size := size_of(u8) * int(rbga_surface.w * rbga_surface.h)
	data_slice := slice.bytes_from_ptr(rbga_surface.pixels, data_size)
	
	image := Image {
		slice.clone(data_slice, allocator),
		rbga_surface.w,
		rbga_surface.h,
	}
	
	return image
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