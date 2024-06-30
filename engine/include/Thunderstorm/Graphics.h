#pragma once

#include <filesystem>
#include "Types.h"

#define OPENGL_LOG_STRING_SIZE 2048

// NOTE: only accepts spirv byte-code
// NOTE: returns 0 and sets error on fail
u32 GLCreateShader(void* shader, usize shaderSize, u32 shaderType, c8* error);

// NOTE: returns 0 and sets error on fail
u32 GLCreateProgram(u32 vertexShader, u32 fragmentShader, c8* error);

u32 GLCreateProgramFromFile(std::filesystem::path vertexShaderFile, std::filesystem::path fragmentShaderFile);

u32 GLCreateTriangle();

void GLDrawTriangle(u32 vertexArray);