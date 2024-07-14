#include <Thunderstorm/Types.h>
#include <Thunderstorm/Game.h>
#include <Thunderstorm/Graphics.h>

static u32 triangle;

void Initialize()
{
    triangle = Graphics::GLCreateTriangle();
}

void Deinitialize()
{
}

void Update(f32 delta)
{
}

void Render(f32 delta)
{
    Graphics::GLDrawTriangle(triangle);
}

s32 main(s32 argc, c8* argv[])
{
    Game::Application application = {
        Initialize,
        Deinitialize,
        Update,
        Render,
    };

    Game::Game game = Game::Game(application);
    game.Run();

    exit(0);
}
