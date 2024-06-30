#pragma once

#include "Types.h"

#ifdef _WIN32
#define THUNDERSTORM_API __declspec(dllexport)
#else
#define THUNDERSTORM_API
#endif
