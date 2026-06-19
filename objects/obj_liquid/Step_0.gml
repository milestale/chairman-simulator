if (place_meeting(x, y, obj_mouse)) {
    {
        global.score += 1;
    }
    instance_destroy();
}

if (y > room_height) {
    instance_destroy();
}
