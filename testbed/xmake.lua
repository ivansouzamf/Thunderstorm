add_rules("mode.debug", "mode.release")

target("testbed")
    set_kind("binary")
    set_languages("c++17")
    add_files("src/*.cpp")
    add_deps("engine")
target_end()