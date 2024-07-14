#pragma once

#include <string>
#include "Types.h"

namespace Game {
    struct WindowSettings {
        u16 width;
        u16 height;
        std::string title;
    };

    struct Application {
        void (*Initialize)();
        void (*Deinitialize)();
        void (*Update)(f32 delta);
        void (*Render)(f32 delta);
    };

    class Game {
    public:
        Game(Application application);
        Game(Application application, WindowSettings settings);
        void Run();
        void SetWindowSettings(WindowSettings settings);
    };
};