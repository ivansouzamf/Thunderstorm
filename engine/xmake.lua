add_rules("mode.debug", "mode.release")
add_requires("libsdl", "libepoxy", "glslang")

target("engine")
    -- set basic project settings
    set_basename("thunderstorm")
    set_languages("c++17")
    set_kind("shared")
    add_files("src/*.cpp")
    add_includedirs("include", { public = true })

    -- compile shaders
    add_rules("utils.glsl2spv", { outputdir = "$(buildir)/$(plat)/$(arch)/$(mode)" })
    add_files("src/shaders/*.glsl")

    -- add dependencies
    add_packages("libsdl", "libepoxy", "glslang")
target_end()