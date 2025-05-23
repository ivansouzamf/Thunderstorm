package opengl

#assert(size_of(bool) == size_of(u8))

import "base:runtime"
import "core:fmt"
_ :: runtime
_ :: fmt

// VERSION_1_0
CullFace :: proc "c" (mode: u32) { impl_CullFace(mode) }
FrontFace :: proc "c" (mode: u32) { impl_FrontFace(mode) }
Hint :: proc "c" (target, mode: u32) { impl_Hint(target, mode) }
LineWidth :: proc "c" (width: f32) { impl_LineWidth(width) }
PointSize :: proc "c" (size: f32) { impl_PointSize(size) }
PolygonMode :: proc "c" (face, mode: u32) { impl_PolygonMode(face, mode) }
Scissor :: proc "c" (x, y, width, height: i32) { impl_Scissor(x, y, width, height) }
TexParameterf :: proc "c" (target, pname: u32, param: f32) { impl_TexParameterf(target, pname, param) }
TexParameterfv :: proc "c" (target, pname: u32, params: [^]f32) { impl_TexParameterfv(target, pname, params) }
TexParameteri :: proc "c" (target, pname: u32, param: i32) { impl_TexParameteri(target, pname, param) }
TexParameteriv :: proc "c" (target, pname: u32, params: [^]i32) { impl_TexParameteriv(target, pname, params) }
TexImage1D :: proc "c" (target: u32, level, internalformat, width, border: i32, format, type: u32, pixels: rawptr) { impl_TexImage1D(target, level, internalformat, width, border, format, type, pixels) }
TexImage2D :: proc "c" (target: u32, level, internalformat, width, height, border: i32, format, type: u32, pixels: rawptr) { impl_TexImage2D(target, level, internalformat, width, height, border, format, type, pixels) }
DrawBuffer :: proc "c" (buf: u32) { impl_DrawBuffer(buf) }
Clear :: proc "c" (mask: u32) { impl_Clear(mask) }
ClearColor :: proc "c" (red, green, blue, alpha: f32) { impl_ClearColor(red, green, blue, alpha) }
ClearStencil :: proc "c" (s: i32) { impl_ClearStencil(s) }
ClearDepth :: proc "c" (depth: f64) { impl_ClearDepth(depth) }
StencilMask :: proc "c" (mask: u32) { impl_StencilMask(mask) }
ColorMask :: proc "c" (red, green, blue, alpha: bool) { impl_ColorMask(red, green, blue, alpha) }
DepthMask :: proc "c" (flag: bool) { impl_DepthMask(flag) }
Disable :: proc "c" (cap: u32) { impl_Disable(cap) }
Enable :: proc "c" (cap: u32) { impl_Enable(cap) }
Finish :: proc "c" () { impl_Finish() }
Flush :: proc "c" () { impl_Flush() }
BlendFunc :: proc "c" (sfactor, dfactor: u32) { impl_BlendFunc(sfactor, dfactor) }
LogicOp :: proc "c" (opcode: u32) { impl_LogicOp(opcode) }
StencilFunc :: proc "c" (func: u32, ref: i32, mask: u32) { impl_StencilFunc(func, ref, mask) }
StencilOp :: proc "c" (fail, zfail, zpass: u32) { impl_StencilOp(fail, zfail, zpass) }
DepthFunc :: proc "c" (func: u32) { impl_DepthFunc(func) }
PixelStoref :: proc "c" (pname: u32, param: f32) { impl_PixelStoref(pname, param) }
PixelStorei :: proc "c" (pname: u32, param: i32) { impl_PixelStorei(pname, param) }
ReadBuffer :: proc "c" (src: u32) { impl_ReadBuffer(src) }
ReadPixels :: proc "c" (x, y, width, height: i32, format, type: u32, pixels: rawptr) { impl_ReadPixels(x, y, width, height, format, type, pixels) }
GetBooleanv :: proc "c" (pname: u32, data: ^bool) { impl_GetBooleanv(pname, data) }
GetDoublev :: proc "c" (pname: u32, data: ^f64) { impl_GetDoublev(pname, data) }
GetError :: proc "c" () -> u32 { return impl_GetError() }
GetFloatv :: proc "c" (pname: u32, data: ^f32) { impl_GetFloatv(pname, data) }
GetIntegerv :: proc "c" (pname: u32, data: ^i32) { impl_GetIntegerv(pname, data) }
GetString :: proc "c" (name: u32) -> cstring { return impl_GetString(name) }
GetTexImage :: proc "c" (target: u32,  level: i32, format, type: u32, pixels: rawptr) { impl_GetTexImage(target,  level, format, type, pixels) }
GetTexParameterfv :: proc "c" (target, pname: u32, params: [^]f32) { impl_GetTexParameterfv(target, pname, params) }
GetTexParameteriv :: proc "c" (target, pname: u32, params: [^]i32) { impl_GetTexParameteriv(target, pname, params) }
GetTexLevelParameterfv :: proc "c" (target: u32, level: i32, pname: u32, params: [^]f32) { impl_GetTexLevelParameterfv(target, level, pname, params) }
GetTexLevelParameteriv :: proc "c" (target: u32, level: i32, pname: u32, params: [^]i32) { impl_GetTexLevelParameteriv(target, level, pname, params) }
IsEnabled :: proc "c" (cap: u32) -> bool { return impl_IsEnabled(cap) }
DepthRange :: proc "c" (near, far: f64) { impl_DepthRange(near, far) }
Viewport :: proc "c" (x, y, width, height: i32) { impl_Viewport(x, y, width, height) }

// VERSION_1_1
DrawArrays :: proc "c" (mode: u32, first: i32, count: i32) { impl_DrawArrays(mode, first, count) }
DrawElements :: proc "c" (mode: u32, count: i32, type: u32, indices: rawptr) { impl_DrawElements(mode, count, type, indices) }
PolygonOffset :: proc "c" (factor: f32, units: f32) { impl_PolygonOffset(factor, units) }
CopyTexImage1D :: proc "c" (target: u32, level: i32, internalformat: u32, x: i32, y: i32, width: i32, border: i32) { impl_CopyTexImage1D(target, level, internalformat, x, y, width, border) }
CopyTexImage2D :: proc "c" (target: u32, level: i32, internalformat: u32, x: i32, y: i32, width: i32, height: i32, border: i32) { impl_CopyTexImage2D(target, level, internalformat, x, y, width, height, border) }
CopyTexSubImage1D :: proc "c" (target: u32, level: i32, xoffset: i32, x: i32, y: i32, width: i32) { impl_CopyTexSubImage1D(target, level, xoffset, x, y, width) }
CopyTexSubImage2D :: proc "c" (target: u32, level: i32, xoffset: i32, yoffset: i32, x: i32, y: i32, width: i32, height: i32) { impl_CopyTexSubImage2D(target, level, xoffset, yoffset, x, y, width, height) }
TexSubImage1D :: proc "c" (target: u32, level: i32, xoffset: i32, width: i32, format: u32, type: u32, pixels: rawptr) { impl_TexSubImage1D(target, level, xoffset, width, format, type, pixels) }
TexSubImage2D :: proc "c" (target: u32, level: i32, xoffset: i32, yoffset: i32, width: i32, height: i32, format: u32, type: u32, pixels: rawptr) { impl_TexSubImage2D(target, level, xoffset, yoffset, width, height, format, type, pixels) }
BindTexture :: proc "c" (target: u32, texture: u32) { impl_BindTexture(target, texture) }
DeleteTextures :: proc "c" (n: i32, textures: [^]u32) { impl_DeleteTextures(n, textures) }
GenTextures :: proc "c" (n: i32, textures: [^]u32) { impl_GenTextures(n, textures) }
IsTexture :: proc "c" (texture: u32) -> bool { return impl_IsTexture(texture) }

// VERSION_1_2
DrawRangeElements :: proc "c" (mode, start, end: u32, count: i32, type: u32, indices: rawptr) { impl_DrawRangeElements(mode, start, end, count, type, indices) }
TexImage3D :: proc "c" (target: u32, level, internalformat, width, height, depth, border: i32, format, type: u32, data: rawptr) { impl_TexImage3D(target, level, internalformat, width, height, depth, border, format, type, data) }
TexSubImage3D :: proc "c" (target: u32, level, xoffset, yoffset, zoffset, width, height, depth: i32, format, type: u32, pixels: rawptr) { impl_TexSubImage3D(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, pixels) }
CopyTexSubImage3D :: proc "c" (target: u32, level, xoffset, yoffset, zoffset, x, y, width, height: i32) { impl_CopyTexSubImage3D(target, level, xoffset, yoffset, zoffset, x, y, width, height) }

// VERSION_1_3
ActiveTexture :: proc "c" (texture: u32) { impl_ActiveTexture(texture) }
SampleCoverage :: proc "c" (value: f32, invert: bool) { impl_SampleCoverage(value, invert) }
CompressedTexImage3D :: proc "c" (target: u32, level: i32, internalformat: u32, width: i32, height: i32, depth: i32, border: i32, imageSize: i32, data: rawptr) { impl_CompressedTexImage3D(target, level, internalformat, width, height, depth, border, imageSize, data) }
CompressedTexImage2D :: proc "c" (target: u32, level: i32, internalformat: u32, width: i32, height: i32, border: i32, imageSize: i32, data: rawptr) { impl_CompressedTexImage2D(target, level, internalformat, width, height, border, imageSize, data) }
CompressedTexImage1D :: proc "c" (target: u32, level: i32, internalformat: u32, width: i32, border: i32, imageSize: i32, data: rawptr) { impl_CompressedTexImage1D(target, level, internalformat, width, border, imageSize, data) }
CompressedTexSubImage3D :: proc "c" (target: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, width: i32, height: i32, depth: i32, format: u32, imageSize: i32, data: rawptr) { impl_CompressedTexSubImage3D(target, level, xoffset, yoffset, zoffset, width, height, depth, format, imageSize, data) }
CompressedTexSubImage2D :: proc "c" (target: u32, level: i32, xoffset: i32, yoffset: i32, width: i32, height: i32, format: u32, imageSize: i32, data: rawptr) { impl_CompressedTexSubImage2D(target, level, xoffset, yoffset, width, height, format, imageSize, data) }
CompressedTexSubImage1D :: proc "c" (target: u32, level: i32, xoffset: i32, width: i32, format: u32, imageSize: i32, data: rawptr) { impl_CompressedTexSubImage1D(target, level, xoffset, width, format, imageSize, data) }
GetCompressedTexImage :: proc "c" (target: u32, level: i32, img: rawptr) { impl_GetCompressedTexImage(target, level, img) }

// VERSION_1_4
BlendFuncSeparate :: proc "c" (sfactorRGB: u32, dfactorRGB: u32, sfactorAlpha: u32, dfactorAlpha: u32) { impl_BlendFuncSeparate(sfactorRGB, dfactorRGB, sfactorAlpha, dfactorAlpha) }
MultiDrawArrays :: proc "c" (mode: u32, first: [^]i32, count: [^]i32, drawcount: i32) { impl_MultiDrawArrays(mode, first, count, drawcount) }
MultiDrawElements :: proc "c" (mode: u32, count: [^]i32, type: u32, indices: [^]rawptr, drawcount: i32) { impl_MultiDrawElements(mode, count, type, indices, drawcount) }
PointParameterf :: proc "c" (pname: u32, param: f32) { impl_PointParameterf(pname, param) }
PointParameterfv :: proc "c" (pname: u32, params: [^]f32) { impl_PointParameterfv(pname, params) }
PointParameteri :: proc "c" (pname: u32, param: i32) { impl_PointParameteri(pname, param) }
PointParameteriv :: proc "c" (pname: u32, params: [^]i32) { impl_PointParameteriv(pname, params) }
BlendColor :: proc "c" (red: f32, green: f32, blue: f32, alpha: f32) { impl_BlendColor(red, green, blue, alpha) }
BlendEquation :: proc "c" (mode: u32) { impl_BlendEquation(mode) }

// VERSION_1_5
GenQueries :: proc "c" (n: i32, ids: [^]u32) { impl_GenQueries(n, ids) }
DeleteQueries :: proc "c" (n: i32, ids: [^]u32) { impl_DeleteQueries(n, ids) }
IsQuery :: proc "c" (id: u32) -> bool { ret := impl_IsQuery(id); return ret }
BeginQuery :: proc "c" (target: u32, id: u32) { impl_BeginQuery(target, id) }
EndQuery :: proc "c" (target: u32) { impl_EndQuery(target) }
GetQueryiv :: proc "c" (target: u32, pname: u32, params: [^]i32) { impl_GetQueryiv(target, pname, params) }
GetQueryObjectiv :: proc "c" (id: u32, pname: u32, params: [^]i32) { impl_GetQueryObjectiv(id, pname, params) }
GetQueryObjectuiv :: proc "c" (id: u32, pname: u32, params: [^]u32) { impl_GetQueryObjectuiv(id, pname, params) }
BindBuffer :: proc "c" (target: u32, buffer: u32) { impl_BindBuffer(target, buffer) }
DeleteBuffers :: proc "c" (n: i32, buffers: [^]u32) { impl_DeleteBuffers(n, buffers) }
GenBuffers :: proc "c" (n: i32, buffers: [^]u32) { impl_GenBuffers(n, buffers) }
IsBuffer :: proc "c" (buffer: u32) -> bool { ret := impl_IsBuffer(buffer); return ret }
BufferData :: proc "c" (target: u32, size: int, data: rawptr, usage: u32)  { impl_BufferData(target, size, data, usage) }
BufferSubData :: proc "c" (target: u32, offset: int, size: int, data: rawptr) { impl_BufferSubData(target, offset, size, data) }
GetBufferSubData :: proc "c" (target: u32, offset: int, size: int, data: rawptr) { impl_GetBufferSubData(target, offset, size, data) }
MapBuffer :: proc "c" (target: u32, access: u32) -> rawptr { ret := impl_MapBuffer(target, access); return ret }
UnmapBuffer :: proc "c" (target: u32) -> bool { ret := impl_UnmapBuffer(target); return ret }
GetBufferParameteriv :: proc "c" (target: u32, pname: u32, params: [^]i32) { impl_GetBufferParameteriv(target, pname, params) }
GetBufferPointerv :: proc "c" (target: u32, pname: u32, params: [^]rawptr) { impl_GetBufferPointerv(target, pname, params) }

