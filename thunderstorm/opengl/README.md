# odin-gl: opengl loader in Odin

Includes procedures to load OpenGL function pointers. Currently only supports the `core` profile, up to version 4.6. Based on the output from the [glad](https://github.com/Dav1dde/glad) webservice using 4.6 `core`.

#### Note: You will be required to pass your own GetProcAddress equivalent (wglGetProcAddress, glXGetProcAddress, glfwGetProcAddress, etc.), for example:

```go
gl.load_up_to(4, 5, proc(p: rawptr, name: cstring) do (cast(^rawptr)p)^ = glfw.GetProcAddress(name); );
```
`vendor:glfw` also provides a useful helper you can pass straight to `gl.load_up_to`:
```go
gl.load_up_to(4, 5, glfw.gl_set_proc_address);
```

## Extra utility procedures

Some useful helper procedures can be found in `helpers.odin`, for tasks such as:

 - getting all active uniforms from a program using `get_uniforms_from_program`