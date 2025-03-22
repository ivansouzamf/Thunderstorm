package thunderstorm

import "vendor:sdl2"

@(private)
process_events :: proc() {
    event: sdl2.Event
    for sdl2.PollEvent(&event) {
        // get individual event types
        window_event := event.window
        keyboard_event := event.key
        mouse_motion_event := event.motion
        mouse_button_event := event.button
        mouse_wheel_event := event.wheel

        get_state_str :: proc(state: u8) -> string {
            switch state {
                case sdl2.PRESSED: return "pressed"
                case sdl2.RELEASED: return "released"
                case: return "???"
            }
        }

        get_button_str :: proc(button: u8) -> string {
            switch button {
	        case sdl2.BUTTON_LEFT: return "left"
	        case sdl2.BUTTON_MIDDLE: return "middle"
	        case sdl2.BUTTON_RIGHT: return "right"
	        case: return "???"
            }
        }

        #partial switch event.type {
            // window events
            case .QUIT: g_engine_runtime.running = false
            case .WINDOWEVENT: {
                if window_event.event == .RESIZED {
                    g_engine_runtime.window_width = window_event.data1
                    g_engine_runtime.window_height = window_event.data2

                    log(.Info, "The window has been resized. New size: %v X %v", g_engine_runtime.window_width, g_engine_runtime.window_height)
                }
            }

            // keyboard events
            case .KEYDOWN: fallthrough
            case .KEYUP: {
                keyboard_input := &g_engine_runtime.input.keyboard
                i := keyboard_input.index
                keyboard_input.state[i] = auto_cast(keyboard_event.state)
                keyboard_input.keycode[i] = auto_cast(keyboard_event.keysym.sym)
                keyboard_input.mods[i] = auto_cast(keyboard_event.keysym.mod)
                keyboard_input.index += 1

                key_state_str := get_state_str(keyboard_event.state)
                log(.Info, "Keyboard input detected. Key %v has been %w", keyboard_event.keysym.sym, key_state_str)
            }

            // mouse events
            case .MOUSEMOTION: {
                g_engine_runtime.input.mouse_pos = {
                    mouse_motion_event.x,
                    mouse_motion_event.y,
                }

                log(.Info, "The cursor moved. New position: %v X %v", mouse_motion_event.x, mouse_motion_event.y)
            }
            case .MOUSEBUTTONDOWN: fallthrough
            case .MOUSEBUTTONUP: {
                mouse_button_input := &g_engine_runtime.input.mouse_button
                mouse_button_input.state[mouse_button_input.index] = auto_cast(mouse_button_event.state)
                mouse_button_input.index += 1

                button_str := get_button_str(mouse_button_event.button)
                button_state_str := get_state_str(mouse_button_event.state)
                log(.Info, "Mouse input detected. Button %v has been %v", button_str, button_state_str)
            }
            case .MOUSEWHEEL: {
                g_engine_runtime.input.mouse_wheel = mouse_wheel_event.y

                log(.Info, "Mouse input detected. Wheel has been scrolled %v units", mouse_wheel_event.y)
            }
        }
    }
}