// VERSION_2_0
BlendEquationSeparate :: proc "c" (modeRGB: u32, modeAlpha: u32) { impl_BlendEquationSeparate(modeRGB, modeAlpha) }
DrawBuffers :: proc "c" (n: i32, bufs: [^]u32) { impl_DrawBuffers(n, bufs) }
StencilOpSeparate :: proc "c" (face: u32, sfail: u32, dpfail: u32, dppass: u32) { impl_StencilOpSeparate(face, sfail, dpfail, dppass) }
StencilFuncSeparate :: proc "c" (face: u32, func: u32, ref: i32, mask: u32) { impl_StencilFuncSeparate(face, func, ref, mask) }
StencilMaskSeparate :: proc "c" (face: u32, mask: u32) { impl_StencilMaskSeparate(face, mask) }
AttachShader :: proc "c" (program: u32, shader: u32) { impl_AttachShader(program, shader) }
BindAttribLocation :: proc "c" (program: u32, index: u32, name: cstring) { impl_BindAttribLocation(program, index, name) }
CompileShader :: proc "c" (shader: u32) { impl_CompileShader(shader) }
CreateProgram :: proc "c" () -> u32 { ret := impl_CreateProgram(); return ret }
CreateShader :: proc "c" (type: u32) -> u32 { ret := impl_CreateShader(type); return ret }
DeleteProgram :: proc "c" (program: u32) { impl_DeleteProgram(program) }
DeleteShader :: proc "c" (shader: u32) { impl_DeleteShader(shader) }
DetachShader :: proc "c" (program: u32, shader: u32) { impl_DetachShader(program, shader) }
DisableVertexAttribArray :: proc "c" (index: u32) { impl_DisableVertexAttribArray(index) }
EnableVertexAttribArray :: proc "c" (index: u32) { impl_EnableVertexAttribArray(index) }
GetActiveAttrib :: proc "c" (program: u32, index: u32, bufSize: i32, length: ^i32, size: ^i32, type: ^u32, name: [^]u8)  { impl_GetActiveAttrib(program, index, bufSize, length, size, type, name) }
GetActiveUniform :: proc "c" (program: u32, index: u32, bufSize: i32, length: ^i32, size: ^i32, type: ^u32, name: [^]u8)  { impl_GetActiveUniform(program, index, bufSize, length, size, type, name) }
GetAttachedShaders :: proc "c" (program: u32, maxCount: i32, count: [^]i32, shaders: [^]u32) { impl_GetAttachedShaders(program, maxCount, count, shaders) }
GetAttribLocation :: proc "c" (program: u32, name: cstring) -> i32 { ret := impl_GetAttribLocation(program, name); return ret }
GetProgramiv :: proc "c" (program: u32, pname: u32, params: [^]i32) { impl_GetProgramiv(program, pname, params) }
GetProgramInfoLog :: proc "c" (program: u32, bufSize: i32, length: ^i32, infoLog: [^]u8) { impl_GetProgramInfoLog(program, bufSize, length, infoLog) }
GetShaderiv :: proc "c" (shader: u32, pname: u32, params: [^]i32) { impl_GetShaderiv(shader, pname, params) }
GetShaderInfoLog :: proc "c" (shader: u32, bufSize: i32, length: ^i32, infoLog: [^]u8) { impl_GetShaderInfoLog(shader, bufSize, length, infoLog) }
GetShaderSource :: proc "c" (shader: u32, bufSize: i32, length: ^i32, source: [^]u8) { impl_GetShaderSource(shader, bufSize, length, source) }
GetUniformLocation :: proc "c" (program: u32, name: cstring) -> i32 { ret := impl_GetUniformLocation(program, name); return ret }
GetUniformfv :: proc "c" (program: u32, location: i32, params: [^]f32) { impl_GetUniformfv(program, location, params) }
GetUniformiv :: proc "c" (program: u32, location: i32, params: [^]i32) { impl_GetUniformiv(program, location, params) }
GetVertexAttribdv :: proc "c" (index: u32, pname: u32, params: [^]f64) { impl_GetVertexAttribdv(index, pname, params) }
GetVertexAttribfv :: proc "c" (index: u32, pname: u32, params: [^]f32) { impl_GetVertexAttribfv(index, pname, params) }
GetVertexAttribiv :: proc "c" (index: u32, pname: u32, params: [^]i32) { impl_GetVertexAttribiv(index, pname, params) }
GetVertexAttribPointerv  :: proc "c" (index: u32, pname: u32, pointer: ^uintptr) { impl_GetVertexAttribPointerv(index, pname, pointer) }
IsProgram :: proc "c" (program: u32) -> bool { ret := impl_IsProgram(program); return ret }
IsShader :: proc "c" (shader: u32) -> bool { ret := impl_IsShader(shader); return ret }
LinkProgram :: proc "c" (program: u32) { impl_LinkProgram(program) }
ShaderSource :: proc "c" (shader: u32, count: i32, string: [^]cstring, length: [^]i32) { impl_ShaderSource(shader, count, string, length) }
UseProgram :: proc "c" (program: u32) { impl_UseProgram(program) }
Uniform1f :: proc "c" (location: i32, v0: f32) { impl_Uniform1f(location, v0) }
Uniform2f :: proc "c" (location: i32, v0: f32, v1: f32) { impl_Uniform2f(location, v0, v1) }
Uniform3f :: proc "c" (location: i32, v0: f32, v1: f32, v2: f32) { impl_Uniform3f(location, v0, v1, v2) }
Uniform4f :: proc "c" (location: i32, v0: f32, v1: f32, v2: f32, v3: f32) { impl_Uniform4f(location, v0, v1, v2, v3) }
Uniform1i :: proc "c" (location: i32, v0: i32) { impl_Uniform1i(location, v0) }
Uniform2i :: proc "c" (location: i32, v0: i32, v1: i32) { impl_Uniform2i(location, v0, v1) }
Uniform3i :: proc "c" (location: i32, v0: i32, v1: i32, v2: i32) { impl_Uniform3i(location, v0, v1, v2) }
Uniform4i :: proc "c" (location: i32, v0: i32, v1: i32, v2: i32, v3: i32) { impl_Uniform4i(location, v0, v1, v2, v3) }
Uniform1fv :: proc "c" (location: i32, count: i32, value: [^]f32) { impl_Uniform1fv(location, count, value) }
Uniform2fv :: proc "c" (location: i32, count: i32, value: [^]f32) { impl_Uniform2fv(location, count, value) }
Uniform3fv :: proc "c" (location: i32, count: i32, value: [^]f32) { impl_Uniform3fv(location, count, value) }
Uniform4fv :: proc "c" (location: i32, count: i32, value: [^]f32) { impl_Uniform4fv(location, count, value) }
Uniform1iv :: proc "c" (location: i32, count: i32, value: [^]i32) { impl_Uniform1iv(location, count, value) }
Uniform2iv :: proc "c" (location: i32, count: i32, value: [^]i32) { impl_Uniform2iv(location, count, value) }
Uniform3iv :: proc "c" (location: i32, count: i32, value: [^]i32) { impl_Uniform3iv(location, count, value) }
Uniform4iv :: proc "c" (location: i32, count: i32, value: [^]i32) { impl_Uniform4iv(location, count, value) }
UniformMatrix2fv :: proc "c" (location: i32, count: i32, transpose: bool, value: [^]f32) { impl_UniformMatrix2fv(location, count, transpose, value) }
UniformMatrix3fv :: proc "c" (location: i32, count: i32, transpose: bool, value: [^]f32) { impl_UniformMatrix3fv(location, count, transpose, value) }
UniformMatrix4fv :: proc "c" (location: i32, count: i32, transpose: bool, value: [^]f32) { impl_UniformMatrix4fv(location, count, transpose, value) }
ValidateProgram :: proc "c" (program: u32) { impl_ValidateProgram(program) }
VertexAttrib1d :: proc "c" (index: u32, x: f64) { impl_VertexAttrib1d(index, x) }
VertexAttrib1dv :: proc "c" (index: u32, v: ^f64) { impl_VertexAttrib1dv(index, v) }
VertexAttrib1f :: proc "c" (index: u32, x: f32) { impl_VertexAttrib1f(index, x) }
VertexAttrib1fv :: proc "c" (index: u32, v: ^f32) { impl_VertexAttrib1fv(index, v) }
VertexAttrib1s :: proc "c" (index: u32, x: i16) { impl_VertexAttrib1s(index, x) }
VertexAttrib1sv :: proc "c" (index: u32, v: ^i16) { impl_VertexAttrib1sv(index, v) }
VertexAttrib2d :: proc "c" (index: u32, x: f64, y: f64) { impl_VertexAttrib2d(index, x, y) }
VertexAttrib2dv :: proc "c" (index: u32, v: ^[2]f64) { impl_VertexAttrib2dv(index, v) }
VertexAttrib2f :: proc "c" (index: u32, x: f32, y: f32) { impl_VertexAttrib2f(index, x, y) }
VertexAttrib2fv :: proc "c" (index: u32, v: ^[2]f32) { impl_VertexAttrib2fv(index, v) }
VertexAttrib2s :: proc "c" (index: u32, x: i16, y: i16) { impl_VertexAttrib2s(index, x, y) }
VertexAttrib2sv :: proc "c" (index: u32, v: ^[2]i16) { impl_VertexAttrib2sv(index, v) }
VertexAttrib3d :: proc "c" (index: u32, x: f64, y: f64, z: f64) { impl_VertexAttrib3d(index, x, y, z) }
VertexAttrib3dv :: proc "c" (index: u32, v: ^[3]f64) { impl_VertexAttrib3dv(index, v) }
VertexAttrib3f :: proc "c" (index: u32, x: f32, y: f32, z: f32) { impl_VertexAttrib3f(index, x, y, z) }
VertexAttrib3fv :: proc "c" (index: u32, v: ^[3]f32) { impl_VertexAttrib3fv(index, v) }
VertexAttrib3s :: proc "c" (index: u32, x: i16, y: i16, z: i16) { impl_VertexAttrib3s(index, x, y, z) }
VertexAttrib3sv :: proc "c" (index: u32, v: ^[3]i16) { impl_VertexAttrib3sv(index, v) }
VertexAttrib4Nbv :: proc "c" (index: u32, v: ^[4]i8) { impl_VertexAttrib4Nbv(index, v) }
VertexAttrib4Niv :: proc "c" (index: u32, v: ^[4]i32) { impl_VertexAttrib4Niv(index, v) }
VertexAttrib4Nsv :: proc "c" (index: u32, v: ^[4]i16) { impl_VertexAttrib4Nsv(index, v) }
VertexAttrib4Nub :: proc "c" (index: u32, x: u8, y: u8, z: u8, w: u8) { impl_VertexAttrib4Nub(index, x, y, z, w) }
VertexAttrib4Nubv :: proc "c" (index: u32, v: ^[4]u8) { impl_VertexAttrib4Nubv(index, v) }
VertexAttrib4Nuiv :: proc "c" (index: u32, v: ^[4]u32) { impl_VertexAttrib4Nuiv(index, v) }
VertexAttrib4Nusv :: proc "c" (index: u32, v: ^[4]u16) { impl_VertexAttrib4Nusv(index, v) }
VertexAttrib4bv :: proc "c" (index: u32, v: ^[4]i8) { impl_VertexAttrib4bv(index, v) }
VertexAttrib4d :: proc "c" (index: u32, x: f64, y: f64, z: f64, w: f64) { impl_VertexAttrib4d(index, x, y, z, w) }
VertexAttrib4dv :: proc "c" (index: u32, v: ^[4]f64) { impl_VertexAttrib4dv(index, v) }
VertexAttrib4f :: proc "c" (index: u32, x: f32, y: f32, z: f32, w: f32) { impl_VertexAttrib4f(index, x, y, z, w) }
VertexAttrib4fv :: proc "c" (index: u32, v: ^[4]f32) { impl_VertexAttrib4fv(index, v) }
VertexAttrib4iv :: proc "c" (index: u32, v: ^[4]i32) { impl_VertexAttrib4iv(index, v) }
VertexAttrib4s :: proc "c" (index: u32, x: i16, y: i16, z: i16, w: i16) { impl_VertexAttrib4s(index, x, y, z, w) }
VertexAttrib4sv :: proc "c" (index: u32, v: ^[4]i16) { impl_VertexAttrib4sv(index, v) }
VertexAttrib4ubv :: proc "c" (index: u32, v: ^[4]u8) { impl_VertexAttrib4ubv(index, v) }
VertexAttrib4uiv :: proc "c" (index: u32, v: ^[4]u32) { impl_VertexAttrib4uiv(index, v) }
VertexAttrib4usv :: proc "c" (index: u32, v: ^[4]u16) { impl_VertexAttrib4usv(index, v) }
VertexAttribPointer :: proc "c" (index: u32, size: i32, type: u32, normalized: bool, stride: i32, pointer: uintptr) { impl_VertexAttribPointer(index, size, type, normalized, stride, pointer) }

// VERSION_2_1
UniformMatrix2x3fv :: proc "c" (location: i32, count: i32, transpose: bool, value: [^]f32) { impl_UniformMatrix2x3fv(location, count, transpose, value) }
UniformMatrix3x2fv :: proc "c" (location: i32, count: i32, transpose: bool, value: [^]f32) { impl_UniformMatrix3x2fv(location, count, transpose, value) }
UniformMatrix2x4fv :: proc "c" (location: i32, count: i32, transpose: bool, value: [^]f32) { impl_UniformMatrix2x4fv(location, count, transpose, value) }
UniformMatrix4x2fv :: proc "c" (location: i32, count: i32, transpose: bool, value: [^]f32) { impl_UniformMatrix4x2fv(location, count, transpose, value) }
UniformMatrix3x4fv :: proc "c" (location: i32, count: i32, transpose: bool, value: [^]f32) { impl_UniformMatrix3x4fv(location, count, transpose, value) }
UniformMatrix4x3fv :: proc "c" (location: i32, count: i32, transpose: bool, value: [^]f32) { impl_UniformMatrix4x3fv(location, count, transpose, value) }


