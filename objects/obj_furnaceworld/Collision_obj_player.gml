// Step Event
if (position_meeting(x, y, obj_player)) { // Check collision with player
    if (mouse_check_button_pressed(mb_left)) { // Check for left mouse click
        if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
            room_goto(minigame2); // Teleport to target room
        }
    }
}