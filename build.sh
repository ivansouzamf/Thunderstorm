#!/bin/sh

build_shaders=0
shaders[0]="default.frag.glsl"
shaders[1]="default.vert.glsl"

if [ "$1" == "debug" ]; then
    echo "--- Building in debug mode ---"
    odin build ./testbed -collection:thunderstorm=./engine -out:./bin/testbed -debug
    build_shaders=1
elif [ "$1" == "release" ]; then
    echo "--- Building in release mode ---"
    odin build ./testbed -collection:thunderstorm=./engine -out:./bin/testbed -o:speed
    build_shaders=1
else 
    echo "You have to provide a valid build mode. Either 'debug' or 'release'"
fi

if [ $build_shaders -eq 1 ]; then
    echo "--- Building shaders ---"
    for i in "${shaders[@]}"; do
        glslang --target-env opengl -V engine/graphics/shaders/"$i" -o bin/"$i".spv
    done
fi