// VERSION_3_0
ColorMaski :: proc "c" (index: u32, r: bool, g: bool, b: bool, a: bool) { impl_ColorMaski(index, r, g, b, a) }
GetBooleani_v :: proc "c" (target: u32, index: u32, data: ^bool) { impl_GetBooleani_v(target, index, data) }
GetIntegeri_v :: proc "c" (target: u32, index: u32, data: ^i32) { impl_GetIntegeri_v(target, index, data) }
Enablei :: proc "c" (target: u32, index: u32) { impl_Enablei(target, index) }
Disablei :: proc "c" (target: u32, index: u32) { impl_Disablei(target, index) }
IsEnabledi :: proc "c" (target: u32, index: u32) -> bool { ret := impl_IsEnabledi(target, index); return ret }
BeginTransformFeedback :: proc "c" (primitiveMode: u32) { impl_BeginTransformFeedback(primitiveMode) }
EndTransformFeedback :: proc "c" () { impl_EndTransformFeedback() }
BindBufferRange :: proc "c" (target: u32, index: u32, buffer: u32, offset: int, size: int) { impl_BindBufferRange(target, index, buffer, offset, size) }
BindBufferBase :: proc "c" (target: u32, index: u32, buffer: u32) { impl_BindBufferBase(target, index, buffer) }
TransformFeedbackVaryings :: proc "c" (program: u32, count: i32, varyings: [^]cstring, bufferMode: u32) { impl_TransformFeedbackVaryings(program, count, varyings, bufferMode) }
GetTransformFeedbackVarying :: proc "c" (program: u32, index: u32, bufSize: i32, length: ^i32, size: ^i32, type: ^u32, name: [^]u8) { impl_GetTransformFeedbackVarying(program, index, bufSize, length, size, type, name) }
ClampColor :: proc "c" (target: u32, clamp: u32) { impl_ClampColor(target, clamp) }
BeginConditionalRender :: proc "c" (id: u32, mode: u32) { impl_BeginConditionalRender(id, mode) }
EndConditionalRender :: proc "c" () { impl_EndConditionalRender() }
VertexAttribIPointer :: proc "c" (index: u32, size: i32, type: u32, stride: i32, pointer: uintptr) { impl_VertexAttribIPointer(index, size, type, stride, pointer) }
GetVertexAttribIiv :: proc "c" (index: u32, pname: u32, params: [^]i32) { impl_GetVertexAttribIiv(index, pname, params) }
GetVertexAttribIuiv :: proc "c" (index: u32, pname: u32, params: [^]u32) { impl_GetVertexAttribIuiv(index, pname, params) }
VertexAttribI1i :: proc "c" (index: u32, x: i32) { impl_VertexAttribI1i(index, x) }
VertexAttribI2i :: proc "c" (index: u32, x: i32, y: i32) { impl_VertexAttribI2i(index, x, y) }
VertexAttribI3i :: proc "c" (index: u32, x: i32, y: i32, z: i32) { impl_VertexAttribI3i(index, x, y, z) }
VertexAttribI4i :: proc "c" (index: u32, x: i32, y: i32, z: i32, w: i32) { impl_VertexAttribI4i(index, x, y, z, w) }
VertexAttribI1ui :: proc "c" (index: u32, x: u32) { impl_VertexAttribI1ui(index, x) }
VertexAttribI2ui :: proc "c" (index: u32, x: u32, y: u32) { impl_VertexAttribI2ui(index, x, y) }
VertexAttribI3ui :: proc "c" (index: u32, x: u32, y: u32, z: u32) { impl_VertexAttribI3ui(index, x, y, z) }
VertexAttribI4ui :: proc "c" (index: u32, x: u32, y: u32, z: u32, w: u32) { impl_VertexAttribI4ui(index, x, y, z, w) }
VertexAttribI1iv :: proc "c" (index: u32, v: [^]i32) { impl_VertexAttribI1iv(index, v) }
VertexAttribI2iv :: proc "c" (index: u32, v: [^]i32) { impl_VertexAttribI2iv(index, v) }
VertexAttribI3iv :: proc "c" (index: u32, v: [^]i32) { impl_VertexAttribI3iv(index, v) }
VertexAttribI4iv :: proc "c" (index: u32, v: [^]i32) { impl_VertexAttribI4iv(index, v) }
VertexAttribI1uiv :: proc "c" (index: u32, v: [^]u32) { impl_VertexAttribI1uiv(index, v) }
VertexAttribI2uiv :: proc "c" (index: u32, v: [^]u32) { impl_VertexAttribI2uiv(index, v) }
VertexAttribI3uiv :: proc "c" (index: u32, v: [^]u32) { impl_VertexAttribI3uiv(index, v) }
VertexAttribI4uiv :: proc "c" (index: u32, v: [^]u32) { impl_VertexAttribI4uiv(index, v) }
VertexAttribI4bv :: proc "c" (index: u32, v: [^]i8) { impl_VertexAttribI4bv(index, v) }
VertexAttribI4sv :: proc "c" (index: u32, v: [^]i16) { impl_VertexAttribI4sv(index, v) }
VertexAttribI4ubv :: proc "c" (index: u32, v: [^]u8) { impl_VertexAttribI4ubv(index, v) }
VertexAttribI4usv :: proc "c" (index: u32, v: [^]u16) { impl_VertexAttribI4usv(index, v) }
GetUniformuiv :: proc "c" (program: u32, location: i32, params: [^]u32) { impl_GetUniformuiv(program, location, params) }
BindFragDataLocation :: proc "c" (program: u32, color: u32, name: cstring) { impl_BindFragDataLocation(program, color, name) }
GetFragDataLocation :: proc "c" (program: u32, name: cstring) -> i32 { ret := impl_GetFragDataLocation(program, name); return ret }
Uniform1ui :: proc "c" (location: i32, v0: u32) { impl_Uniform1ui(location, v0) }
Uniform2ui :: proc "c" (location: i32, v0: u32, v1: u32) { impl_Uniform2ui(location, v0, v1) }
Uniform3ui :: proc "c" (location: i32, v0: u32, v1: u32, v2: u32) { impl_Uniform3ui(location, v0, v1, v2) }
Uniform4ui :: proc "c" (location: i32, v0: u32, v1: u32, v2: u32, v3: u32) { impl_Uniform4ui(location, v0, v1, v2, v3) }
Uniform1uiv :: proc "c" (location: i32, count: i32, value: [^]u32) { impl_Uniform1uiv(location, count, value) }
Uniform2uiv :: proc "c" (location: i32, count: i32, value: [^]u32) { impl_Uniform2uiv(location, count, value) }
Uniform3uiv :: proc "c" (location: i32, count: i32, value: [^]u32) { impl_Uniform3uiv(location, count, value) }
Uniform4uiv :: proc "c" (location: i32, count: i32, value: [^]u32) { impl_Uniform4uiv(location, count, value) }
TexParameterIiv :: proc "c" (target: u32, pname: u32, params: [^]i32) { impl_TexParameterIiv(target, pname, params) }
TexParameterIuiv :: proc "c" (target: u32, pname: u32, params: [^]u32) { impl_TexParameterIuiv(target, pname, params) }
GetTexParameterIiv :: proc "c" (target: u32, pname: u32, params: [^]i32) { impl_GetTexParameterIiv(target, pname, params) }
GetTexParameterIuiv :: proc "c" (target: u32, pname: u32, params: [^]u32) { impl_GetTexParameterIuiv(target, pname, params) }
ClearBufferiv :: proc "c" (buffer: u32, drawbuffer: i32, value: ^i32) { impl_ClearBufferiv(buffer, drawbuffer, value) }
ClearBufferuiv :: proc "c" (buffer: u32, drawbuffer: i32, value: ^u32) { impl_ClearBufferuiv(buffer, drawbuffer, value) }
ClearBufferfv :: proc "c" (buffer: u32, drawbuffer: i32, value: ^f32) { impl_ClearBufferfv(buffer, drawbuffer, value) }
ClearBufferfi :: proc "c" (buffer: u32, drawbuffer: i32, depth: f32, stencil: i32) -> rawptr { ret := impl_ClearBufferfi(buffer, drawbuffer, depth, stencil); return ret }
GetStringi :: proc "c" (name: u32, index: u32) -> cstring { ret := impl_GetStringi(name, index); return ret }
IsRenderbuffer :: proc "c" (renderbuffer: u32) -> bool { ret := impl_IsRenderbuffer(renderbuffer); return ret }
BindRenderbuffer :: proc "c" (target: u32, renderbuffer: u32) { impl_BindRenderbuffer(target, renderbuffer) }
DeleteRenderbuffers :: proc "c" (n: i32, renderbuffers: [^]u32) { impl_DeleteRenderbuffers(n, renderbuffers) }
GenRenderbuffers :: proc "c" (n: i32, renderbuffers: [^]u32) { impl_GenRenderbuffers(n, renderbuffers) }
RenderbufferStorage :: proc "c" (target: u32, internalformat: u32, width: i32, height: i32) { impl_RenderbufferStorage(target, internalformat, width, height) }
GetRenderbufferParameteriv :: proc "c" (target: u32, pname: u32, params: [^]i32) { impl_GetRenderbufferParameteriv(target, pname, params) }
IsFramebuffer :: proc "c" (framebuffer: u32) -> bool { ret := impl_IsFramebuffer(framebuffer); return ret }
BindFramebuffer :: proc "c" (target: u32, framebuffer: u32) { impl_BindFramebuffer(target, framebuffer) }
DeleteFramebuffers :: proc "c" (n: i32, framebuffers: [^]u32) { impl_DeleteFramebuffers(n, framebuffers) }
GenFramebuffers :: proc "c" (n: i32, framebuffers: [^]u32) { impl_GenFramebuffers(n, framebuffers) }
CheckFramebufferStatus :: proc "c" (target: u32) -> u32 { ret := impl_CheckFramebufferStatus(target); return ret }
FramebufferTexture1D :: proc "c" (target: u32, attachment: u32, textarget: u32, texture: u32, level: i32) { impl_FramebufferTexture1D(target, attachment, textarget, texture, level) }
FramebufferTexture2D :: proc "c" (target: u32, attachment: u32, textarget: u32, texture: u32, level: i32) { impl_FramebufferTexture2D(target, attachment, textarget, texture, level) }
FramebufferTexture3D :: proc "c" (target: u32, attachment: u32, textarget: u32, texture: u32, level: i32, zoffset: i32) { impl_FramebufferTexture3D(target, attachment, textarget, texture, level, zoffset) }
FramebufferRenderbuffer :: proc "c" (target: u32, attachment: u32, renderbuffertarget: u32, renderbuffer: u32) { impl_FramebufferRenderbuffer(target, attachment, renderbuffertarget, renderbuffer) }
GetFramebufferAttachmentParameteriv :: proc "c" (target: u32, attachment: u32, pname: u32, params: [^]i32) { impl_GetFramebufferAttachmentParameteriv(target, attachment, pname, params) }
GenerateMipmap :: proc "c" (target: u32) { impl_GenerateMipmap(target) }
BlitFramebuffer :: proc "c" (srcX0: i32, srcY0: i32, srcX1: i32, srcY1: i32, dstX0: i32, dstY0: i32, dstX1: i32, dstY1: i32, mask: u32, filter: u32) { impl_BlitFramebuffer(srcX0, srcY0, srcX1, srcY1, dstX0, dstY0, dstX1, dstY1, mask, filter) }
RenderbufferStorageMultisample :: proc "c" (target: u32, samples: i32, internalformat: u32, width: i32, height: i32) { impl_RenderbufferStorageMultisample(target, samples, internalformat, width, height) }
FramebufferTextureLayer :: proc "c" (target: u32, attachment: u32, texture: u32, level: i32, layer: i32) { impl_FramebufferTextureLayer(target, attachment, texture, level, layer) }
MapBufferRange :: proc "c" (target: u32, offset: int, length: int, access: u32) -> rawptr { ret := impl_MapBufferRange(target, offset, length, access); return ret }
FlushMappedBufferRange :: proc "c" (target: u32, offset: int, length: int) { impl_FlushMappedBufferRange(target, offset, length) }
BindVertexArray :: proc "c" (array: u32) { impl_BindVertexArray(array) }
DeleteVertexArrays :: proc "c" (n: i32, arrays: [^]u32) { impl_DeleteVertexArrays(n, arrays) }
GenVertexArrays :: proc "c" (n: i32, arrays: [^]u32) { impl_GenVertexArrays(n, arrays) }
IsVertexArray :: proc "c" (array: u32) -> bool { ret := impl_IsVertexArray(array); return ret }

// VERSION_3_1
DrawArraysInstanced :: proc "c" (mode: u32, first: i32, count: i32, instancecount: i32) { impl_DrawArraysInstanced(mode, first, count, instancecount) }
DrawElementsInstanced :: proc "c" (mode: u32, count: i32, type: u32, indices: rawptr, instancecount: i32) { impl_DrawElementsInstanced(mode, count, type, indices, instancecount) }
TexBuffer :: proc "c" (target: u32, internalformat: u32, buffer: u32) { impl_TexBuffer(target, internalformat, buffer) }
PrimitiveRestartIndex :: proc "c" (index: u32) { impl_PrimitiveRestartIndex(index) }
CopyBufferSubData :: proc "c" (readTarget: u32, writeTarget: u32, readOffset: int, writeOffset: int, size: int) { impl_CopyBufferSubData(readTarget, writeTarget, readOffset, writeOffset, size) }
GetUniformIndices :: proc "c" (program: u32, uniformCount: i32, uniformNames: [^]cstring, uniformIndices: [^]u32) { impl_GetUniformIndices(program, uniformCount, uniformNames, uniformIndices) }
GetActiveUniformsiv :: proc "c" (program: u32, uniformCount: i32, uniformIndices: [^]u32, pname: u32, params: [^]i32) { impl_GetActiveUniformsiv(program, uniformCount, uniformIndices, pname, params) }
GetActiveUniformName :: proc "c" (program: u32, uniformIndex: u32, bufSize: i32, length: ^i32, uniformName: [^]u8) { impl_GetActiveUniformName(program, uniformIndex, bufSize, length, uniformName) }
GetUniformBlockIndex :: proc "c" (program: u32, uniformBlockName: cstring) -> u32 { ret := impl_GetUniformBlockIndex(program, uniformBlockName); return ret }
GetActiveUniformBlockiv :: proc "c" (program: u32, uniformBlockIndex: u32, pname: u32, params: [^]i32) { impl_GetActiveUniformBlockiv(program, uniformBlockIndex, pname, params) }
GetActiveUniformBlockName :: proc "c" (program: u32, uniformBlockIndex: u32, bufSize: i32, length: ^i32, uniformBlockName: [^]u8) { impl_GetActiveUniformBlockName(program, uniformBlockIndex, bufSize, length, uniformBlockName) }
UniformBlockBinding :: proc "c" (program: u32, uniformBlockIndex: u32, uniformBlockBinding: u32) { impl_UniformBlockBinding(program, uniformBlockIndex, uniformBlockBinding) }

