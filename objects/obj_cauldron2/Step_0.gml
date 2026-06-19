if (x <= 0) {
    direction = 0;    // Move right
} else if (x >= room_width - sprite_width) {
    direction = 180;  // Move left
}

// Pour liquid periodically
pour_timer -= 1;
if (pour_timer <= 0) {
    instance_create_layer(x + sprite_width/2, y + sprite_height, "Instances", obj_liquid);
    pour_timer = 60;  // Reset timer
}
