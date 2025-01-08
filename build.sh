#!/bin/sh

program_name="testbed"
shader_dir="./thunderstorm/shaders"
build_dir="./bin"
build_flags=""

if [ "$1" == "debug" ]; then
    echo "--- Building in debug mode ---"
    build_flags="-debug"
elif [ "$1" == "release" ]; then
    echo "--- Building in release mode ---"
    build_flags="-o:speed"
elif [ "$1" == "run" ]; then
    echo "--- Running $program_name ---"
    $build_dir/$program_name
    exit $?
else
    echo "Invalid command. Use 'debug', 'release' or 'run'"
    exit -1 
fi

echo "--- Building shaders ---"
for file in "$shader_dir"/*; do
    f=$(basename "$file")
    glslang --target-env opengl -G $shader_dir/$f -o bin/$f.spv
done

odin build ./testbed -out:$build_dir/$program_name $build_flags

exit $?