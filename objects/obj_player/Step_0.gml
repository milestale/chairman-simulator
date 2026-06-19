// STEP EVENT
// Point and click movement
if (mouse_check_button_pressed(mb_left)) {
    // Only set new target if clicking on walkable area
    if (place_meeting(mouse_x, mouse_y, obj_room) && !place_meeting(mouse_x, mouse_y, obj_wall)) {
        target_x = mouse_x;
        target_y = mouse_y;
    }
}
if (mouse_check_button_pressed(mb_left) && place_meeting(mouse_x, mouse_y, obj_sandpile)) goingtosand = 1;
// Calculate distance to target
var dist = point_distance(x, y, target_x, target_y);

// Move towards target with collision checking
if (dist > move_threshold) {
    var dir = point_direction(x, y, target_x, target_y);
    var move_x = lengthdir_x(spd, dir);
    var move_y = lengthdir_y(spd, dir);
    
    // Horizontal movement with collision
    if (!place_meeting(x + move_x, y, obj_wall)) {
        x += move_x;
    } else {
        // Slide along wall horizontally
        while (!place_meeting(x + sign(move_x), y, obj_wall) && point_distance(x, y, target_x, target_y) > move_threshold) {
            x += sign(move_x);
        }
    }
    
    // Vertical movement with collision
    if (!place_meeting(x, y + move_y, obj_wall)) {
        y += move_y;
    } else {
        // Slide along wall vertically
        while (!place_meeting(x, y + sign(move_y), obj_wall) && point_distance(x, y, target_x, target_y) > move_threshold) {
            y += sign(move_y);
        }
    }
    
    
    // Update facing direction (0-7)
    facing = round(dir / 45) mod 8;
    
    // Set sprite based on direction
    switch (facing) {
        case 0: sprite_index = spr_player_walk_right; break;
        case 1: sprite_index = spr_player_walk_upright; break;
        case 2: sprite_index = spr_player_walk_up; break;
        case 3: sprite_index = spr_player_walk_upleft; break;
        case 4: sprite_index = spr_player_walk_left; break;
        case 5: sprite_index = spr_player_walk_downleft; break;
        case 6: sprite_index = spr_player_walk_down; break;
        case 7: sprite_index = spr_player_walk_downright; break;
    }
    
    image_speed = 1; // Animation playing
} else {
    image_speed = 0; // Stop animation
    image_index = 0; // Reset to first frame
}