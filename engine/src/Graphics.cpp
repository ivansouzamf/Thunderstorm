#include "Graphics.h"

u32 GLCreateShader(void* shader, usize shaderSize, u32 shaderType, c8* error)
{
    u32 shaderId = glCreateShader(shaderType);
    glShaderBinary(1, &shaderId, GL_SHADER_BINARY_FORMAT_SPIR_V_ARB, shader, shaderSize);
    glSpecializeShader(shaderId, "main", 0, 0, 0);

    s32 compiled = 0;
    glGetShaderiv(shaderId, GL_COMPILE_STATUS, &compiled);
    if (!compiled) {
        s32 logSize = 0;
        glGetShaderInfoLog(shaderId, OPENGL_LOG_STRING_SIZE, &logSize, error);
        return 0;
    }
    
    strcpy(error, ""); 

    return shaderId;
}

u32 GLCreateProgram(u32 vertexShader, u32 fragmentShader, c8* error)
{
    u32 programId = glCreateProgram();
    glAttachShader(programId, vertexShader);
    glAttachShader(programId, fragmentShader);

    s32 logSize = 0;

    s32 linked = -1;
    glLinkProgram(programId);
    glGetProgramiv(programId, GL_LINK_STATUS, &linked);
    if (linked != GL_TRUE) {
        glGetProgramInfoLog(programId, OPENGL_LOG_STRING_SIZE, &logSize, error);
        return 0;
    }

    s32 valid = -1;
    glValidateProgram(programId);
    glGetProgramiv(programId, GL_VALIDATE_STATUS, &valid);
    if (valid != GL_TRUE) {
        glGetProgramInfoLog(programId, OPENGL_LOG_STRING_SIZE, &logSize, error);
        return 0;
    }

    glDeleteShader(vertexShader);
    glDeleteShader(fragmentShader);

    strcpy(error, ""); 

    return programId;
}

u32 GLCreateProgramFromFile(std::filesystem::path vertexShaderFile, std::filesystem::path fragmentShaderFile)
{
    c8 errorStr[OPENGL_LOG_STRING_SIZE] = {};

    InMemoryFile vertexShaderInMemory = InMemoryFile(vertexShaderFile);
    InMemoryFile fragmentShaderInMemory = InMemoryFile(fragmentShaderFile);
    if (!vertexShaderInMemory.IsLoaded() || !fragmentShaderInMemory.IsLoaded()) {
        SDL_LogCritical(SDL_LOG_CATEGORY_APPLICATION, "Couldn't load OpenGL shader file");
    }

    u32 vertexShaderId = GLCreateShader(vertexShaderInMemory.GetContent(), vertexShaderInMemory.GetSize(), GL_VERTEX_SHADER, errorStr);
    u32 fragmentShaderId = GLCreateShader(fragmentShaderInMemory.GetContent(), fragmentShaderInMemory.GetSize(), GL_FRAGMENT_SHADER, errorStr);

    if ((fragmentShaderId == 0 || vertexShaderId == 0) && !strcmp(errorStr, "")) {
        SDL_LogCritical(SDL_LOG_CATEGORY_APPLICATION, "Couldn't create OpenGL shader: %s", errorStr);
        exit(-1);
    }

    u32 programId = GLCreateProgram(vertexShaderId, fragmentShaderId, errorStr);
    if (programId == 0 && !strcmp(errorStr, "")) {
        SDL_LogCritical(SDL_LOG_CATEGORY_APPLICATION, "Couldn't create OpenGL program: %s", errorStr);
        exit(-1);
    }

    return programId;
}

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
    glBindVertexArray(vertexArray); // unbind
}