// VERSION_3_2
DrawElementsBaseVertex :: proc "c" (mode: u32, count: i32, type: u32, indices: rawptr, basevertex: i32) { impl_DrawElementsBaseVertex(mode, count, type, indices, basevertex) }
DrawRangeElementsBaseVertex :: proc "c" (mode: u32, start: u32, end: u32, count: i32, type: u32, indices: rawptr, basevertex: i32) { impl_DrawRangeElementsBaseVertex(mode, start, end, count, type, indices, basevertex) }
DrawElementsInstancedBaseVertex :: proc "c" (mode: u32, count: i32, type: u32, indices: rawptr, instancecount: i32, basevertex: i32) { impl_DrawElementsInstancedBaseVertex(mode, count, type, indices, instancecount, basevertex) }
MultiDrawElementsBaseVertex :: proc "c" (mode: u32, count: [^]i32, type: u32, indices: [^]rawptr, drawcount: i32, basevertex: [^]i32) { impl_MultiDrawElementsBaseVertex(mode, count, type, indices, drawcount, basevertex) }
ProvokingVertex :: proc "c" (mode: u32) { impl_ProvokingVertex(mode) }
FenceSync :: proc "c" (condition: u32, flags: u32) -> sync_t { ret := impl_FenceSync(condition, flags); return ret }
IsSync :: proc "c" (sync: sync_t) -> bool { ret := impl_IsSync(sync); return ret }
DeleteSync :: proc "c" (sync: sync_t) { impl_DeleteSync(sync) }
ClientWaitSync :: proc "c" (sync: sync_t, flags: u32, timeout: u64) -> u32 { ret := impl_ClientWaitSync(sync, flags, timeout); return ret }
WaitSync :: proc "c" (sync: sync_t, flags: u32, timeout: u64) { impl_WaitSync(sync, flags, timeout) }
GetInteger64v :: proc "c" (pname: u32, data: ^i64) { impl_GetInteger64v(pname, data) }
GetSynciv :: proc "c" (sync: sync_t, pname: u32, bufSize: i32, length: ^i32, values: [^]i32) { impl_GetSynciv(sync, pname, bufSize, length, values) }
GetInteger64i_v :: proc "c" (target: u32, index: u32, data: ^i64) { impl_GetInteger64i_v(target, index, data) }
GetBufferParameteri64v :: proc "c" (target: u32, pname: u32, params: [^]i64) { impl_GetBufferParameteri64v(target, pname, params) }
FramebufferTexture :: proc "c" (target: u32, attachment: u32, texture: u32, level: i32) { impl_FramebufferTexture(target, attachment, texture, level) }
TexImage2DMultisample :: proc "c" (target: u32, samples: i32, internalformat: u32, width: i32, height: i32, fixedsamplelocations: bool) { impl_TexImage2DMultisample(target, samples, internalformat, width, height, fixedsamplelocations) }
TexImage3DMultisample :: proc "c" (target: u32, samples: i32, internalformat: u32, width: i32, height: i32, depth: i32, fixedsamplelocations: bool) { impl_TexImage3DMultisample(target, samples, internalformat, width, height, depth, fixedsamplelocations) }
GetMultisamplefv :: proc "c" (pname: u32, index: u32, val: ^f32) { impl_GetMultisamplefv(pname, index, val) }
SampleMaski :: proc "c" (maskNumber: u32, mask: u32) { impl_SampleMaski(maskNumber, mask) }

// VERSION_3_3
BindFragDataLocationIndexed :: proc "c" (program: u32, colorNumber: u32, index: u32, name: cstring) { impl_BindFragDataLocationIndexed(program, colorNumber, index, name) }
GetFragDataIndex :: proc "c" (program: u32, name: cstring) -> i32 { ret := impl_GetFragDataIndex(program, name); return ret }
GenSamplers :: proc "c" (count: i32, samplers: [^]u32) { impl_GenSamplers(count, samplers) }
DeleteSamplers :: proc "c" (count: i32, samplers: [^]u32) { impl_DeleteSamplers(count, samplers) }
IsSampler :: proc "c" (sampler: u32) -> bool { ret := impl_IsSampler(sampler); return ret }
BindSampler :: proc "c" (unit: u32, sampler: u32) { impl_BindSampler(unit, sampler) }
SamplerParameteri :: proc "c" (sampler: u32, pname: u32, param: i32) { impl_SamplerParameteri(sampler, pname, param) }
SamplerParameteriv :: proc "c" (sampler: u32, pname: u32, param: ^i32) { impl_SamplerParameteriv(sampler, pname, param) }
SamplerParameterf :: proc "c" (sampler: u32, pname: u32, param: f32) { impl_SamplerParameterf(sampler, pname, param) }
SamplerParameterfv :: proc "c" (sampler: u32, pname: u32, param: ^f32) { impl_SamplerParameterfv(sampler, pname, param) }
SamplerParameterIiv :: proc "c" (sampler: u32, pname: u32, param: ^i32) { impl_SamplerParameterIiv(sampler, pname, param) }
SamplerParameterIuiv :: proc "c" (sampler: u32, pname: u32, param: ^u32) { impl_SamplerParameterIuiv(sampler, pname, param) }
GetSamplerParameteriv :: proc "c" (sampler: u32, pname: u32, params: [^]i32) { impl_GetSamplerParameteriv(sampler, pname, params) }
GetSamplerParameterIiv :: proc "c" (sampler: u32, pname: u32, params: [^]i32) { impl_GetSamplerParameterIiv(sampler, pname, params) }
GetSamplerParameterfv :: proc "c" (sampler: u32, pname: u32, params: [^]f32) { impl_GetSamplerParameterfv(sampler, pname, params) }
GetSamplerParameterIuiv :: proc "c" (sampler: u32, pname: u32, params: [^]u32) { impl_GetSamplerParameterIuiv(sampler, pname, params) }
QueryCounter :: proc "c" (id: u32, target: u32) { impl_QueryCounter(id, target) }
GetQueryObjecti64v :: proc "c" (id: u32, pname: u32, params: [^]i64) { impl_GetQueryObjecti64v(id, pname, params) }
GetQueryObjectui64v :: proc "c" (id: u32, pname: u32, params: [^]u64) { impl_GetQueryObjectui64v(id, pname, params) }
VertexAttribDivisor :: proc "c" (index: u32, divisor: u32) { impl_VertexAttribDivisor(index, divisor) }
VertexAttribP1ui :: proc "c" (index: u32, type: u32, normalized: bool, value: u32) { impl_VertexAttribP1ui(index, type, normalized, value) }
VertexAttribP1uiv :: proc "c" (index: u32, type: u32, normalized: bool, value: ^u32) { impl_VertexAttribP1uiv(index, type, normalized, value) }
VertexAttribP2ui :: proc "c" (index: u32, type: u32, normalized: bool, value: u32) { impl_VertexAttribP2ui(index, type, normalized, value) }
VertexAttribP2uiv :: proc "c" (index: u32, type: u32, normalized: bool, value: ^u32) { impl_VertexAttribP2uiv(index, type, normalized, value) }
VertexAttribP3ui :: proc "c" (index: u32, type: u32, normalized: bool, value: u32) { impl_VertexAttribP3ui(index, type, normalized, value) }
VertexAttribP3uiv :: proc "c" (index: u32, type: u32, normalized: bool, value: ^u32) { impl_VertexAttribP3uiv(index, type, normalized, value) }
VertexAttribP4ui :: proc "c" (index: u32, type: u32, normalized: bool, value: u32) { impl_VertexAttribP4ui(index, type, normalized, value) }
VertexAttribP4uiv :: proc "c" (index: u32, type: u32, normalized: bool, value: ^u32) { impl_VertexAttribP4uiv(index, type, normalized, value) }
VertexP2ui :: proc "c" (type: u32, value: u32) { impl_VertexP2ui(type, value) }
VertexP2uiv :: proc "c" (type: u32, value: ^u32) { impl_VertexP2uiv(type, value) }
VertexP3ui :: proc "c" (type: u32, value: u32) { impl_VertexP3ui(type, value) }
VertexP3uiv :: proc "c" (type: u32, value: ^u32) { impl_VertexP3uiv(type, value) }
VertexP4ui :: proc "c" (type: u32, value: u32) { impl_VertexP4ui(type, value) }
VertexP4uiv :: proc "c" (type: u32, value: ^u32) { impl_VertexP4uiv(type, value) }
TexCoordP1ui :: proc "c" (type: u32, coords: u32) { impl_TexCoordP1ui(type, coords) }
TexCoordP1uiv :: proc "c" (type: u32, coords: [^]u32) { impl_TexCoordP1uiv(type, coords) }
TexCoordP2ui :: proc "c" (type: u32, coords: u32) { impl_TexCoordP2ui(type, coords) }
TexCoordP2uiv :: proc "c" (type: u32, coords: [^]u32) { impl_TexCoordP2uiv(type, coords) }
TexCoordP3ui :: proc "c" (type: u32, coords: u32) { impl_TexCoordP3ui(type, coords) }
TexCoordP3uiv :: proc "c" (type: u32, coords: [^]u32) { impl_TexCoordP3uiv(type, coords) }
TexCoordP4ui :: proc "c" (type: u32, coords: u32) { impl_TexCoordP4ui(type, coords) }
TexCoordP4uiv :: proc "c" (type: u32, coords: [^]u32) { impl_TexCoordP4uiv(type, coords) }
MultiTexCoordP1ui :: proc "c" (texture: u32, type: u32, coords: u32) { impl_MultiTexCoordP1ui(texture, type, coords) }
MultiTexCoordP1uiv :: proc "c" (texture: u32, type: u32, coords: [^]u32) { impl_MultiTexCoordP1uiv(texture, type, coords) }
MultiTexCoordP2ui :: proc "c" (texture: u32, type: u32, coords: u32) { impl_MultiTexCoordP2ui(texture, type, coords) }
MultiTexCoordP2uiv :: proc "c" (texture: u32, type: u32, coords: [^]u32) { impl_MultiTexCoordP2uiv(texture, type, coords) }
MultiTexCoordP3ui :: proc "c" (texture: u32, type: u32, coords: u32) { impl_MultiTexCoordP3ui(texture, type, coords) }
MultiTexCoordP3uiv :: proc "c" (texture: u32, type: u32, coords: [^]u32) { impl_MultiTexCoordP3uiv(texture, type, coords) }
MultiTexCoordP4ui :: proc "c" (texture: u32, type: u32, coords: u32) { impl_MultiTexCoordP4ui(texture, type, coords) }
MultiTexCoordP4uiv :: proc "c" (texture: u32, type: u32, coords: [^]u32) { impl_MultiTexCoordP4uiv(texture, type, coords) }
NormalP3ui :: proc "c" (type: u32, coords: u32) { impl_NormalP3ui(type, coords) }
NormalP3uiv :: proc "c" (type: u32, coords: [^]u32) { impl_NormalP3uiv(type, coords) }
ColorP3ui :: proc "c" (type: u32, color: u32) { impl_ColorP3ui(type, color) }
ColorP3uiv :: proc "c" (type: u32, color: ^u32) { impl_ColorP3uiv(type, color) }
ColorP4ui :: proc "c" (type: u32, color: u32) { impl_ColorP4ui(type, color) }
ColorP4uiv :: proc "c" (type: u32, color: ^u32) { impl_ColorP4uiv(type, color) }
SecondaryColorP3ui :: proc "c" (type: u32, color: u32) { impl_SecondaryColorP3ui(type, color) }
SecondaryColorP3uiv :: proc "c" (type: u32, color: ^u32) { impl_SecondaryColorP3uiv(type, color) }

