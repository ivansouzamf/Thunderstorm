#pragma once

#include <filesystem>
#include <cstring>
#include <SDL2/SDL.h>
#include <epoxy/gl.h>
#include "../Utils.h"
#include "../Defines.h"
#include "BasicShapes.h"

#define OPENGL_LOG_STRING_SIZE 2048

THUNDERSTORM_API void GLEnableDebug();

// NOTE: only accepts spirv byte-code
// NOTE: returns 0 and sets error on fail
THUNDERSTORM_API u32 GLCreateShader(void* shader, usize shaderSize, u32 shaderType, c8* error);

// NOTE: returns 0 and sets error on fail
THUNDERSTORM_API u32 GLCreateProgram(u32 vertexShader, u32 fragmentShader, c8* error);

THUNDERSTORM_API u32 GLCreateProgramFromFile(std::filesystem::path vertexShaderFile, std::filesystem::path fragmentShaderFile);
