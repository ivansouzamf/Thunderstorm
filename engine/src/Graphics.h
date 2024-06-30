#pragma once

#include <filesystem>
#include <cstring>
#include <SDL2/SDL.h>
#include <epoxy/gl.h>
#include "Utils.h"
#include "Defines.h"

#define OPENGL_LOG_STRING_SIZE 2048

// NOTE: only accepts spirv byte-code
// NOTE: returns 0 and sets error on fail
THUNDERSTORM_API u32 GLCreateShader(void* shader, usize shaderSize, u32 shaderType, c8* error);

// NOTE: returns 0 and sets error on fail
THUNDERSTORM_API u32 GLCreateProgram(u32 vertexShader, u32 fragmentShader, c8* error);

THUNDERSTORM_API u32 GLCreateProgramFromFile(std::filesystem::path vertexShaderFile, std::filesystem::path fragmentShaderFile);

THUNDERSTORM_API u32 GLCreateTriangle();

THUNDERSTORM_API void GLDrawTriangle(u32 vertexArray);
