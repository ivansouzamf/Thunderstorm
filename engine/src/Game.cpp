#include "Game.h"

Game::Game(Application application)
{
    m_application = application;
}

Game::Game(Application application, WindowSettings settings) : Game(application)
{
    SetWindowSettings(settings);
}

void Game::Initialize()
{
    SDL_LogInfo(SDL_LOG_CATEGORY_APPLICATION, "Initializing..."); 

    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        SDL_LogCritical(SDL_LOG_CATEGORY_APPLICATION, "Couldn't initialize SDL: %s", SDL_GetError());
        exit(-1);
    }

    // all of these must be called after SDL_Init()
    // set opengl version and profile
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 4);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 6);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_CORE);
    // enable double buffering with color depth size
    SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
    SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 24);

    m_window = SDL_CreateWindow(m_windowTitle.c_str(), SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, m_windowWidth, m_windowHeight, SDL_WINDOW_OPENGL | SDL_WINDOW_SHOWN | SDL_WINDOW_RESIZABLE);
    if (m_window == nullptr) {
        SDL_LogCritical(SDL_LOG_CATEGORY_APPLICATION, "Couldn't create a SDL window: %s", SDL_GetError());
        exit(-1);
    }
    SDL_LogInfo(SDL_LOG_CATEGORY_APPLICATION, "Window successfully created");
    
    m_windowGLContext = SDL_GL_CreateContext(m_window);
    if (m_windowGLContext == NULL) {
        SDL_LogCritical(SDL_LOG_CATEGORY_APPLICATION, "Couldn't create a OpenGL context: %s", SDL_GetError());
        exit(-1);
    }
    SDL_GL_MakeCurrent(m_window, m_windowGLContext);
    SDL_LogInfo(SDL_LOG_CATEGORY_APPLICATION, "OpenGL context successfully created");
    
    std::string missingExtension = CheckGLExtensions();
    if (missingExtension != "") {
        SDL_LogCritical(SDL_LOG_CATEGORY_APPLICATION, "Your system is missing the following OpenGL extension: %s", missingExtension.c_str());
        exit(-1); 
    }

    SDL_LogInfo(SDL_LOG_CATEGORY_APPLICATION, "Loaded OpenGL version: %s", glGetString(GL_VERSION));
    
    // setup some opengl stuff
    /*
    {
        glCullFace(GL_BACK);
        glEnable(GL_CULL_FACE);
        glEnable(GL_DEPTH_TEST);
        glDisable(GL_STENCIL_TEST);
        glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
    } */

    m_application.Initialize();
}

void Game::Deinitialize()
{
    SDL_LogInfo(SDL_LOG_CATEGORY_APPLICATION, "Deinitializing...");
    m_application.Deinitialize();
    SDL_GL_DeleteContext(m_windowGLContext);
    SDL_DestroyWindow(m_window);
    SDL_Quit();
}

void Game::Update()
{
    // delta && timing stuff
    static u64 lastTime = 0;
    u64 currentTime = SDL_GetTicks64();
    m_delta = (f32) ((currentTime - lastTime) / 1000.0f);
    lastTime = currentTime;
    //SDL_LogInfo(SDL_LOG_CATEGORY_APPLICATION, "delta: %f", m_delta);

    m_application.Update(m_delta);
}

void Game::Render()
{
    glClear(GL_COLOR_BUFFER_BIT);
    m_application.Render(m_delta);
    // swap buffers
    SDL_GL_SwapWindow(m_window);
}

void Game::Run()
{
    SDL_LogInfo(SDL_LOG_CATEGORY_APPLICATION, "Hello from '%s'", m_windowTitle.c_str());

    Initialize();

    while (m_isRunning) {
        while (SDL_PollEvent(&m_windowEvent)) {
            switch (m_windowEvent.type) {
                case SDL_QUIT: {
                    m_isRunning = false;
                } break;
                
                case SDL_WINDOWEVENT: {
                    SDL_WindowEvent event = m_windowEvent.window;
                    if (event.event == SDL_WINDOWEVENT_RESIZED) {
                        m_windowWidth = event.data1;
                        m_windowHeight = event.data2;
                        glViewport(0, 0, m_windowWidth, m_windowHeight);
                        SDL_LogInfo(SDL_LOG_CATEGORY_APPLICATION, "The window has been resized. New size: %dX%d", m_windowWidth, m_windowHeight);
                    }
                } break;
                
                default: {
                } break;
            }
        }

        Update();
        Render();
    }

    Deinitialize();
}

void Game::SetWindowSettings(WindowSettings settings)
{
    m_windowWidth = settings.width;
    m_windowHeight = settings.height;
    m_windowTitle = settings.title;

    if (m_window != nullptr) {
        SDL_SetWindowSize(m_window, m_windowWidth, m_windowHeight);
        SDL_SetWindowTitle(m_window, m_windowTitle.c_str());
    }
}

std::string Game::CheckGLExtensions()
{
    for (auto extension : m_glExtensions) {
        if (epoxy_has_gl_extension(extension.c_str())) {
            continue;
        }
        return extension;
    }

    return "";
}
