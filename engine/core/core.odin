package core

import "core:sync"
import "core:strings"
import "vendor:sdl2"
import "../utils"
import gl "../graphics/opengl"

@(private)
engine_runtime: struct {
    window: ^sdl2.Window,
    window_GL_context, init_GL_context: sdl2.GLContext,
    window_width, window_height: i32,
    window_title: string,
    delta: f32,
    running: b8,

    input: struct {
        keyboard: Keyboard_Input,
        mouse_pos: Mouse_Pos_Input,
        mouse_button: Mouse_Button_Input,
        mouse_wheel: i32,
    },

    mutex: sync.Atomic_Mutex,
}

engine_init :: proc(window_width, window_height: i32, window_title: string) {
    utils.assert_log(!engine_runtime.running, "You can't call '%v' twice", #location().procedure)
    
    defer free_all(context.temp_allocator)

    err := sdl2.Init(sdl2.INIT_VIDEO) 
    utils.assert_log(err == 0, sdl2.GetErrorString())

    engine_runtime.window_width = window_width
    engine_runtime.window_height = window_height
    engine_runtime.window_title = window_title

    window_title_cstr, alloc_err := strings.clone_to_cstring(window_title, context.temp_allocator)
    engine_runtime.window = sdl2.CreateWindow(window_title_cstr, sdl2.WINDOWPOS_CENTERED, sdl2.WINDOWPOS_CENTERED, window_width, window_height, sdl2.WINDOW_OPENGL | sdl2.WINDOW_SHOWN | sdl2.WINDOW_RESIZABLE)
    utils.assert_log(engine_runtime.window != nil, sdl2.GetErrorString())
   
    engine_runtime.window_GL_context = sdl2.GL_CreateContext(engine_runtime.window)
    utils.assert_log(engine_runtime.window_GL_context != nil, sdl2.GetErrorString())
    engine_runtime.init_GL_context= sdl2.GL_CreateContext(engine_runtime.window)
    utils.assert_log(engine_runtime.init_GL_context != nil, sdl2.GetErrorString())
    
    // opengl stuff
    sdl2.GL_SetAttribute(.CONTEXT_MAJOR_VERSION, 4);
    sdl2.GL_SetAttribute(.CONTEXT_MINOR_VERSION, 6);
    sdl2.GL_SetAttribute(.CONTEXT_PROFILE_MASK, i32(sdl2.GLprofile.CORE));
    sdl2.GL_SetAttribute(.SHARE_WITH_CURRENT_CONTEXT, 1);
    sdl2.GL_SetAttribute(.DOUBLEBUFFER, 1);
    sdl2.GL_SetAttribute(.DEPTH_SIZE, 24);
    sdl2.GL_MakeCurrent(engine_runtime.window, engine_runtime.init_GL_context)
    gl.load_up_to(4, 6, sdl2.gl_set_proc_address)
    
    engine_runtime.running = true // set to true just to run the first iteration
}

engine_deinit :: proc() {
    sdl2.GL_DeleteContext(engine_runtime.window_GL_context)
    sdl2.DestroyWindow(engine_runtime.window)
    sdl2.Quit()
}

engine_init_render :: proc() {
    sync.lock(&engine_runtime.mutex)
    defer sync.unlock(&engine_runtime.mutex)
    
    sdl2.GL_MakeCurrent(engine_runtime.window, engine_runtime.window_GL_context)
}

engine_update :: proc() {
    engine_runtime.input = {} // resets input
    process_events()
}

engine_display :: proc() {
    @(static) window_width: i32
    @(static) window_height: i32

    if window_width != engine_runtime.window_width || window_height != engine_runtime.window_height {
        sync.lock(&engine_runtime.mutex)
        defer sync.unlock(&engine_runtime.mutex)
        window_width = engine_runtime.window_width
        window_height = engine_runtime.window_height
        gl.Viewport(0, 0, window_width, window_height)
    }

    sdl2.GL_SwapWindow(engine_runtime.window)
}

engine_running :: proc() -> b8 {
    return engine_runtime.running
}