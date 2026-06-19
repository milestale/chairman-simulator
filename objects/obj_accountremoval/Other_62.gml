if (async_load[? "id"] == global.delete_request) {
    if (async_load[? "status"] == 0) {
        var _response_json = async_load[? "result"];
        
        try {
            var _data = json_parse(_response_json);
            
            if (_data.status == "success") {
                show_message_async("Your account has been deleted. Thank you for playing!");
                
                if (global.is_custom_avatar == true) {
                    if (sprite_exists(global.avatar_sprite)) {
                        sprite_delete(global.avatar_sprite);
                    }
                }
                
                global.player_id = -1;
                global.coins = 0;
                global.stools = 0;
                global.total_stools = 0;
                global.avatar_sprite = spr_default_avatar;
                global.is_custom_avatar = false;
                room_goto(room2);
                // room_goto(rm_login);
                
            } else {
                show_message_async("Ошибка удаления: " + _data.message);
            }
        } catch (_exception) {
            show_debug_message("Ошибка парсинга: " + string(_response_json));
        }
    } else if (async_load[? "status"] < 0) {
        show_message_async("Нет связи с сервером. Попробуйте позже.");
    }
}