// Step Event
if (!placed) {
    if (mouse_check_button_pressed(mb_left) && 
        point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
        dragging = true;
    }
    
    if (dragging) {
        phy_position_x = mouse_x;
        phy_position_y = mouse_y;
        phy_linear_velocity_x = 0; // Stop movement while dragging
        phy_linear_velocity_y = 0;
    }
    
    if (mouse_check_button_released(mb_left)) {
        dragging = false;
    }
}