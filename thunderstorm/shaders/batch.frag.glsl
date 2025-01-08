#version 460

layout(location = 0) in vec2 v_texture;
layout(location = 1) in float v_texture_idx;

layout(location = 0) out vec4 f_color;

layout(binding = 0) uniform sampler2D s_textures[32];

void main() {
	uint index = uint(v_texture_idx);
	f_color = texture(s_textures[index], v_texture);
}