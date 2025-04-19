#version 460 core

layout(location = 0) in vec2 v_texture;
layout(location = 1) in vec4 v_color;
layout(location = 2) in float v_texture_idx;

layout(location = 0) out vec4 f_color;

layout(binding = 0) uniform sampler2D s_textures[32];

void main() {
	uint i = uint(v_texture_idx);
	f_color = texture(s_textures[i], v_texture) * v_color;
}
