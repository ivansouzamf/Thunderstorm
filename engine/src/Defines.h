#pragma once

#include "Types.h"

// export symbols
#ifdef _WIN32
    #define THUNDERSTORM_API __declspec(dllexport)
#else
    #define THUNDERSTORM_API // linux export symbols by default
#endif