// VERSION_4_0
MinSampleShading :: proc "c" (value: f32) { impl_MinSampleShading(value) }
BlendEquationi :: proc "c" (buf: u32, mode: u32) { impl_BlendEquationi(buf, mode) }
BlendEquationSeparatei :: proc "c" (buf: u32, modeRGB: u32, modeAlpha: u32) { impl_BlendEquationSeparatei(buf, modeRGB, modeAlpha) }
BlendFunci :: proc "c" (buf: u32, src: u32, dst: u32) { impl_BlendFunci(buf, src, dst) }
BlendFuncSeparatei :: proc "c" (buf: u32, srcRGB: u32, dstRGB: u32, srcAlpha: u32, dstAlpha: u32) { impl_BlendFuncSeparatei(buf, srcRGB, dstRGB, srcAlpha, dstAlpha) }
DrawArraysIndirect :: proc "c" (mode: u32, indirect: ^DrawArraysIndirectCommand) { impl_DrawArraysIndirect(mode, indirect) }
DrawElementsIndirect :: proc "c" (mode: u32, type: u32, indirect: ^DrawElementsIndirectCommand) { impl_DrawElementsIndirect(mode, type, indirect) }
Uniform1d :: proc "c" (location: i32, x: f64) { impl_Uniform1d(location, x) }
Uniform2d :: proc "c" (location: i32, x: f64, y: f64) { impl_Uniform2d(location, x, y) }
Uniform3d :: proc "c" (location: i32, x: f64, y: f64, z: f64) { impl_Uniform3d(location, x, y, z) }
Uniform4d :: proc "c" (location: i32, x: f64, y: f64, z: f64, w: f64) { impl_Uniform4d(location, x, y, z, w) }
Uniform1dv :: proc "c" (location: i32, count: i32, value: [^]f64) { impl_Uniform1dv(location, count, value) }
Uniform2dv :: proc "c" (location: i32, count: i32, value: [^]f64) { impl_Uniform2dv(location, count, value) }
Uniform3dv :: proc "c" (location: i32, count: i32, value: [^]f64) { impl_Uniform3dv(location, count, value) }
Uniform4dv :: proc "c" (location: i32, count: i32, value: [^]f64) { impl_Uniform4dv(location, count, value) }
UniformMatrix2dv :: proc "c" (location: i32, count: i32, transpose: bool, value: [^]f64) { impl_UniformMatrix2dv(location, count, transpose, value) }
UniformMatrix3dv :: proc "c" (location: i32, count: i32, transpose: bool, value: [^]f64) { impl_UniformMatrix3dv(location, count, transpose, value) }
UniformMatrix4dv :: proc "c" (location: i32, count: i32, transpose: bool, value: [^]f64) { impl_UniformMatrix4dv(location, count, transpose, value) }
UniformMatrix2x3dv :: proc "c" (location: i32, count: i32, transpose: bool, value: [^]f64) { impl_UniformMatrix2x3dv(location, count, transpose, value) }
UniformMatrix2x4dv :: proc "c" (location: i32, count: i32, transpose: bool, value: [^]f64) { impl_UniformMatrix2x4dv(location, count, transpose, value) }
UniformMatrix3x2dv :: proc "c" (location: i32, count: i32, transpose: bool, value: [^]f64) { impl_UniformMatrix3x2dv(location, count, transpose, value) }
UniformMatrix3x4dv :: proc "c" (location: i32, count: i32, transpose: bool, value: [^]f64) { impl_UniformMatrix3x4dv(location, count, transpose, value) }
UniformMatrix4x2dv :: proc "c" (location: i32, count: i32, transpose: bool, value: [^]f64) { impl_UniformMatrix4x2dv(location, count, transpose, value) }
UniformMatrix4x3dv :: proc "c" (location: i32, count: i32, transpose: bool, value: [^]f64) { impl_UniformMatrix4x3dv(location, count, transpose, value) }
GetUniformdv :: proc "c" (program: u32, location: i32, params: [^]f64) { impl_GetUniformdv(program, location, params) }
GetSubroutineUniformLocation :: proc "c" (program: u32, shadertype: u32, name: cstring) -> i32 { ret := impl_GetSubroutineUniformLocation(program, shadertype, name); return ret }
GetSubroutineIndex :: proc "c" (program: u32, shadertype: u32, name: cstring) -> u32 { ret := impl_GetSubroutineIndex(program, shadertype, name); return ret }
GetActiveSubroutineUniformiv :: proc "c" (program: u32, shadertype: u32, index: u32, pname: u32, values: [^]i32) { impl_GetActiveSubroutineUniformiv(program, shadertype, index, pname, values) }
GetActiveSubroutineUniformName :: proc "c" (program: u32, shadertype: u32, index: u32, bufsize: i32, length: ^i32, name: [^]u8) { impl_GetActiveSubroutineUniformName(program, shadertype, index, bufsize, length, name) }
GetActiveSubroutineName :: proc "c" (program: u32, shadertype: u32, index: u32, bufsize: i32, length: ^i32, name: [^]u8) { impl_GetActiveSubroutineName(program, shadertype, index, bufsize, length, name) }
UniformSubroutinesuiv :: proc "c" (shadertype: u32, count: i32, indices: [^]u32) { impl_UniformSubroutinesuiv(shadertype, count, indices) }
GetUniformSubroutineuiv :: proc "c" (shadertype: u32, location: i32, params: [^]u32) { impl_GetUniformSubroutineuiv(shadertype, location, params) }
GetProgramStageiv :: proc "c" (program: u32, shadertype: u32, pname: u32, values: [^]i32) { impl_GetProgramStageiv(program, shadertype, pname, values) }
PatchParameteri :: proc "c" (pname: u32, value: i32) { impl_PatchParameteri(pname, value) }
PatchParameterfv :: proc "c" (pname: u32, values: [^]f32) { impl_PatchParameterfv(pname, values) }
BindTransformFeedback :: proc "c" (target: u32, id: u32) { impl_BindTransformFeedback(target, id) }
DeleteTransformFeedbacks :: proc "c" (n: i32, ids: [^]u32) { impl_DeleteTransformFeedbacks(n, ids) }
GenTransformFeedbacks :: proc "c" (n: i32, ids: [^]u32) { impl_GenTransformFeedbacks(n, ids) }
IsTransformFeedback :: proc "c" (id: u32) -> bool { ret := impl_IsTransformFeedback(id); return ret }
PauseTransformFeedback :: proc "c" () { impl_PauseTransformFeedback() }
ResumeTransformFeedback :: proc "c" () { impl_ResumeTransformFeedback() }
DrawTransformFeedback :: proc "c" (mode: u32, id: u32) { impl_DrawTransformFeedback(mode, id) }
DrawTransformFeedbackStream :: proc "c" (mode: u32, id: u32, stream: u32) { impl_DrawTransformFeedbackStream(mode, id, stream) }
BeginQueryIndexed :: proc "c" (target: u32, index: u32, id: u32) { impl_BeginQueryIndexed(target, index, id) }
EndQueryIndexed :: proc "c" (target: u32, index: u32) { impl_EndQueryIndexed(target, index) }
GetQueryIndexediv :: proc "c" (target: u32, index: u32, pname: u32, params: [^]i32) { impl_GetQueryIndexediv(target, index, pname, params) }
GetTextureHandleARB :: proc "c" (texture: u32) -> u64 { return impl_GetTextureHandleARB(texture) }
GetTextureSamplerHandleARB :: proc "c" (texture, sampler: u32) -> u64 { return impl_GetTextureSamplerHandleARB(texture, sampler) }
GetImageHandleARB :: proc "c" (texture: u32, level: i32, layered: bool, layer: i32, format: u32) -> u64 { return impl_GetImageHandleARB(texture, level, layered, layer, format) }
MakeTextureHandleResidentARB :: proc "c" (handle: u64) { impl_MakeTextureHandleResidentARB(handle) }
MakeImageHandleResidentARB :: proc "c" (handle: u64, access: u32) { impl_MakeImageHandleResidentARB(handle, access) }
MakeTextureHandleNonResidentARB:: proc "c" (handle: u64) { impl_MakeTextureHandleNonResidentARB(handle) }
MakeImageHandleNonResidentARB  :: proc "c" (handle: u64) { impl_MakeImageHandleNonResidentARB(handle) }

// VERSION_4_1
ReleaseShaderCompiler :: proc "c" () { impl_ReleaseShaderCompiler() }
ShaderBinary :: proc "c" (count: i32, shaders: ^u32, binaryformat: u32, binary: rawptr, length: i32) { impl_ShaderBinary(count, shaders, binaryformat, binary, length) }
GetShaderPrecisionFormat  :: proc "c" (shadertype: u32, precisiontype: u32, range: ^i32, precision: ^i32) { impl_GetShaderPrecisionFormat(shadertype, precisiontype, range, precision) }
DepthRangef :: proc "c" (n: f32, f: f32) { impl_DepthRangef(n, f) }
ClearDepthf :: proc "c" (d: f32) { impl_ClearDepthf(d) }
GetProgramBinary :: proc "c" (program: u32, bufSize: i32, length: ^i32, binaryFormat: ^u32, binary: rawptr) { impl_GetProgramBinary(program, bufSize, length, binaryFormat, binary) }
ProgramBinary :: proc "c" (program: u32, binaryFormat: u32, binary: rawptr, length: i32) { impl_ProgramBinary(program, binaryFormat, binary, length) }
ProgramParameteri :: proc "c" (program: u32, pname: u32, value: i32) { impl_ProgramParameteri(program, pname, value) }
UseProgramStages :: proc "c" (pipeline: u32, stages: u32, program: u32) { impl_UseProgramStages(pipeline, stages, program) }
ActiveShaderProgram :: proc "c" (pipeline: u32, program: u32) { impl_ActiveShaderProgram(pipeline, program) }
CreateShaderProgramv :: proc "c" (type: u32, count: i32, strings: [^]cstring) -> u32 { ret := impl_CreateShaderProgramv(type, count, strings); return ret }
BindProgramPipeline :: proc "c" (pipeline: u32) { impl_BindProgramPipeline(pipeline) }
DeleteProgramPipelines :: proc "c" (n: i32, pipelines: [^]u32) { impl_DeleteProgramPipelines(n, pipelines) }
GenProgramPipelines :: proc "c" (n: i32, pipelines: [^]u32) { impl_GenProgramPipelines(n, pipelines) }
IsProgramPipeline :: proc "c" (pipeline: u32) -> bool { ret := impl_IsProgramPipeline(pipeline); return ret }
GetProgramPipelineiv :: proc "c" (pipeline: u32, pname: u32, params: [^]i32) { impl_GetProgramPipelineiv(pipeline, pname, params) }
ProgramUniform1i :: proc "c" (program: u32, location: i32, v0: i32) { impl_ProgramUniform1i(program, location, v0) }
ProgramUniform1iv :: proc "c" (program: u32, location: i32, count: i32, value: [^]i32) { impl_ProgramUniform1iv(program, location, count, value) }
ProgramUniform1f :: proc "c" (program: u32, location: i32, v0: f32) { impl_ProgramUniform1f(program, location, v0) }
ProgramUniform1fv :: proc "c" (program: u32, location: i32, count: i32, value: [^]f32) { impl_ProgramUniform1fv(program, location, count, value) }
ProgramUniform1d :: proc "c" (program: u32, location: i32, v0: f64) { impl_ProgramUniform1d(program, location, v0) }
ProgramUniform1dv :: proc "c" (program: u32, location: i32, count: i32, value: [^]f64) { impl_ProgramUniform1dv(program, location, count, value) }
ProgramUniform1ui :: proc "c" (program: u32, location: i32, v0: u32) { impl_ProgramUniform1ui(program, location, v0) }
ProgramUniform1uiv :: proc "c" (program: u32, location: i32, count: i32, value: [^]u32) { impl_ProgramUniform1uiv(program, location, count, value) }
ProgramUniform2i :: proc "c" (program: u32, location: i32, v0: i32, v1: i32) { impl_ProgramUniform2i(program, location, v0, v1) }
ProgramUniform2iv :: proc "c" (program: u32, location: i32, count: i32, value: [^]i32) { impl_ProgramUniform2iv(program, location, count, value) }
ProgramUniform2f :: proc "c" (program: u32, location: i32, v0: f32, v1: f32) { impl_ProgramUniform2f(program, location, v0, v1) }
ProgramUniform2fv :: proc "c" (program: u32, location: i32, count: i32, value: [^]f32) { impl_ProgramUniform2fv(program, location, count, value) }
ProgramUniform2d :: proc "c" (program: u32, location: i32, v0: f64, v1: f64) { impl_ProgramUniform2d(program, location, v0, v1) }
ProgramUniform2dv :: proc "c" (program: u32, location: i32, count: i32, value: [^]f64) { impl_ProgramUniform2dv(program, location, count, value) }
ProgramUniform2ui :: proc "c" (program: u32, location: i32, v0: u32, v1: u32) { impl_ProgramUniform2ui(program, location, v0, v1) }
ProgramUniform2uiv :: proc "c" (program: u32, location: i32, count: i32, value: [^]u32) { impl_ProgramUniform2uiv(program, location, count, value) }
ProgramUniform3i :: proc "c" (program: u32, location: i32, v0: i32, v1: i32, v2: i32) { impl_ProgramUniform3i(program, location, v0, v1, v2) }
ProgramUniform3iv :: proc "c" (program: u32, location: i32, count: i32, value: [^]i32) { impl_ProgramUniform3iv(program, location, count, value) }
ProgramUniform3f :: proc "c" (program: u32, location: i32, v0: f32, v1: f32, v2: f32) { impl_ProgramUniform3f(program, location, v0, v1, v2) }
ProgramUniform3fv :: proc "c" (program: u32, location: i32, count: i32, value: [^]f32) { impl_ProgramUniform3fv(program, location, count, value) }
ProgramUniform3d :: proc "c" (program: u32, location: i32, v0: f64, v1: f64, v2: f64) { impl_ProgramUniform3d(program, location, v0, v1, v2) }
ProgramUniform3dv :: proc "c" (program: u32, location: i32, count: i32, value: [^]f64) { impl_ProgramUniform3dv(program, location, count, value) }
ProgramUniform3ui :: proc "c" (program: u32, location: i32, v0: u32, v1: u32, v2: u32) { impl_ProgramUniform3ui(program, location, v0, v1, v2) }
ProgramUniform3uiv :: proc "c" (program: u32, location: i32, count: i32, value: [^]u32) { impl_ProgramUniform3uiv(program, location, count, value) }
ProgramUniform4i :: proc "c" (program: u32, location: i32, v0: i32, v1: i32, v2: i32, v3: i32) { impl_ProgramUniform4i(program, location, v0, v1, v2, v3) }
ProgramUniform4iv :: proc "c" (program: u32, location: i32, count: i32, value: [^]i32) { impl_ProgramUniform4iv(program, location, count, value) }
ProgramUniform4f :: proc "c" (program: u32, location: i32, v0: f32, v1: f32, v2: f32, v3: f32) { impl_ProgramUniform4f(program, location, v0, v1, v2, v3) }
ProgramUniform4fv :: proc "c" (program: u32, location: i32, count: i32, value: [^]f32) { impl_ProgramUniform4fv(program, location, count, value) }
ProgramUniform4d :: proc "c" (program: u32, location: i32, v0: f64, v1: f64, v2: f64, v3: f64) { impl_ProgramUniform4d(program, location, v0, v1, v2, v3) }
ProgramUniform4dv :: proc "c" (program: u32, location: i32, count: i32, value: [^]f64) { impl_ProgramUniform4dv(program, location, count, value) }
ProgramUniform4ui :: proc "c" (program: u32, location: i32, v0: u32, v1: u32, v2: u32, v3: u32) { impl_ProgramUniform4ui(program, location, v0 , v1, v2, v3) }
ProgramUniform4uiv :: proc "c" (program: u32, location: i32, count: i32, value: [^]u32) { impl_ProgramUniform4uiv(program, location, count, value) }
ProgramUniformMatrix2fv :: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f32) { impl_ProgramUniformMatrix2fv(program, location, count, transpose, value) }
ProgramUniformMatrix3fv :: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f32) { impl_ProgramUniformMatrix3fv(program, location, count, transpose, value) }
ProgramUniformMatrix4fv :: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f32) { impl_ProgramUniformMatrix4fv(program, location, count, transpose, value) }
ProgramUniformMatrix2dv   :: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f64) { impl_ProgramUniformMatrix2dv(program, location, count, transpose, value) }
ProgramUniformMatrix3dv :: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f64) { impl_ProgramUniformMatrix3dv(program, location, count, transpose, value) }
ProgramUniformMatrix4dv :: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f64) { impl_ProgramUniformMatrix4dv(program, location, count, transpose, value) }
ProgramUniformMatrix2x3fv :: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f32) { impl_ProgramUniformMatrix2x3fv(program, location, count, transpose, value) }
ProgramUniformMatrix3x2fv :: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f32) { impl_ProgramUniformMatrix3x2fv(program, location, count, transpose, value) }
ProgramUniformMatrix2x4fv :: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f32) { impl_ProgramUniformMatrix2x4fv(program, location, count, transpose, value) }
ProgramUniformMatrix4x2fv :: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f32) { impl_ProgramUniformMatrix4x2fv(program, location, count, transpose, value) }
ProgramUniformMatrix3x4fv :: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f32) { impl_ProgramUniformMatrix3x4fv(program, location, count, transpose, value) }
ProgramUniformMatrix4x3fv :: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f32) { impl_ProgramUniformMatrix4x3fv(program, location, count, transpose, value) }
ProgramUniformMatrix2x3dv :: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f64) { impl_ProgramUniformMatrix2x3dv(program, location, count, transpose, value) }
ProgramUniformMatrix3x2dv :: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f64) { impl_ProgramUniformMatrix3x2dv(program, location, count, transpose, value) }
ProgramUniformMatrix2x4dv :: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f64) { impl_ProgramUniformMatrix2x4dv(program, location, count, transpose, value) }
ProgramUniformMatrix4x2dv :: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f64) { impl_ProgramUniformMatrix4x2dv(program, location, count, transpose, value) }
ProgramUniformMatrix3x4dv :: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f64) { impl_ProgramUniformMatrix3x4dv(program, location, count, transpose, value) }
ProgramUniformMatrix4x3dv :: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f64) { impl_ProgramUniformMatrix4x3dv(program, location, count, transpose, value) }
ValidateProgramPipeline   :: proc "c" (pipeline: u32) { impl_ValidateProgramPipeline(pipeline) }
GetProgramPipelineInfoLog :: proc "c" (pipeline: u32, bufSize: i32, length: ^i32, infoLog: [^]u8) { impl_GetProgramPipelineInfoLog(pipeline, bufSize, length, infoLog) }
VertexAttribL1d :: proc "c" (index: u32, x: f64) { impl_VertexAttribL1d(index, x) }
VertexAttribL2d :: proc "c" (index: u32, x: f64, y: f64) { impl_VertexAttribL2d(index, x, y) }
VertexAttribL3d :: proc "c" (index: u32, x: f64, y: f64, z: f64) { impl_VertexAttribL3d(index, x, y, z) }
VertexAttribL4d :: proc "c" (index: u32, x: f64, y: f64, z: f64, w: f64) { impl_VertexAttribL4d(index, x, y, z, w) }
VertexAttribL1dv :: proc "c" (index: u32, v: ^f64) { impl_VertexAttribL1dv(index, v) }
VertexAttribL2dv :: proc "c" (index: u32, v: ^[2]f64) { impl_VertexAttribL2dv(index, v) }
VertexAttribL3dv :: proc "c" (index: u32, v: ^[3]f64) { impl_VertexAttribL3dv(index, v) }
VertexAttribL4dv :: proc "c" (index: u32, v: ^[4]f64) { impl_VertexAttribL4dv(index, v) }
VertexAttribLPointer :: proc "c" (index: u32, size: i32, type: u32, stride: i32, pointer: uintptr) { impl_VertexAttribLPointer(index, size, type, stride, pointer) }
GetVertexAttribLdv :: proc "c" (index: u32, pname: u32, params: [^]f64) { impl_GetVertexAttribLdv(index, pname, params) }
ViewportArrayv :: proc "c" (first: u32, count: i32, v: [^]f32) { impl_ViewportArrayv(first, count, v) }
ViewportIndexedf :: proc "c" (index: u32, x: f32, y: f32, w: f32, h: f32) { impl_ViewportIndexedf(index, x, y, w, h) }
ViewportIndexedfv :: proc "c" (index: u32, v: ^[4]f32) { impl_ViewportIndexedfv(index, v) }
ScissorArrayv :: proc "c" (first: u32, count: i32, v: [^]i32) { impl_ScissorArrayv(first, count, v) }
ScissorIndexed :: proc "c" (index: u32, left: i32, bottom: i32, width: i32, height: i32) { impl_ScissorIndexed(index, left, bottom, width, height) }
ScissorIndexedv :: proc "c" (index: u32, v: ^[4]i32) { impl_ScissorIndexedv(index, v) }
DepthRangeArrayv :: proc "c" (first: u32, count: i32, v: [^]f64) { impl_DepthRangeArrayv(first, count, v) }
DepthRangeIndexed :: proc "c" (index: u32, n: f64, f: f64) { impl_DepthRangeIndexed(index, n, f) }
GetFloati_v :: proc "c" (target: u32, index: u32, data: ^f32) { impl_GetFloati_v(target, index, data) }
GetDoublei_v :: proc "c" (target: u32, index: u32, data: ^f64) { impl_GetDoublei_v(target, index, data) }

