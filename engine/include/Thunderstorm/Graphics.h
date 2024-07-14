#pragma once

#include <filesystem>
#include "Types.h"

namespace Graphics {
    #pragma region Debug
        #define OPENGL_LOG_STRING_SIZE 2048

        void GLEnableDebug();
    #pragma endregion Debug

    #pragma region Shader
        // NOTE: only accepts spirv byte-code
        // NOTE: returns 0 and sets error on fail
        u32 GLCreateShader(void* shader, usize shaderSize, u32 shaderType, c8* error);

        // NOTE: returns 0 and sets error on fail
        u32 GLCreateProgram(u32 vertexShader, u32 fragmentShader, c8* error);

        u32 GLCreateProgramFromFile(std::filesystem::path vertexShaderFile, std::filesystem::path fragmentShaderFile);
    #pragma endregion Shader


    #pragma region BasicShapes
        u32 GLCreateTriangle();

        void GLDrawTriangle(u32 vertexArray);
    #pragma endregion BasicShapes
};