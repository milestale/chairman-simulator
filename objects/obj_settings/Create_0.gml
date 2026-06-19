var _avatar_url = "http://localhost:81/avatars/" + string(global.player_id) + ".png";
global.avatar_sprite = spr_default_avatar;
// Обратите внимание: теперь мы сохраняем ID загрузки в отдельную переменную!
global.avatar_request_id = sprite_add(_avatar_url, 1, false, false, 0, 0);
show_flyout = 0;