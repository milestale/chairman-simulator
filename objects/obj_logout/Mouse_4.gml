if (global.is_custom_avatar == true) {
    if (sprite_exists(global.avatar_sprite)) {
        sprite_delete(global.avatar_sprite);
    }
}

global.avatar_sprite = spr_default_avatar;
global.is_custom_avatar = false;
global.username = "";
global.password = "";
global.player_id = -1;
global.coins = 150;
global.total_stools = 0;
audio_stop_sound(bgm_main);
room_goto(Room2);
