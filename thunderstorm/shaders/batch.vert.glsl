#version 460 core

// Stupid OpenGL can't read a mat4 like a real one
layout(location = 0) in vec4 a_transform1;
layout(location = 1) in vec4 a_transform2;
layout(location = 2) in vec4 a_transform3;
layout(location = 3) in vec4 a_transform4;

layout(location = 4) in vec2 a_position;
layout(location = 5) in vec2 a_texture;
layout(location = 6) in vec4 a_color;
layout(location = 7) in float a_texture_idx;

layout(location = 0) out vec2 v_texture;
layout(location = 1) out vec4 v_color;
layout(location = 2) out float v_texture_idx;

layout(location = 0) uniform mat4 u_projection;

void main() {
    v_texture = a_texture;
    v_color = a_color;
    v_texture_idx = a_texture_idx;
    mat4 a_transform = mat4(a_transform1, a_transform2, a_transform3, a_transform4);
    gl_Position = u_projection * a_transform * vec4(a_position, 0.0, 1.0);
}
