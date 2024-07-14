#include <SDL2/SDL.h>
#include <epoxy/gl.h>
#include <filesystem>
#include <cstring>
#include "../Utils.h"

#include "Graphics.h"

u32 Graphics::GLCreateShader(void* shader, usize shaderSize, u32 shaderType, c8* error)
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

    return shaderId;
}

u32 Graphics::GLCreateProgram(u32 vertexShader, u32 fragmentShader, c8* error)
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

    return programId;
}

u32 Graphics::GLCreateProgramFromFile(std::filesystem::path vertexShaderFile, std::filesystem::path fragmentShaderFile)
{
    c8 errorStr[OPENGL_LOG_STRING_SIZE] = "";

    Utils::InMemoryFile vertexShaderInMemory = Utils::InMemoryFile(vertexShaderFile);
    Utils::InMemoryFile fragmentShaderInMemory = Utils::InMemoryFile(fragmentShaderFile);
    if (!vertexShaderInMemory.IsLoaded() || !fragmentShaderInMemory.IsLoaded()) {
        SDL_LogCritical(SDL_LOG_CATEGORY_APPLICATION, "Couldn't load OpenGL shader file");
    }

    u32 vertexShaderId = Graphics::GLCreateShader(vertexShaderInMemory.GetContent(), vertexShaderInMemory.GetSize(), GL_VERTEX_SHADER, errorStr);
    u32 fragmentShaderId = Graphics::GLCreateShader(fragmentShaderInMemory.GetContent(), fragmentShaderInMemory.GetSize(), GL_FRAGMENT_SHADER, errorStr);

    if ((fragmentShaderId == 0 || vertexShaderId == 0) && !strcmp(errorStr, "")) {
        SDL_LogCritical(SDL_LOG_CATEGORY_APPLICATION, "Couldn't create OpenGL shader: %s", errorStr);
        exit(-1);
    }

    u32 programId = Graphics::GLCreateProgram(vertexShaderId, fragmentShaderId, errorStr);
    if (programId == 0 && !strcmp(errorStr, "")) {
        SDL_LogCritical(SDL_LOG_CATEGORY_APPLICATION, "Couldn't create OpenGL program: %s", errorStr);
        exit(-1);
    }

    return programId;
}