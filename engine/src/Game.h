#pragma once

#include <SDL2/SDL.h>
#include <string>
#include <vector>
#include "Defines.h"

namespace Game {
    static std::string requiredExtensions[] = {
        "GL_ARB_gl_spirv",
        "GL_ARB_direct_state_access",
    };

    struct THUNDERSTORM_API WindowSettings {
        u16 width;
        u16 height;
        std::string title;
    };

    struct THUNDERSTORM_API Application {
        void (*Initialize)();
        void (*Deinitialize)();
        void (*Update)(f32 delta);
        void (*Render)(f32 delta);
    };

    class THUNDERSTORM_API Game {
    private:
        SDL_Window* m_window = nullptr;
        SDL_GLContext m_windowGLContext;
        SDL_Event m_windowEvent;
        u16 m_windowWidth = 800;
        u16 m_windowHeight = 600;
        std::string m_windowTitle = "Thunderstorm Application";
        std::vector<std::string> m_glExtensions = std::vector(std::begin(requiredExtensions), std::end(requiredExtensions));
        Application m_application;
        f32 m_delta;
        b8 m_isRunning = true;

    private:
        void Initialize();
        void Deinitialize();
        void Update();
        void Render();
        // NOTE: returns a empty string if success
        std::string CheckGLExtensions();
    public:
        Game(Application application);
        Game(Application application, WindowSettings settings);
        void Run();
        void SetWindowSettings(WindowSettings settings);
    };
};