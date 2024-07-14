#pragma once

#include <filesystem>
#include "../Defines.h"

#pragma region Debug
#define OPENGL_LOG_STRING_SIZE 2048

THUNDERSTORM_API void GLEnableDebug();
#pragma endregion Debug


#pragma region Shader
// NOTE: only accepts spirv byte-code
// NOTE: returns 0 and sets error on fail
THUNDERSTORM_API u32 GLCreateShader(void* shader, usize shaderSize, u32 shaderType, c8* error);

// NOTE: returns 0 and sets error on fail
THUNDERSTORM_API u32 GLCreateProgram(u32 vertexShader, u32 fragmentShader, c8* error);

THUNDERSTORM_API u32 GLCreateProgramFromFile(std::filesystem::path vertexShaderFile, std::filesystem::path fragmentShaderFile);
#pragma endregion Shader


#pragma region BasicShapes
THUNDERSTORM_API u32 GLCreateTriangle();

THUNDERSTORM_API void GLDrawTriangle(u32 vertexArray);
#pragma endregion BasicShapes