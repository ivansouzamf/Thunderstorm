#include "Utils.h"

InMemoryFile::InMemoryFile()
{
}

InMemoryFile::InMemoryFile(std::filesystem::path filePath)
{
    Load(filePath);
}

b8 InMemoryFile::IsLoaded()
{
    if (m_content == nullptr || m_size <= 0) {
        return false;
    }

    return true;
}

b8 InMemoryFile::Load(std::filesystem::path filePath)
{
    Unload();

    std::ifstream file = std::ifstream(filePath, std::ios::binary);
    if (!file.is_open()) {
        file.close();
        return false;
    }

    file.seekg(0, std::ios::end);
    m_size = file.tellg();
    file.seekg(0, std::ios::beg);

    m_content = std::malloc(m_size + 1);
    if (!file.read((c8*) m_content, m_size)) {
        Unload();
        file.close();
        return false;
    }
    file.close();

    return true;
}

void InMemoryFile::Unload()
{
    if (IsLoaded()) {
        std::free(m_content);
        m_content = nullptr;
        m_size = 0;
    }
}

void* InMemoryFile::GetContent()
{
    return m_content;
}

usize InMemoryFile::GetSize()
{
    return m_size;
}


std::filesystem::path GetExePath()
{
    std::filesystem::path path = "";
    c8* tempPath = nullptr;
    
    tempPath = SDL_GetBasePath();
    if (tempPath != nullptr) {
        path = tempPath;
        SDL_free((void*) tempPath);
    }

    return path;
}