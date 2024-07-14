#pragma once

#include <filesystem>
#include "Types.h"

namespace Utils {
    class InMemoryFile {
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

    std::filesystem::path GetExePath();
};