module main

import ui

fn main() {
    mut app := ui.new_app()
    mut win := app.new_window("Calculator", 300, 400)

    // Create UI elements
    mut input := win.add_textfield(10, 10, 280, 40)
    mut button := win.add_button("Calculate", 10, 60, 280, 40)
    mut result := win.add_label("", 10, 110, 280, 40)

    // Handle button click
    button.on_click = fn() {
        value := input.text
        if value.is_empty() {
            result.text = "Please enter a value."
        } else {
            try {
                result.text = "Result: " + (eval(value) as str)
            } catch err {
                result.text = "Error: " + err.to_string()
            }
        }
    }

    app.run()
}