// VERSION_4_2
DrawArraysInstancedBaseInstance :: proc "c" (mode: u32, first: i32, count: i32, instancecount: i32, baseinstance: u32) { impl_DrawArraysInstancedBaseInstance(mode, first, count, instancecount, baseinstance) }
DrawElementsInstancedBaseInstance :: proc "c" (mode: u32, count: i32, type: u32, indices: rawptr, instancecount: i32, baseinstance: u32) { impl_DrawElementsInstancedBaseInstance(mode, count, type, indices, instancecount, baseinstance) }
DrawElementsInstancedBaseVertexBaseInstance :: proc "c" (mode: u32, count: i32, type: u32, indices: rawptr, instancecount: i32, basevertex: i32, baseinstance: u32)  { impl_DrawElementsInstancedBaseVertexBaseInstance(mode, count, type, indices, instancecount, basevertex, baseinstance) }
GetInternalformativ :: proc "c" (target: u32, internalformat: u32, pname: u32, bufSize: i32, params: [^]i32) { impl_GetInternalformativ(target, internalformat, pname, bufSize, params) }
GetActiveAtomicCounterBufferiv :: proc "c" (program: u32, bufferIndex: u32, pname: u32, params: [^]i32) { impl_GetActiveAtomicCounterBufferiv(program, bufferIndex, pname, params) }
BindImageTexture :: proc "c" (unit: u32, texture: u32, level: i32, layered: bool, layer: i32, access: u32, format: u32) { impl_BindImageTexture(unit, texture, level, layered, layer, access, format) }
MemoryBarrier :: proc "c" (barriers: u32) { impl_MemoryBarrier(barriers) }
TexStorage1D :: proc "c" (target: u32, levels: i32, internalformat: u32, width: i32) { impl_TexStorage1D(target, levels, internalformat, width) }
TexStorage2D :: proc "c" (target: u32, levels: i32, internalformat: u32, width: i32, height: i32) { impl_TexStorage2D(target, levels, internalformat, width, height) }
TexStorage3D :: proc "c" (target: u32, levels: i32, internalformat: u32, width: i32, height: i32, depth: i32) { impl_TexStorage3D(target, levels, internalformat, width, height, depth) }
DrawTransformFeedbackInstanced :: proc "c" (mode: u32, id: u32, instancecount: i32) { impl_DrawTransformFeedbackInstanced(mode, id, instancecount) }
DrawTransformFeedbackStreamInstanced :: proc "c" (mode: u32, id: u32, stream: u32, instancecount: i32) { impl_DrawTransformFeedbackStreamInstanced(mode, id, stream, instancecount) }

// VERSION_4_3
ClearBufferData :: proc "c" (target: u32, internalformat: u32, format: u32, type: u32, data: rawptr) { impl_ClearBufferData(target, internalformat, format, type, data) }
ClearBufferSubData :: proc "c" (target: u32, internalformat: u32, offset: int, size: int, format: u32, type: u32, data: rawptr) { impl_ClearBufferSubData(target, internalformat, offset, size, format, type, data) }
DispatchCompute :: proc "c" (num_groups_x: u32, num_groups_y: u32, num_groups_z: u32) { impl_DispatchCompute(num_groups_x, num_groups_y, num_groups_z) }
DispatchComputeIndirect :: proc "c" (indirect: ^DispatchIndirectCommand) { impl_DispatchComputeIndirect(indirect) }
CopyImageSubData :: proc "c" (srcName: u32, srcTarget: u32, srcLevel: i32, srcX: i32, srcY: i32, srcZ: i32, dstName: u32, dstTarget: u32, dstLevel: i32, dstX: i32, dstY: i32, dstZ: i32, srcWidth: i32, srcHeight: i32, srcDepth: i32) { impl_CopyImageSubData(srcName, srcTarget, srcLevel, srcX, srcY, srcZ, dstName, dstTarget, dstLevel, dstX, dstY, dstZ, srcWidth, srcHeight, srcDepth) }
FramebufferParameteri :: proc "c" (target: u32, pname: u32, param: i32) { impl_FramebufferParameteri(target, pname, param) }
GetFramebufferParameteriv :: proc "c" (target: u32, pname: u32, params: [^]i32) { impl_GetFramebufferParameteriv(target, pname, params) }
GetInternalformati64v :: proc "c" (target: u32, internalformat: u32, pname: u32, bufSize: i32, params: [^]i64) { impl_GetInternalformati64v(target, internalformat, pname, bufSize, params) }
InvalidateTexSubImage :: proc "c" (texture: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, width: i32, height: i32, depth: i32) { impl_InvalidateTexSubImage(texture, level, xoffset, yoffset, zoffset, width, height, depth) }
InvalidateTexImage :: proc "c" (texture: u32, level: i32) { impl_InvalidateTexImage(texture, level) }
InvalidateBufferSubData :: proc "c" (buffer: u32, offset: int, length: int) { impl_InvalidateBufferSubData(buffer, offset, length) }
InvalidateBufferData :: proc "c" (buffer: u32) { impl_InvalidateBufferData(buffer) }
InvalidateFramebuffer :: proc "c" (target: u32, numAttachments: i32, attachments: [^]u32) { impl_InvalidateFramebuffer(target, numAttachments, attachments) }
InvalidateSubFramebuffer :: proc "c" (target: u32, numAttachments: i32, attachments: [^]u32, x: i32, y: i32, width: i32, height: i32) { impl_InvalidateSubFramebuffer(target, numAttachments, attachments, x, y, width, height) }
MultiDrawArraysIndirect :: proc "c" (mode: u32, indirect: [^]DrawArraysIndirectCommand, drawcount: i32, stride: i32) { impl_MultiDrawArraysIndirect(mode, indirect, drawcount, stride) }
MultiDrawElementsIndirect :: proc "c" (mode: u32, type: u32, indirect: [^]DrawElementsIndirectCommand, drawcount: i32, stride: i32) { impl_MultiDrawElementsIndirect(mode, type, indirect, drawcount, stride) }
GetProgramInterfaceiv :: proc "c" (program: u32, programInterface: u32, pname: u32, params: [^]i32) { impl_GetProgramInterfaceiv(program, programInterface, pname, params) }
GetProgramResourceIndex :: proc "c" (program: u32, programInterface: u32, name: cstring) -> u32 { ret := impl_GetProgramResourceIndex(program, programInterface, name); return ret }
GetProgramResourceName :: proc "c" (program: u32, programInterface: u32, index: u32, bufSize: i32, length: ^i32, name: [^]u8) { impl_GetProgramResourceName(program, programInterface, index, bufSize, length, name) }
GetProgramResourceiv :: proc "c" (program: u32, programInterface: u32, index: u32, propCount: i32, props: [^]u32, bufSize: i32, length: ^i32, params: [^]i32) { impl_GetProgramResourceiv(program, programInterface, index, propCount, props, bufSize, length, params) }
GetProgramResourceLocation :: proc "c" (program: u32, programInterface: u32, name: cstring) -> i32 { ret := impl_GetProgramResourceLocation(program, programInterface, name); return ret }
GetProgramResourceLocationIndex :: proc "c" (program: u32, programInterface: u32, name: cstring) -> i32 { ret := impl_GetProgramResourceLocationIndex(program, programInterface, name); return ret }
ShaderStorageBlockBinding :: proc "c" (program: u32, storageBlockIndex: u32, storageBlockBinding: u32) { impl_ShaderStorageBlockBinding(program, storageBlockIndex, storageBlockBinding) }
TexBufferRange :: proc "c" (target: u32, internalformat: u32, buffer: u32, offset: int, size: int) { impl_TexBufferRange(target, internalformat, buffer, offset, size) }
TexStorage2DMultisample :: proc "c" (target: u32, samples: i32, internalformat: u32, width: i32, height: i32, fixedsamplelocations: bool) { impl_TexStorage2DMultisample(target, samples, internalformat, width, height, fixedsamplelocations) }
TexStorage3DMultisample :: proc "c" (target: u32, samples: i32, internalformat: u32, width: i32, height: i32, depth: i32, fixedsamplelocations: bool) { impl_TexStorage3DMultisample(target, samples, internalformat, width, height, depth, fixedsamplelocations) }
TextureView :: proc "c" (texture: u32, target: u32, origtexture: u32, internalformat: u32, minlevel: u32, numlevels: u32, minlayer: u32, numlayers: u32) { impl_TextureView(texture, target, origtexture, internalformat, minlevel, numlevels, minlayer, numlayers) }
BindVertexBuffer :: proc "c" (bindingindex: u32, buffer: u32, offset: int, stride: i32) { impl_BindVertexBuffer(bindingindex, buffer, offset, stride) }
VertexAttribFormat :: proc "c" (attribindex: u32, size: i32, type: u32, normalized: bool, relativeoffset: u32) { impl_VertexAttribFormat(attribindex, size, type, normalized, relativeoffset) }
VertexAttribIFormat :: proc "c" (attribindex: u32, size: i32, type: u32, relativeoffset: u32) { impl_VertexAttribIFormat(attribindex, size, type, relativeoffset) }
VertexAttribLFormat :: proc "c" (attribindex: u32, size: i32, type: u32, relativeoffset: u32) { impl_VertexAttribLFormat(attribindex, size, type, relativeoffset) }
VertexAttribBinding :: proc "c" (attribindex: u32, bindingindex: u32) { impl_VertexAttribBinding(attribindex, bindingindex) }
VertexBindingDivisor :: proc "c" (bindingindex: u32, divisor: u32) { impl_VertexBindingDivisor(bindingindex, divisor) }
DebugMessageControl :: proc "c" (source: u32, type: u32, severity: u32, count: i32, ids: [^]u32, enabled: bool) { impl_DebugMessageControl(source, type, severity, count, ids, enabled) }
DebugMessageInsert :: proc "c" (source: u32, type: u32, id: u32, severity: u32, length: i32, message: cstring) { impl_DebugMessageInsert(source, type, id, severity, length, message) }
DebugMessageCallback :: proc "c" (callback: debug_proc_t, userParam: rawptr) { impl_DebugMessageCallback(callback, userParam) }
GetDebugMessageLog :: proc "c" (count: u32, bufSize: i32, sources: [^]u32, types: [^]u32, ids: [^]u32, severities: [^]u32, lengths: [^]i32, messageLog: [^]u8) -> u32 { ret := impl_GetDebugMessageLog(count, bufSize, sources, types, ids, severities, lengths, messageLog); return ret }
PushDebugGroup :: proc "c" (source: u32, id: u32, length: i32, message: cstring) { impl_PushDebugGroup(source, id, length, message) }
PopDebugGroup :: proc "c" () { impl_PopDebugGroup() }
ObjectLabel :: proc "c" (identifier: u32, name: u32, length: i32, label: cstring) { impl_ObjectLabel(identifier, name, length, label) }
GetObjectLabel :: proc "c" (identifier: u32, name: u32, bufSize: i32, length: ^i32, label: [^]u8) { impl_GetObjectLabel(identifier, name, bufSize, length, label) }
ObjectPtrLabel :: proc "c" (ptr: rawptr, length: i32, label: cstring) { impl_ObjectPtrLabel(ptr, length, label) }
GetObjectPtrLabel :: proc "c" (ptr: rawptr, bufSize: i32, length: ^i32, label: [^]u8) { impl_GetObjectPtrLabel(ptr, bufSize, length, label) }

