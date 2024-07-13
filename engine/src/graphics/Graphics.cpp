#include "Graphics.h"

void APIENTRY GLDebugCallback(u32 source, u32 type, u32 id, u32 severity, s32 length, const c8* message, const void* userData)
{
    c8* _source;
    c8* _type; 
    
    switch (source) {
        case GL_DEBUG_SOURCE_API: {
            _source = "API";
        } break;

        case GL_DEBUG_SOURCE_WINDOW_SYSTEM: {
            _source = "WINDOW_SYSTEM";
        } break;

        case GL_DEBUG_SOURCE_SHADER_COMPILER: {
            _source = "SHADER_COMPILER";
        } break;

        case GL_DEBUG_SOURCE_THIRD_PARTY: {
            _source = "THIRD_PARTY";
        } break;

        case GL_DEBUG_SOURCE_APPLICATION: {
            _source = "APPLICATION";
        } break;

        default: {
            _source = "UNKNOWN";
        } break;
    }

    switch (type) {
        case GL_DEBUG_TYPE_ERROR: {
           _type = "ERROR"; 
        } break;

        case GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR: {
           _type = "DEPRECATED_BEHAVIOR"; 
        } break;
        
        case GL_DEBUG_TYPE_PORTABILITY: {
            _type = "PORTABILITY"; 
        } break;
        
        case GL_DEBUG_TYPE_PERFORMANCE: {
            _type = "PERFORMANCE";
        } break;
        
        case GL_DEBUG_TYPE_MARKER: {
            _type = "MARKER"; 
        } break;
        
        default: {
            _type = "UNKNOWN";
        } break;
    }
    
    // switch debug level
    switch (severity) {
        case GL_DEBUG_SEVERITY_HIGH: {
            SDL_LogError(SDL_LOG_CATEGORY_APPLICATION, "[OPENGL_LOG id: %d, type: %s, source: %s] %s", id, _type, _source, message); 
        } break;

        case GL_DEBUG_SEVERITY_MEDIUM: {
            SDL_LogWarn(SDL_LOG_CATEGORY_APPLICATION, "[OPENGL_LOG id: %d, type: %s, source: %s] %s", id, _type, _source, message); 
        } break;
        
        default: { // handle 'GL_DEBUG_SEVERITY_LOW' and 'GL_DEBUG_SEVERITY_NOTIFICATION'
            SDL_LogInfo(SDL_LOG_CATEGORY_APPLICATION, "[OPENGL_LOG id: %d, type: %s, source: %s] %s", id, _type, _source, message); 
        } break;
    }
}

void GLEnableDebug()
{
    glEnable(GL_DEBUG_OUTPUT);
    glEnable(GL_DEBUG_OUTPUT_SYNCHRONOUS);
    glDebugMessageCallback(GLDebugCallback, nullptr);
}

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

    return programId;
}

u32 GLCreateProgramFromFile(std::filesystem::path vertexShaderFile, std::filesystem::path fragmentShaderFile)
{
    c8 errorStr[OPENGL_LOG_STRING_SIZE] = "";

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
