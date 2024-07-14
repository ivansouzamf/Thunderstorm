#include <epoxy/gl.h>

#include "Graphics.h"

u32 GLCreateTriangle()
{
    f32 vertices[] = {
        -1.0f, -1.0f, 0.0f, 1.0f, 0.0f, 0.0f,
        1.0f, -1.0f, 0.0f, 0.0f, 1.0f, 0.0f,
        0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f
    };

    u32 vertexBuffer;
    glCreateBuffers(1, &vertexBuffer);
    glNamedBufferStorage(vertexBuffer, sizeof(vertices), vertices, GL_DYNAMIC_STORAGE_BIT);

    u32 vertexArray;
    glCreateVertexArrays(1, &vertexArray);
    glVertexArrayVertexBuffer(vertexArray, 0, vertexBuffer, 0, sizeof(f32) * 6); // 3 vertices + 3 colors
    
    glEnableVertexArrayAttrib(vertexArray, 0);
    glEnableVertexArrayAttrib(vertexArray, 1);

    glVertexArrayAttribFormat(vertexArray, 0, 3, GL_FLOAT, false, 0);
    glVertexArrayAttribFormat(vertexArray, 1, 3, GL_FLOAT, false, 3 * sizeof(f32));

    glVertexArrayAttribBinding(vertexArray, 0, 0);
    glVertexArrayAttribBinding(vertexArray, 1, 0);

    u32 program = GLCreateProgramFromFile("default.vert.glsl.spv", "default.frag.glsl.spv");
    glUseProgram(program);

    return vertexArray;
}

void GLDrawTriangle(u32 vertexArray)
{
    glBindVertexArray(vertexArray);
    glDrawArrays(GL_TRIANGLES, 0, 3);
    glBindVertexArray(0); // unbind
}