// VERSION_4_4
BufferStorage :: proc "c" (target: u32, size: int, data: rawptr, flags: u32) { impl_BufferStorage(target, size, data, flags) }
ClearTexImage :: proc "c" (texture: u32, level: i32, format: u32, type: u32, data: rawptr) { impl_ClearTexImage(texture, level, format, type, data) }
ClearTexSubImage :: proc "c" (texture: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, width: i32, height: i32, depth: i32, format: u32, type: u32, data: rawptr) { impl_ClearTexSubImage(texture, level, xoffset, yoffset, zoffset, width, height, depth, format, type, data) }
BindBuffersBase :: proc "c" (target: u32, first: u32, count: i32, buffers: [^]u32) { impl_BindBuffersBase(target, first, count, buffers) }
BindBuffersRange :: proc "c" (target: u32, first: u32, count: i32, buffers: [^]u32, offsets: [^]uintptr, sizes: [^]int) { impl_BindBuffersRange(target, first, count, buffers, offsets, sizes) }
BindTextures :: proc "c" (first: u32, count: i32, textures: [^]u32) { impl_BindTextures(first, count, textures) }
BindSamplers :: proc "c" (first: u32, count: i32, samplers: [^]u32) { impl_BindSamplers(first, count, samplers) }
BindImageTextures :: proc "c" (first: u32, count: i32, textures: [^]u32) { impl_BindImageTextures(first, count, textures) }
BindVertexBuffers :: proc "c" (first: u32, count: i32, buffers: [^]u32, offsets: [^]uintptr, strides: [^]i32) { impl_BindVertexBuffers(first, count, buffers, offsets, strides) }

