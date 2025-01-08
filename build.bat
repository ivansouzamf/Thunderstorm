@echo off
setlocal enabledelayedexpansion

set program_name=testbed.exe
set shader_dir=.\thunderstorm\shaders
set build_dir=.\bin
set build_flags=

if "%1" == "debug" (
	echo --- Building in debug mode ---
	set build_flags=-debug
) else if "%1" == "release" (
	echo --- Building in release mode ---
	set build_flags=-subsystem:windows -o:speed
) else if "%1" == "run" (
	echo --- Running %program_name% ---
	%build_dir%\%program_name%
	goto :end
) else (
	echo Invalid command. Use 'debug', 'release' or 'run'
	goto :end
)

echo --- Building shaders ---
for %%f in ("%shader_dir%\*") do (
	glslang --target-env opengl -G %shader_dir%\%%~nxf -o bin\%%~nxf.spv
)

odin build .\testbed -out:%build_dir%\%program_name% %build_flags%

:end