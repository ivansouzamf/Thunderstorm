@echo off
setlocal enabledelayedexpansion

set /A build_shaders = 0
set shaders[0]=default.frag.glsl
set shaders[1]=default.vert.glsl

if "%1" == "debug" (
    echo --- Building in debug mode ---
    odin build ./testbed -out:./bin/testbed.exe -debug
    set /A build_shaders = 1
) else if "%1" == "release" (
    echo --- Building in release mode ---
    odin build ./testbed -out:./bin/testbed.exe -subsystem:windows -o:speed
    set /A build_shaders = 1
) else (
    echo You have to provide a valid build mode. Either 'debug' or 'release'
)

if %build_shaders% == 1 (
    echo --- Building shaders ---
    for /l %%i in (0, 1, 1) do (
        glslang --target-env opengl -V thunderstorm\shaders\!shaders[%%i]! -o bin\!shaders[%%i]!.spv
    )
)