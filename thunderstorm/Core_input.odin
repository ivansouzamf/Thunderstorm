package thunderstorm

import "vendor:sdl2"

Input_State :: enum {
    Pressed,
    Released,
}

Mouse_Pos_Input :: distinct [2]i32

Mouse_Button_Input :: struct {
    state: [8]Input_State,
    index: u8,
}

Keyboard_Input :: struct {
    state: [256]Input_State,
    keycode: [256]Keycode,
    mods: [256]Keymods,
    index: u8,
}

Keycode :: distinct sdl2.Keycode

Keymods :: distinct sdl2.Keymod