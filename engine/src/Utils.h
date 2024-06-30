#pragma once

#include <cstdlib>
#include <fstream>
#include <filesystem>
#include <SDL2/SDL.h>
#include "Defines.h"

class THUNDERSTORM_API InMemoryFile {
private:
    void* m_content = nullptr;
    usize m_size = 0;

public:
    InMemoryFile();
    InMemoryFile(std::filesystem::path filePath);
    b8 IsLoaded();
    b8 Load(std::filesystem::path filePath);
    void Unload();
    void* GetContent(); 
    usize GetSize();
};

THUNDERSTORM_API std::filesystem::path GetExePath();