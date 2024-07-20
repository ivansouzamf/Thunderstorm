#!/bin/sh

if [ "$1" == "debug" ]; then
    echo "--- Building in debug mode ---"
    odin build ./testbed -collection:thunderstorm=./engine -out:./bin/testbed -debug
elif [ "$1" == "release" ]; then
    echo "--- Building in release mode ---"
    odin build ./testbed -collection:thunderstorm=./engine -out:./bin/testbed -o:speed
else 
    echo "You have to provide a valid build mode. Either 'debug' or 'release'"
fi