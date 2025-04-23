package thunderstorm

import "core:mem"
import "core:math/linalg/glsl"
import gl "./opengl"

@(private)
g_renderer_runtime: struct {
	initialized: bool,

	textures: []Texture, // NOTE: the first texture is a blank texture used for drawing single color shapes
	quad_vertexes: []Quad_Vertex,
	quad_indexes: []Quad_Index,
	texture_idx: u32,
	quad_idx: u32,

	index_buffer: u32,
	vertex_buffer: u32,
	vertex_array: u32,
	program: u32,

	max_quads: i32,
	max_textures: i32,
	bounds: [2]f32,

	default_texture: Texture,
}

@(private)
get_renderer_limits :: proc() {
	runtime := &g_renderer_runtime

	gl.GetIntegerv(gl.MAX_TEXTURE_IMAGE_UNITS, &runtime.max_textures)
	runtime.max_quads = 2560
}

@(private)
is_texture_used :: proc(in_texture: Texture) -> (u32, bool) {
	runtime := &g_renderer_runtime

	for texture, i in runtime.textures {
		if texture == in_texture {
			return u32(i), true
		}
	}

	return 0, false
}

@(private)
normalize_texture_rect :: proc(rect: Rect, texture: Texture) -> Rect {
	w := f32(texture.w)
	h := f32(texture.h)

	normalized_rect := Rect {
		rect.x / w,
		rect.y / h,
		rect.w / w,
		rect.h / h,
	}

	return normalized_rect
}

Graphics_clear_color :: proc(color: Color) {
	clr := color_to_gl(color)
	gl.ClearColor(clr.r, clr.g, clr.b, clr.a)
	gl.Clear(gl.COLOR_BUFFER_BIT)
}

Graphics_begin_batch :: proc() {
	runtime := &g_renderer_runtime

	if !runtime.initialized {
		runtime.initialized = true

		runtime.quad_vertexes = make([]Quad_Vertex, runtime.max_quads)
		runtime.quad_indexes = make([]Quad_Index, runtime.max_quads)
		runtime.textures = make([]Texture, runtime.max_textures)
		
		runtime.default_texture = load_blank_texture() 
		runtime.textures[0] = runtime.default_texture
		runtime.texture_idx = 1

		ok: bool
		runtime.program, ok = Graphics_load_shader_spirv(raw_data(VERT_SHADER), raw_data(FRAG_SHADER), len(VERT_SHADER), len(FRAG_SHADER))
		assert_log(ok, "Couldn't load shader")

		gl.CreateBuffers(1, &runtime.vertex_buffer)
		gl.CreateBuffers(1, &runtime.index_buffer)

		gl.NamedBufferStorage(runtime.vertex_buffer, size_of(Quad_Vertex) * int(runtime.max_quads), nil, gl.DYNAMIC_STORAGE_BIT)
		gl.NamedBufferStorage(runtime.index_buffer, size_of(Quad_Index) * int(runtime.max_quads), nil, gl.DYNAMIC_STORAGE_BIT)

		gl.CreateVertexArrays(1, &runtime.vertex_array)
		
		{
			gl.VertexArrayVertexBuffer(runtime.vertex_array, 0, runtime.vertex_buffer, 0, size_of(Vertex))
			
			// Deal with OpenGL stupidity about not allowing mat4 as a vertex parameter
			for i in 0 ..< 4 {
				gl.EnableVertexArrayAttrib(runtime.vertex_array, u32(i)) // transform matrix 
			}

			gl.EnableVertexArrayAttrib(runtime.vertex_array, 4) // position
			gl.EnableVertexArrayAttrib(runtime.vertex_array, 5) // texture (uv coords)
			gl.EnableVertexArrayAttrib(runtime.vertex_array, 6) // color 
			gl.EnableVertexArrayAttrib(runtime.vertex_array, 7) // texture index
		}
		
		{
			// Deal with OpenGL stupidity about not allowing mat4 as a vertex parameter
			for i in 0 ..< 4 {
				gl.VertexArrayAttribFormat(runtime.vertex_array, u32(i), 4, gl.FLOAT, false, u32(size_of(f32) * 4 * i)) // transform matrix 
			}

			gl.VertexArrayAttribFormat(runtime.vertex_array, 4, 2, gl.FLOAT, false, u32(offset_of(Vertex, position))) // position
			gl.VertexArrayAttribFormat(runtime.vertex_array, 5, 2, gl.FLOAT, true, u32(offset_of(Vertex, texture))) // texture (uv coords)
			gl.VertexArrayAttribFormat(runtime.vertex_array, 6, 4, gl.FLOAT, true, u32(offset_of(Vertex, color))) // color
			gl.VertexArrayAttribFormat(runtime.vertex_array, 7, 1, gl.FLOAT, false, u32(offset_of(Vertex, texture_idx))) // texture index
		}

		gl.VertexArrayAttribBinding(runtime.vertex_array, 0, 0)
		gl.VertexArrayAttribBinding(runtime.vertex_array, 1, 0)
		gl.VertexArrayAttribBinding(runtime.vertex_array, 2, 0)
		gl.VertexArrayAttribBinding(runtime.vertex_array, 3, 0)
		gl.VertexArrayAttribBinding(runtime.vertex_array, 4, 0)
		gl.VertexArrayAttribBinding(runtime.vertex_array, 5, 0)
		gl.VertexArrayAttribBinding(runtime.vertex_array, 6, 0)
		gl.VertexArrayAttribBinding(runtime.vertex_array, 7, 0)
		
		gl.Enable(gl.BLEND)
		gl.BlendFunc(gl.SRC_ALPHA, gl.ONE_MINUS_SRC_ALPHA)
	}
}

