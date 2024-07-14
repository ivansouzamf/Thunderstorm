#include <SDL2/SDL.h>
#include <epoxy/gl.h>

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