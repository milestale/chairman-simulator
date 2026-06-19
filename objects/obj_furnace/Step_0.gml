// Step Event
if (!game_won) {
    // Temperature control
    if (instance_exists(obj_button) && obj_button.is_pressed) {
        temperature += heat_rate; // Increase temp when button pressed
    } else {
        temperature -= cool_rate; // Cool down when not pressed
    }
    
    // Keep temperature within realistic bounds
    temperature = clamp(temperature, 0, 1000);
    
    // Check if within target range
    if (abs(temperature - target_temp) <= temp_range) {
        timer += 1;
        if (timer >= target_time) {
            game_won = true; // Player wins after 10 seconds
        }
    } else {
        timer = max(0, timer - 1); // Decrease timer if out of range, but not below 0
    }
}