Graphics_end_batch :: proc() {
	Graphics_flush_batch()
}

Graphics_flush_batch :: proc() {
	runtime := &g_renderer_runtime

	// TODO: only reconstruct the matrix on screen resize
	a := 2 / runtime.bounds.x
	b := 2 / runtime.bounds.y
	projection := glsl.mat4 {
		a, 0, 0, -1,
		0, b, 0, -1,
		0, 0, 1,  0,
		0, 0, 0,  1,
	}
	
	gl.ProgramUniformMatrix4fv(runtime.program, PROJECTION_LOC, 1, false, &projection[0][0])

	gl.NamedBufferSubData(runtime.vertex_buffer, 0, size_of(Quad_Vertex) * int(runtime.max_quads), raw_data(runtime.quad_vertexes))
	gl.NamedBufferSubData(runtime.index_buffer, 0, size_of(Quad_Index) * int(runtime.max_quads), raw_data(runtime.quad_indexes))

	for texture, i in runtime.textures {
		gl.BindTextureUnit(u32(i), texture.id)
	}

	gl.UseProgram(runtime.program)
	gl.BindVertexArray(runtime.vertex_array)
	gl.BindBuffer(gl.ELEMENT_ARRAY_BUFFER, runtime.index_buffer)
	gl.DrawElements(gl.TRIANGLES, i32(runtime.quad_idx) * 6, gl.UNSIGNED_INT, nil)

	runtime.texture_idx = 1
	runtime.quad_idx = 0
}

Graphics_draw_textured_rect :: proc(target, source: Rect, texture: Texture, color: Color, transform := glsl.mat4(1)) {
	runtime := &g_renderer_runtime

	texture_idx, used := is_texture_used(texture)

	if runtime.quad_idx >= u32(runtime.max_quads) || runtime.texture_idx >= u32(runtime.max_textures) && !used {
		Graphics_flush_batch()
	}

	if !used {
		runtime.textures[runtime.texture_idx] = texture
		texture_idx = runtime.texture_idx
		runtime.texture_idx += 1
	}

	// normalize texture coordinates, convert color format, cast index to float
	source := normalize_texture_rect(source, texture)
	gl_color := color_to_gl(color)
	ftexture_idx := f32(texture_idx)
	
	top_left := Vertex {
		transform,
		{ target.x, target.y },
		{ source.x, source.y },
		gl_color,
		ftexture_idx
	}
	
	top_right := Vertex {
		transform,
		{ target.x + target.w, target.y },
		{ source.x + source.w, source.y },
		gl_color,
		ftexture_idx,
	}
	
	bottom_left := Vertex {
		transform,
		{ target.x, target.y + target.h },
		{ source.x, source.y + source.h },
		gl_color,
		ftexture_idx,
	}
	
	bottom_right := Vertex {
		transform,
		{ target.x + target.w, target.y + target.h },
		{ source.x + source.w, source.y + source.h },
		gl_color,
		ftexture_idx,
	}

	vertex := Quad_Vertex {
		top_left,
		top_right,
		bottom_right,
		bottom_left,
	}

	index := Quad_Index {
		1, 2, 0,
		0, 3, 2,
	}
	index += runtime.quad_idx * 4

	runtime.quad_vertexes[runtime.quad_idx] = vertex
	runtime.quad_indexes[runtime.quad_idx] = index
	runtime.quad_idx += 1
}

Graphics_draw_rect :: proc(target: Rect, color: Color, transform := glsl.mat4(1)) {
	runtime := &g_renderer_runtime

	source := Rect {
		0, 0,
		f32(runtime.default_texture.w),
		f32(runtime.default_texture.h),
	}

	Graphics_draw_textured_rect(target, source, runtime.default_texture, color, transform)
}

Graphics_draw_line :: proc(start, end: [2]f32, thickness: f32, color: Color) {
	runtime := &g_renderer_runtime

	adj := start.x - end.x
	opp := start.y - end.y
	angle := glsl.atan(opp / adj)

	tmat1 := glsl.mat4Translate({ start.x, start.y, 0 })
	tmat2 := glsl.mat4Translate({ -start.x, -start.y, 0 })
	rmat := glsl.mat4Rotate({ 0, 0, 1 }, angle)
	
	transform := tmat1 * rmat * tmat2
	
	size := glsl.distance(start, end)

	target := Rect {
		start.x, start.y,
		size, thickness,
	}

	Graphics_draw_rect(target, color, transform)
}

Rect :: struct {
	x, y, w, h: f32,
}

Vertex :: struct #packed {
	transform: glsl.mat4,
	position: [2]f32,
	texture: [2]f32,
	color: GL_Color,
	texture_idx: f32,
}

Quad_Vertex :: distinct [4]Vertex
Quad_Index :: distinct [6]u32

// shaders data
@(private) VERT_SHADER :: #load("../bin/batch.vert.glsl.spv")
@(private) FRAG_SHADER :: #load("../bin/batch.frag.glsl.spv")

// NOTE:
// ARB_gl_spirv
// 23. How does setting uniforms work if we can’t query for locations based on
// names?
// RESOLVED. The shaders need to specify explicit locations for all uniform
// variables. The application can use offline reflection (or a reflection
// library) to know which variables are at which location, and then
// use that to specify the values of uniforms by location, as normal
// (e.g. Uniform*, ProgramUniform*).

// shader uniform locations
@(private) PROJECTION_LOC :: 0
