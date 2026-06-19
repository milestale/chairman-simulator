// Step Event
if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
    if (mouse_check_button(mb_left)) {
        is_pressed = true;
    } else {
        is_pressed = false;
    }
} else {
    is_pressed = false;
}