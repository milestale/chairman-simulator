// obj_mouse - Step Event
x = mouse_x;
y = mouse_y;
// Keep mouse in room bounds
x = clamp(x, 0, room_width - sprite_width);
y = clamp(y, 0, room_height - sprite_height);