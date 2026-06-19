if (async_load[? "id"] == global.avatar_request_id) {
    
    // Сервер ответил "успешно" (но внутри может быть HTML-мусор)
    if (async_load[? "status"] >= 0) {
        
        // Проверяем, существует ли спрайт и имеет ли он адекватную ширину
        if (sprite_exists(global.avatar_request_id) && sprite_get_width(global.avatar_request_id) > 1) {
            
            // Это настоящая картинка!
            global.avatar_sprite = global.avatar_request_id;
            global.is_custom_avatar = true; 
            show_debug_message("Свой аватар успешно загружен и проверен!");
            
        } else {
            // Это "подделка" (HTML-страница вместо картинки)
            
            // Обязательно удаляем этот битый квадратик из памяти!
            if (sprite_exists(global.avatar_request_id)) {
                sprite_delete(global.avatar_request_id);
            }
            
            // Оставляем дефолтную аватарку
            global.avatar_sprite = spr_default_avatar;
            global.is_custom_avatar = false;
            show_debug_message("Сервер вернул мусорный файл. Оставлен стандартный аватар.");
        }
        
    } else {
        // Честная ошибка 404 или нет интернета
        global.avatar_sprite = spr_default_avatar;
        global.is_custom_avatar = false;
        show_debug_message("Аватар не найден на сервере. Оставлен стандартный.");
    }
}