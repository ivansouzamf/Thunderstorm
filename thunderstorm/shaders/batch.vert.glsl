#version 460 core

layout(location = 0) in vec2 a_position;
layout(location = 1) in vec2 a_texture;
layout(location = 2) in float a_texture_idx;

layout(location = 0) out vec2 v_texture;
layout(location = 1) out float v_texture_idx;

layout(location = 0) uniform mat4 u_projection;
layout(location = 1) uniform mat4 u_transform;

void main() {
    gl_Position = u_projection * vec4(a_position, 0, 1.0);
    //gl_Position = u_projection * u_transform * vec4(a_position, 0, 1.0);
    v_texture = a_texture;
    v_texture_idx = a_texture_idx;
}