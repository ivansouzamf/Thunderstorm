package thunderstorm

import "core:sync"
import "core:strings"
import "vendor:sdl2"
import gl "./opengl"

@(private)
g_engine_runtime: struct {
    window: ^sdl2.Window,
    window_GL_context: sdl2.GLContext,
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

Core_init :: proc(window_width, window_height: i32, window_title: string) {
    assert_log(!g_engine_runtime.running, "You can't call '%v' twice", #location().procedure)
    
    defer free_all(context.temp_allocator)

    err := sdl2.Init(sdl2.INIT_VIDEO) 
    assert_log(err == 0, sdl2.GetErrorString())

    g_engine_runtime.window_width = window_width
    g_engine_runtime.window_height = window_height
    g_engine_runtime.window_title = window_title

    window_title_cstr, alloc_err := strings.clone_to_cstring(window_title, context.temp_allocator)
    g_engine_runtime.window = sdl2.CreateWindow(window_title_cstr, sdl2.WINDOWPOS_CENTERED, sdl2.WINDOWPOS_CENTERED, window_width, window_height, sdl2.WINDOW_OPENGL | sdl2.WINDOW_SHOWN | sdl2.WINDOW_RESIZABLE)
    assert_log(g_engine_runtime.window != nil, sdl2.GetErrorString())
   
    g_engine_runtime.window_GL_context = sdl2.GL_CreateContext(g_engine_runtime.window)
    assert_log(g_engine_runtime.window_GL_context != nil, sdl2.GetErrorString())
    
    // opengl stuff
    sdl2.GL_SetAttribute(.CONTEXT_MAJOR_VERSION, 4)
    sdl2.GL_SetAttribute(.CONTEXT_MINOR_VERSION, 6)
    sdl2.GL_SetAttribute(.CONTEXT_PROFILE_MASK, i32(sdl2.GLprofile.CORE))
    when ODIN_DEBUG {
        sdl2.GL_SetAttribute(.CONTEXT_FLAGS, i32(sdl2.GLcontextFlag.DEBUG_FLAG))
    }
    sdl2.GL_SetAttribute(.SHARE_WITH_CURRENT_CONTEXT, 1)
    sdl2.GL_SetAttribute(.DOUBLEBUFFER, 1)
    sdl2.GL_SetAttribute(.DEPTH_SIZE, 24)
    // you have to set the context to null in the main thread unless it won't work
    sdl2.GL_MakeCurrent(g_engine_runtime.window, nil)
    
    g_engine_runtime.running = true // set to true just to run the first iteration
}

Core_deinit :: proc() {
    sdl2.GL_DeleteContext(g_engine_runtime.window_GL_context)
    sdl2.DestroyWindow(g_engine_runtime.window)
    sdl2.Quit()
}

Core_init_render :: proc() {
    sync.lock(&g_engine_runtime.mutex)
    defer sync.unlock(&g_engine_runtime.mutex)
    
    sdl2.GL_MakeCurrent(g_engine_runtime.window, g_engine_runtime.window_GL_context)
    gl.load_up_to(4, 6, sdl2.gl_set_proc_address)
    when ODIN_DEBUG {
        gl.Enable(gl.DEBUG_OUTPUT)
        gl.Enable(gl.DEBUG_OUTPUT_SYNCHRONOUS)
        gl.DebugMessageCallback(gl_debug_callback, nil)
    }
}

Core_update :: proc() {
    g_engine_runtime.input = {} // resets input
    process_events()
}

Core_display :: proc() {
    @(static) window_width: i32
    @(static) window_height: i32

    if window_width != g_engine_runtime.window_width || window_height != g_engine_runtime.window_height {
        sync.lock(&g_engine_runtime.mutex)
        defer sync.unlock(&g_engine_runtime.mutex)
        window_width = g_engine_runtime.window_width
        window_height = g_engine_runtime.window_height
        gl.Viewport(0, 0, window_width, window_height)
    }

    sdl2.GL_SwapWindow(g_engine_runtime.window)
}

Core_is_running :: proc() -> b8 {
    return g_engine_runtime.running
}