// VERSION_4_5
ClipControl :: proc "c" (origin: u32, depth: u32) { impl_ClipControl(origin, depth) }
CreateTransformFeedbacks :: proc "c" (n: i32, ids: [^]u32) { impl_CreateTransformFeedbacks(n, ids) }
TransformFeedbackBufferBase :: proc "c" (xfb: u32, index: u32, buffer: u32) { impl_TransformFeedbackBufferBase(xfb, index, buffer) }
TransformFeedbackBufferRange :: proc "c" (xfb: u32, index: u32, buffer: u32, offset: int, size: int) { impl_TransformFeedbackBufferRange(xfb, index, buffer, offset, size) }
GetTransformFeedbackiv :: proc "c" (xfb: u32, pname: u32, param: ^i32) { impl_GetTransformFeedbackiv(xfb, pname, param) }
GetTransformFeedbacki_v :: proc "c" (xfb: u32, pname: u32, index: u32, param: ^i32) { impl_GetTransformFeedbacki_v(xfb, pname, index, param) }
GetTransformFeedbacki64_v :: proc "c" (xfb: u32, pname: u32, index: u32, param: ^i64) { impl_GetTransformFeedbacki64_v(xfb, pname, index, param) }
CreateBuffers :: proc "c" (n: i32, buffers: [^]u32) { impl_CreateBuffers(n, buffers) }
NamedBufferStorage :: proc "c" (buffer: u32, size: int, data: rawptr, flags: u32) { impl_NamedBufferStorage(buffer, size, data, flags) }
NamedBufferData :: proc "c" (buffer: u32, size: int, data: rawptr, usage: u32) { impl_NamedBufferData(buffer, size, data, usage) }
NamedBufferSubData :: proc "c" (buffer: u32, offset: int, size: int, data: rawptr) { impl_NamedBufferSubData(buffer, offset, size, data) }
CopyNamedBufferSubData :: proc "c" (readBuffer: u32, writeBuffer: u32, readOffset: int, writeOffset: int, size: int) { impl_CopyNamedBufferSubData(readBuffer, writeBuffer, readOffset, writeOffset, size) }
ClearNamedBufferData :: proc "c" (buffer: u32, internalformat: u32, format: u32, type: u32, data: rawptr) { impl_ClearNamedBufferData(buffer, internalformat, format, type, data) }
ClearNamedBufferSubData :: proc "c" (buffer: u32, internalformat: u32, offset: int, size: int, format: u32, type: u32, data: rawptr) { impl_ClearNamedBufferSubData(buffer, internalformat, offset, size, format, type, data) }
MapNamedBuffer :: proc "c" (buffer: u32, access: u32) -> rawptr { ret := impl_MapNamedBuffer(buffer, access); return ret }
MapNamedBufferRange :: proc "c" (buffer: u32, offset: int, length: int, access: u32) -> rawptr { ret := impl_MapNamedBufferRange(buffer, offset, length, access); return ret }
UnmapNamedBuffer :: proc "c" (buffer: u32) -> bool { ret := impl_UnmapNamedBuffer(buffer); return ret }
FlushMappedNamedBufferRange :: proc "c" (buffer: u32, offset: int, length: int) { impl_FlushMappedNamedBufferRange(buffer, offset, length) }
GetNamedBufferParameteriv :: proc "c" (buffer: u32, pname: u32, params: [^]i32) { impl_GetNamedBufferParameteriv(buffer, pname, params) }
GetNamedBufferParameteri64v :: proc "c" (buffer: u32, pname: u32, params: [^]i64) { impl_GetNamedBufferParameteri64v(buffer, pname, params) }
GetNamedBufferPointerv :: proc "c" (buffer: u32, pname: u32, params: [^]rawptr) { impl_GetNamedBufferPointerv(buffer, pname, params) }
GetNamedBufferSubData :: proc "c" (buffer: u32, offset: int, size: int, data: rawptr) { impl_GetNamedBufferSubData(buffer, offset, size, data) }
CreateFramebuffers :: proc "c" (n: i32, framebuffers: [^]u32) { impl_CreateFramebuffers(n, framebuffers) }
NamedFramebufferRenderbuffer :: proc "c" (framebuffer: u32, attachment: u32, renderbuffertarget: u32, renderbuffer: u32) { impl_NamedFramebufferRenderbuffer(framebuffer, attachment, renderbuffertarget, renderbuffer) }
NamedFramebufferParameteri :: proc "c" (framebuffer: u32, pname: u32, param: i32) { impl_NamedFramebufferParameteri(framebuffer, pname, param) }
NamedFramebufferTexture :: proc "c" (framebuffer: u32, attachment: u32, texture: u32, level: i32) { impl_NamedFramebufferTexture(framebuffer, attachment, texture, level) }
NamedFramebufferTextureLayer :: proc "c" (framebuffer: u32, attachment: u32, texture: u32, level: i32, layer: i32) { impl_NamedFramebufferTextureLayer(framebuffer, attachment, texture, level, layer) }
NamedFramebufferDrawBuffer :: proc "c" (framebuffer: u32, buf: u32) { impl_NamedFramebufferDrawBuffer(framebuffer, buf) }
NamedFramebufferDrawBuffers :: proc "c" (framebuffer: u32, n: i32, bufs: [^]u32) { impl_NamedFramebufferDrawBuffers(framebuffer, n, bufs) }
NamedFramebufferReadBuffer :: proc "c" (framebuffer: u32, src: u32) { impl_NamedFramebufferReadBuffer(framebuffer, src) }
InvalidateNamedFramebufferData :: proc "c" (framebuffer: u32, numAttachments: i32, attachments: [^]u32) { impl_InvalidateNamedFramebufferData(framebuffer, numAttachments, attachments) }
InvalidateNamedFramebufferSubData :: proc "c" (framebuffer: u32, numAttachments: i32, attachments: [^]u32, x: i32, y: i32, width: i32, height: i32) { impl_InvalidateNamedFramebufferSubData(framebuffer, numAttachments, attachments, x, y, width, height) }
ClearNamedFramebufferiv :: proc "c" (framebuffer: u32, buffer: u32, drawbuffer: i32, value: ^i32) { impl_ClearNamedFramebufferiv(framebuffer, buffer, drawbuffer, value) }
ClearNamedFramebufferuiv :: proc "c" (framebuffer: u32, buffer: u32, drawbuffer: i32, value: ^u32) { impl_ClearNamedFramebufferuiv(framebuffer, buffer, drawbuffer, value) }
ClearNamedFramebufferfv :: proc "c" (framebuffer: u32, buffer: u32, drawbuffer: i32, value: ^f32) { impl_ClearNamedFramebufferfv(framebuffer, buffer, drawbuffer, value) }
ClearNamedFramebufferfi :: proc "c" (framebuffer: u32, buffer: u32, drawbuffer: i32, depth: f32, stencil: i32) { impl_ClearNamedFramebufferfi(framebuffer, buffer, drawbuffer, depth, stencil) }
BlitNamedFramebuffer :: proc "c" (readFramebuffer: u32, drawFramebuffer: u32, srcX0: i32, srcY0: i32, srcX1: i32, srcY1: i32, dstX0: i32, dstY0: i32, dstX1: i32, dstY1: i32, mask: u32, filter: u32) { impl_BlitNamedFramebuffer(readFramebuffer, drawFramebuffer, srcX0, srcY0, srcX1, srcY1, dstX0, dstY0, dstX1, dstY1, mask, filter) }
CheckNamedFramebufferStatus :: proc "c" (framebuffer: u32, target: u32) -> u32 { ret := impl_CheckNamedFramebufferStatus(framebuffer, target); return ret }
GetNamedFramebufferParameteriv :: proc "c" (framebuffer: u32, pname: u32, param: ^i32) { impl_GetNamedFramebufferParameteriv(framebuffer, pname, param) }
GetNamedFramebufferAttachmentParameteriv :: proc "c" (framebuffer: u32, attachment: u32, pname: u32, params: [^]i32) { impl_GetNamedFramebufferAttachmentParameteriv(framebuffer, attachment, pname, params) }
CreateRenderbuffers :: proc "c" (n: i32, renderbuffers: [^]u32) { impl_CreateRenderbuffers(n, renderbuffers) }
NamedRenderbufferStorage :: proc "c" (renderbuffer: u32, internalformat: u32, width: i32, height: i32) { impl_NamedRenderbufferStorage(renderbuffer, internalformat, width, height) }
NamedRenderbufferStorageMultisample :: proc "c" (renderbuffer: u32, samples: i32, internalformat: u32, width: i32, height: i32) { impl_NamedRenderbufferStorageMultisample(renderbuffer, samples, internalformat, width, height) }
GetNamedRenderbufferParameteriv :: proc "c" (renderbuffer: u32, pname: u32, params: [^]i32) { impl_GetNamedRenderbufferParameteriv(renderbuffer, pname, params) }
CreateTextures :: proc "c" (target: u32, n: i32, textures: [^]u32) { impl_CreateTextures(target, n, textures) }
TextureBuffer :: proc "c" (texture: u32, internalformat: u32, buffer: u32) { impl_TextureBuffer(texture, internalformat, buffer) }
TextureBufferRange :: proc "c" (texture: u32, internalformat: u32, buffer: u32, offset: int, size: int) { impl_TextureBufferRange(texture, internalformat, buffer, offset, size) }
TextureStorage1D :: proc "c" (texture: u32, levels: i32, internalformat: u32, width: i32) { impl_TextureStorage1D(texture, levels, internalformat, width) }
TextureStorage2D :: proc "c" (texture: u32, levels: i32, internalformat: u32, width: i32, height: i32) { impl_TextureStorage2D(texture, levels, internalformat, width, height) }
TextureStorage3D :: proc "c" (texture: u32, levels: i32, internalformat: u32, width: i32, height: i32, depth: i32) { impl_TextureStorage3D(texture, levels, internalformat, width, height, depth) }
TextureStorage2DMultisample :: proc "c" (texture: u32, samples: i32, internalformat: u32, width: i32, height: i32, fixedsamplelocations: bool) { impl_TextureStorage2DMultisample(texture, samples, internalformat, width, height, fixedsamplelocations) }
TextureStorage3DMultisample :: proc "c" (texture: u32, samples: i32, internalformat: u32, width: i32, height: i32, depth: i32, fixedsamplelocations: bool) { impl_TextureStorage3DMultisample(texture, samples, internalformat, width, height, depth, fixedsamplelocations) }
TextureSubImage1D :: proc "c" (texture: u32, level: i32, xoffset: i32, width: i32, format: u32, type: u32, pixels: rawptr) { impl_TextureSubImage1D(texture, level, xoffset, width, format, type, pixels) }
TextureSubImage2D :: proc "c" (texture: u32, level: i32, xoffset: i32, yoffset: i32, width: i32, height: i32, format: u32, type: u32, pixels: rawptr) { impl_TextureSubImage2D(texture, level, xoffset, yoffset, width, height, format, type, pixels) }
TextureSubImage3D :: proc "c" (texture: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, width: i32, height: i32, depth: i32, format: u32, type: u32, pixels: rawptr) { impl_TextureSubImage3D(texture, level, xoffset, yoffset, zoffset, width, height, depth, format, type, pixels) }
CompressedTextureSubImage1D :: proc "c" (texture: u32, level: i32, xoffset: i32, width: i32, format: u32, imageSize: i32, data: rawptr) { impl_CompressedTextureSubImage1D(texture, level, xoffset, width, format, imageSize, data) }
CompressedTextureSubImage2D :: proc "c" (texture: u32, level: i32, xoffset: i32, yoffset: i32, width: i32, height: i32, format: u32, imageSize: i32, data: rawptr) { impl_CompressedTextureSubImage2D(texture, level, xoffset, yoffset, width, height, format, imageSize, data) }
CompressedTextureSubImage3D :: proc "c" (texture: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, width: i32, height: i32, depth: i32, format: u32, imageSize: i32, data: rawptr) { impl_CompressedTextureSubImage3D(texture, level, xoffset, yoffset, zoffset, width, height, depth, format, imageSize, data) }
CopyTextureSubImage1D :: proc "c" (texture: u32, level: i32, xoffset: i32, x: i32, y: i32, width: i32) { impl_CopyTextureSubImage1D(texture, level, xoffset, x, y, width) }
CopyTextureSubImage2D :: proc "c" (texture: u32, level: i32, xoffset: i32, yoffset: i32, x: i32, y: i32, width: i32, height: i32) { impl_CopyTextureSubImage2D(texture, level, xoffset, yoffset, x, y, width, height) }
CopyTextureSubImage3D :: proc "c" (texture: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, x: i32, y: i32, width: i32, height: i32) { impl_CopyTextureSubImage3D(texture, level, xoffset, yoffset, zoffset, x, y, width, height) }
TextureParameterf :: proc "c" (texture: u32, pname: u32, param: f32) { impl_TextureParameterf(texture, pname, param) }
TextureParameterfv :: proc "c" (texture: u32, pname: u32, param: ^f32) { impl_TextureParameterfv(texture, pname, param) }
TextureParameteri :: proc "c" (texture: u32, pname: u32, param: i32) { impl_TextureParameteri(texture, pname, param) }
TextureParameterIiv :: proc "c" (texture: u32, pname: u32, params: [^]i32) { impl_TextureParameterIiv(texture, pname, params) }
TextureParameterIuiv :: proc "c" (texture: u32, pname: u32, params: [^]u32) { impl_TextureParameterIuiv(texture, pname, params) }
TextureParameteriv :: proc "c" (texture: u32, pname: u32, param: ^i32) { impl_TextureParameteriv(texture, pname, param) }
GenerateTextureMipmap :: proc "c" (texture: u32) { impl_GenerateTextureMipmap(texture) }
BindTextureUnit :: proc "c" (unit: u32, texture: u32) { impl_BindTextureUnit(unit, texture) }
GetTextureImage :: proc "c" (texture: u32, level: i32, format: u32, type: u32, bufSize: i32, pixels: rawptr) { impl_GetTextureImage(texture, level, format, type, bufSize, pixels) }
GetCompressedTextureImage :: proc "c" (texture: u32, level: i32, bufSize: i32, pixels: rawptr) { impl_GetCompressedTextureImage(texture, level, bufSize, pixels) }
GetTextureLevelParameterfv :: proc "c" (texture: u32, level: i32, pname: u32, params: [^]f32) { impl_GetTextureLevelParameterfv(texture, level, pname, params) }
GetTextureLevelParameteriv :: proc "c" (texture: u32, level: i32, pname: u32, params: [^]i32) { impl_GetTextureLevelParameteriv(texture, level, pname, params) }
GetTextureParameterfv :: proc "c" (texture: u32, pname: u32, params: [^]f32) { impl_GetTextureParameterfv(texture, pname, params) }
GetTextureParameterIiv :: proc "c" (texture: u32, pname: u32, params: [^]i32) { impl_GetTextureParameterIiv(texture, pname, params) }
GetTextureParameterIuiv :: proc "c" (texture: u32, pname: u32, params: [^]u32) { impl_GetTextureParameterIuiv(texture, pname, params) }
GetTextureParameteriv :: proc "c" (texture: u32, pname: u32, params: [^]i32) { impl_GetTextureParameteriv(texture, pname, params) }
CreateVertexArrays :: proc "c" (n: i32, arrays: [^]u32) { impl_CreateVertexArrays(n, arrays) }
DisableVertexArrayAttrib :: proc "c" (vaobj: u32, index: u32) { impl_DisableVertexArrayAttrib(vaobj, index) }
EnableVertexArrayAttrib :: proc "c" (vaobj: u32, index: u32) { impl_EnableVertexArrayAttrib(vaobj, index) }
VertexArrayElementBuffer :: proc "c" (vaobj: u32, buffer: u32) { impl_VertexArrayElementBuffer(vaobj, buffer) }
VertexArrayVertexBuffer :: proc "c" (vaobj: u32, bindingindex: u32, buffer: u32, offset: int, stride: i32) { impl_VertexArrayVertexBuffer(vaobj, bindingindex, buffer, offset, stride) }
VertexArrayVertexBuffers :: proc "c" (vaobj: u32, first: u32, count: i32, buffers: [^]u32, offsets: [^]uintptr, strides: [^]i32) { impl_VertexArrayVertexBuffers(vaobj, first, count, buffers, offsets, strides) }
VertexArrayAttribBinding :: proc "c" (vaobj: u32, attribindex: u32, bindingindex: u32) { impl_VertexArrayAttribBinding(vaobj, attribindex, bindingindex) }
VertexArrayAttribFormat :: proc "c" (vaobj: u32, attribindex: u32, size: i32, type: u32, normalized: bool, relativeoffset: u32) { impl_VertexArrayAttribFormat(vaobj, attribindex, size, type, normalized, relativeoffset) }
VertexArrayAttribIFormat :: proc "c" (vaobj: u32, attribindex: u32, size: i32, type: u32, relativeoffset: u32) { impl_VertexArrayAttribIFormat(vaobj, attribindex, size, type, relativeoffset) }
VertexArrayAttribLFormat :: proc "c" (vaobj: u32, attribindex: u32, size: i32, type: u32, relativeoffset: u32) { impl_VertexArrayAttribLFormat(vaobj, attribindex, size, type, relativeoffset) }
VertexArrayBindingDivisor :: proc "c" (vaobj: u32, bindingindex: u32, divisor: u32) { impl_VertexArrayBindingDivisor(vaobj, bindingindex, divisor) }
GetVertexArrayiv :: proc "c" (vaobj: u32, pname: u32, param: ^i32) { impl_GetVertexArrayiv(vaobj, pname, param) }
GetVertexArrayIndexediv :: proc "c" (vaobj: u32, index: u32, pname: u32, param: ^i32) { impl_GetVertexArrayIndexediv(vaobj, index, pname, param) }
GetVertexArrayIndexed64iv :: proc "c" (vaobj: u32, index: u32, pname: u32, param: ^i64) { impl_GetVertexArrayIndexed64iv(vaobj, index, pname, param) }
CreateSamplers :: proc "c" (n: i32, samplers: [^]u32) { impl_CreateSamplers(n, samplers) }
CreateProgramPipelines :: proc "c" (n: i32, pipelines: [^]u32) { impl_CreateProgramPipelines(n, pipelines) }
CreateQueries :: proc "c" (target: u32, n: i32, ids: [^]u32) { impl_CreateQueries(target, n, ids) }
GetQueryBufferObjecti64v :: proc "c" (id: u32, buffer: u32, pname: u32, offset: int) { impl_GetQueryBufferObjecti64v(id, buffer, pname, offset) }
GetQueryBufferObjectiv :: proc "c" (id: u32, buffer: u32, pname: u32, offset: int) { impl_GetQueryBufferObjectiv(id, buffer, pname, offset) }
GetQueryBufferObjectui64v :: proc "c" (id: u32, buffer: u32, pname: u32, offset: int) { impl_GetQueryBufferObjectui64v(id, buffer, pname, offset) }
GetQueryBufferObjectuiv :: proc "c" (id: u32, buffer: u32, pname: u32, offset: int) { impl_GetQueryBufferObjectuiv(id, buffer, pname, offset) }
MemoryBarrierByRegion :: proc "c" (barriers: u32) { impl_MemoryBarrierByRegion(barriers) }
GetTextureSubImage :: proc "c" (texture: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, width: i32, height: i32, depth: i32, format: u32, type: u32, bufSize: i32, pixels: rawptr) { impl_GetTextureSubImage(texture, level, xoffset, yoffset, zoffset, width, height, depth, format, type, bufSize, pixels) }
GetCompressedTextureSubImage :: proc "c" (texture: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, width: i32, height: i32, depth: i32, bufSize: i32, pixels: rawptr) { impl_GetCompressedTextureSubImage(texture, level, xoffset, yoffset, zoffset, width, height, depth, bufSize, pixels) }
GetGraphicsResetStatus :: proc "c" () -> u32 { ret := impl_GetGraphicsResetStatus(); return ret }
GetnCompressedTexImage :: proc "c" (target: u32, lod: i32, bufSize: i32, pixels: rawptr) { impl_GetnCompressedTexImage(target, lod, bufSize, pixels) }
GetnTexImage :: proc "c" (target: u32, level: i32, format: u32, type: u32, bufSize: i32, pixels: rawptr) { impl_GetnTexImage(target, level, format, type, bufSize, pixels) }
GetnUniformdv :: proc "c" (program: u32, location: i32, bufSize: i32, params: [^]f64) { impl_GetnUniformdv(program, location, bufSize, params) }
GetnUniformfv :: proc "c" (program: u32, location: i32, bufSize: i32, params: [^]f32) { impl_GetnUniformfv(program, location, bufSize, params) }
GetnUniformiv :: proc "c" (program: u32, location: i32, bufSize: i32, params: [^]i32) { impl_GetnUniformiv(program, location, bufSize, params) }
GetnUniformuiv :: proc "c" (program: u32, location: i32, bufSize: i32, params: [^]u32) { impl_GetnUniformuiv(program, location, bufSize, params) }
ReadnPixels :: proc "c" (x: i32, y: i32, width: i32, height: i32, format: u32, type: u32, bufSize: i32, data: rawptr) { impl_ReadnPixels(x, y, width, height, format, type, bufSize, data) }
GetnMapdv :: proc "c" (target: u32, query: u32, bufSize: i32, v: [^]f64) { impl_GetnMapdv(target, query, bufSize, v) }
GetnMapfv :: proc "c" (target: u32, query: u32, bufSize: i32, v: [^]f32) { impl_GetnMapfv(target, query, bufSize, v) }
GetnMapiv :: proc "c" (target: u32, query: u32, bufSize: i32, v: [^]i32) { impl_GetnMapiv(target, query, bufSize, v) }
GetnPixelMapusv :: proc "c" (map_: u32, bufSize: i32, values: [^]u16) { impl_GetnPixelMapusv(map_, bufSize, values) }
GetnPixelMapfv :: proc "c" (map_: u32, bufSize: i32, values: [^]f32) { impl_GetnPixelMapfv(map_, bufSize, values) }
GetnPixelMapuiv :: proc "c" (map_: u32, bufSize: i32, values: [^]u32) { impl_GetnPixelMapuiv(map_, bufSize, values) }
GetnPolygonStipple :: proc "c" (bufSize: i32, pattern: [^]u8) { impl_GetnPolygonStipple(bufSize, pattern) }
GetnColorTable :: proc "c" (target: u32, format: u32, type: u32, bufSize: i32, table: rawptr) { impl_GetnColorTable(target, format, type, bufSize, table) }
GetnConvolutionFilter :: proc "c" (target: u32, format: u32, type: u32, bufSize: i32, image: rawptr) { impl_GetnConvolutionFilter(target, format, type, bufSize, image) }
GetnSeparableFilter :: proc "c" (target: u32, format: u32, type: u32, rowBufSize: i32, row: rawptr, columnBufSize: i32, column: rawptr, span: rawptr) { impl_GetnSeparableFilter(target, format, type, rowBufSize, row, columnBufSize, column, span) }
GetnHistogram :: proc "c" (target: u32, reset: bool, format: u32, type: u32, bufSize: i32, values: rawptr) { impl_GetnHistogram(target, reset, format, type, bufSize, values) }
GetnMinmax :: proc "c" (target: u32, reset: bool, format: u32, type: u32, bufSize: i32, values: rawptr) { impl_GetnMinmax(target, reset, format, type, bufSize, values) }
TextureBarrier :: proc "c" () { impl_TextureBarrier() }
GetUnsignedBytevEXT :: proc "c" (pname: u32, data: ^byte) { impl_GetUnsignedBytevEXT(pname, data) }
TexPageCommitmentARB :: proc "c"(target: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, width: i32, height: i32, depth: i32, commit: bool) { impl_TexPageCommitmentARB(target, level, xoffset, yoffset, zoffset, width, height, depth, commit) }

// VERSION_4_6
SpecializeShader :: proc "c" (shader: u32, pEntryPoint: cstring, numSpecializationConstants: u32, pConstantIndex: ^u32, pConstantValue: ^u32) { impl_SpecializeShader(shader, pEntryPoint, numSpecializationConstants, pConstantIndex, pConstantValue) }
MultiDrawArraysIndirectCount :: proc "c" (mode: i32, indirect: [^]DrawArraysIndirectCommand, drawcount: i32, maxdrawcount, stride: i32) { impl_MultiDrawArraysIndirectCount(mode, indirect, drawcount, maxdrawcount, stride) }
MultiDrawElementsIndirectCount :: proc "c" (mode: i32, type: i32, indirect: [^]DrawElementsIndirectCommand, drawcount: i32, maxdrawcount, stride: i32) { impl_MultiDrawElementsIndirectCount(mode, type, indirect, drawcount, maxdrawcount, stride) }
PolygonOffsetClamp :: proc "c" (factor, units, clamp: f32) { impl_PolygonOffsetClamp(factor, units, clamp) }