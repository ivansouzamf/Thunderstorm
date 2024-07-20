package vendor_gl

// Helper for loading shaders into a program

import "core:os"
import "core:fmt"
import "core:strings"
import "base:runtime"
_ :: fmt
_ :: runtime

Shader_Type :: enum i32 {
	NONE = 0x0000,
	FRAGMENT_SHADER        = 0x8B30,
	VERTEX_SHADER          = 0x8B31,
	GEOMETRY_SHADER        = 0x8DD9,
	COMPUTE_SHADER         = 0x91B9,
	TESS_EVALUATION_SHADER = 0x8E87,
	TESS_CONTROL_SHADER    = 0x8E88,
	SHADER_LINK            = -1, // @Note: Not an OpenGL constant, but used for error checking.
}

Uniform_Type :: enum i32 {
	FLOAT      = 0x1406,
	FLOAT_VEC2 = 0x8B50,
	FLOAT_VEC3 = 0x8B51,
	FLOAT_VEC4 = 0x8B52,

	DOUBLE      = 0x140A,
	DOUBLE_VEC2 = 0x8FFC,
	DOUBLE_VEC3 = 0x8FFD,
	DOUBLE_VEC4 = 0x8FFE,

	INT      = 0x1404,
	INT_VEC2 = 0x8B53,
	INT_VEC3 = 0x8B54,
	INT_VEC4 = 0x8B55,

	UNSIGNED_INT      = 0x1405,
	UNSIGNED_INT_VEC2 = 0x8DC6,
	UNSIGNED_INT_VEC3 = 0x8DC7,
	UNSIGNED_INT_VEC4 = 0x8DC8,

	BOOL      = 0x8B56,
	BOOL_VEC2 = 0x8B57,
	BOOL_VEC3 = 0x8B58,
	BOOL_VEC4 = 0x8B59,

	FLOAT_MAT2   = 0x8B5A,
	FLOAT_MAT3   = 0x8B5B,
	FLOAT_MAT4   = 0x8B5C,
	FLOAT_MAT2x3 = 0x8B65,
	FLOAT_MAT2x4 = 0x8B66,
	FLOAT_MAT3x2 = 0x8B67,
	FLOAT_MAT3x4 = 0x8B68,
	FLOAT_MAT4x2 = 0x8B69,
	FLOAT_MAT4x3 = 0x8B6A,

	DOUBLE_MAT2   = 0x8F46,
	DOUBLE_MAT3   = 0x8F47,
	DOUBLE_MAT4   = 0x8F48,
	DOUBLE_MAT2x3 = 0x8F49,
	DOUBLE_MAT2x4 = 0x8F4A,
	DOUBLE_MAT3x2 = 0x8F4B,
	DOUBLE_MAT3x4 = 0x8F4C,
	DOUBLE_MAT4x2 = 0x8F4D,
	DOUBLE_MAT4x3 = 0x8F4E,

	SAMPLER_1D                   = 0x8B5D,
	SAMPLER_2D                   = 0x8B5E,
	SAMPLER_3D                   = 0x8B5F,
	SAMPLER_CUBE                 = 0x8B60,
	SAMPLER_1D_SHADOW            = 0x8B61,
	SAMPLER_2D_SHADOW            = 0x8B62,
	SAMPLER_1D_ARRAY             = 0x8DC0,
	SAMPLER_2D_ARRAY             = 0x8DC1,
	SAMPLER_1D_ARRAY_SHADOW      = 0x8DC3,
	SAMPLER_2D_ARRAY_SHADOW      = 0x8DC4,
	SAMPLER_2D_MULTISAMPLE       = 0x9108,
	SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910B,
	SAMPLER_CUBE_SHADOW          = 0x8DC5,
	SAMPLER_BUFFER               = 0x8DC2,
	SAMPLER_2D_RECT              = 0x8B63,
	SAMPLER_2D_RECT_SHADOW       = 0x8B64,

	INT_SAMPLER_1D                   = 0x8DC9,
	INT_SAMPLER_2D                   = 0x8DCA,
	INT_SAMPLER_3D                   = 0x8DCB,
	INT_SAMPLER_CUBE                 = 0x8DCC,
	INT_SAMPLER_1D_ARRAY             = 0x8DCE,
	INT_SAMPLER_2D_ARRAY             = 0x8DCF,
	INT_SAMPLER_2D_MULTISAMPLE       = 0x9109,
	INT_SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910C,
	INT_SAMPLER_BUFFER               = 0x8DD0,
	INT_SAMPLER_2D_RECT              = 0x8DCD,

	UNSIGNED_INT_SAMPLER_1D                   = 0x8DD1,
	UNSIGNED_INT_SAMPLER_2D                   = 0x8DD2,
	UNSIGNED_INT_SAMPLER_3D                   = 0x8DD3,
	UNSIGNED_INT_SAMPLER_CUBE                 = 0x8DD4,
	UNSIGNED_INT_SAMPLER_1D_ARRAY             = 0x8DD6,
	UNSIGNED_INT_SAMPLER_2D_ARRAY             = 0x8DD7,
	UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE       = 0x910A,
	UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910D,
	UNSIGNED_INT_SAMPLER_BUFFER               = 0x8DD8,
	UNSIGNED_INT_SAMPLER_2D_RECT              = 0x8DD5,

	IMAGE_1D                   = 0x904C,
	IMAGE_2D                   = 0x904D,
	IMAGE_3D                   = 0x904E,
	IMAGE_2D_RECT              = 0x904F,
	IMAGE_CUBE                 = 0x9050,
	IMAGE_BUFFER               = 0x9051,
	IMAGE_1D_ARRAY             = 0x9052,
	IMAGE_2D_ARRAY             = 0x9053,
	IMAGE_CUBE_MAP_ARRAY       = 0x9054,
	IMAGE_2D_MULTISAMPLE       = 0x9055,
	IMAGE_2D_MULTISAMPLE_ARRAY = 0x9056,

	INT_IMAGE_1D                   = 0x9057,
	INT_IMAGE_2D                   = 0x9058,
	INT_IMAGE_3D                   = 0x9059,
	INT_IMAGE_2D_RECT              = 0x905A,
	INT_IMAGE_CUBE                 = 0x905B,
	INT_IMAGE_BUFFER               = 0x905C,
	INT_IMAGE_1D_ARRAY             = 0x905D,
	INT_IMAGE_2D_ARRAY             = 0x905E,
	INT_IMAGE_CUBE_MAP_ARRAY       = 0x905F,
	INT_IMAGE_2D_MULTISAMPLE       = 0x9060,
	INT_IMAGE_2D_MULTISAMPLE_ARRAY = 0x9061,

	UNSIGNED_INT_IMAGE_1D                   = 0x9062,
	UNSIGNED_INT_IMAGE_2D                   = 0x9063,
	UNSIGNED_INT_IMAGE_3D                   = 0x9064,
	UNSIGNED_INT_IMAGE_2D_RECT              = 0x9065,
	UNSIGNED_INT_IMAGE_CUBE                 = 0x9066,
	UNSIGNED_INT_IMAGE_BUFFER               = 0x9067,
	UNSIGNED_INT_IMAGE_1D_ARRAY             = 0x9068,
	UNSIGNED_INT_IMAGE_2D_ARRAY             = 0x9069,
	UNSIGNED_INT_IMAGE_CUBE_MAP_ARRAY       = 0x906A,
	UNSIGNED_INT_IMAGE_2D_MULTISAMPLE       = 0x906B,
	UNSIGNED_INT_IMAGE_2D_MULTISAMPLE_ARRAY = 0x906C,

	UNSIGNED_INT_ATOMIC_COUNTER = 0x92DB,
}

Uniform_Info :: struct {
	location: i32,
	size:     i32,
	kind:     Uniform_Type,
	name:     string, // NOTE: This will need to be freed
}

Uniforms :: map[string]Uniform_Info

destroy_uniforms :: proc(u: Uniforms) {
	for _, v in u {
		delete(v.name)
	}
	delete(u)
}

get_uniforms_from_program :: proc(program: u32) -> (uniforms: Uniforms) {
	uniform_count: i32
	GetProgramiv(program, ACTIVE_UNIFORMS, &uniform_count)

	if uniform_count > 0 {
		reserve(&uniforms, int(uniform_count))
	}

	for i in 0..<uniform_count {
		uniform_info: Uniform_Info

		length: i32
		cname: [256]u8
		GetActiveUniform(program, u32(i), 256, &length, &uniform_info.size, cast(^u32)&uniform_info.kind, &cname[0])

		uniform_info.location = GetUniformLocation(program, cstring(&cname[0]))
		uniform_info.name = strings.clone(string(cname[:length])) // @NOTE: These need to be freed
		uniforms[uniform_info.name] = uniform_info
	}

	return uniforms
}