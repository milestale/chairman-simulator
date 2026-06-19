if (async_load[? "id"] == global.settings_request) {
    if (async_load[? "status"] == 0) {
        var _response_json = async_load[? "result"];
        
        try {
            var _data = json_parse(_response_json);
            
            if (_data.status == "success") {
				global.new_avatar_path = "";
				if (obj_input_username.text != "") global.username = obj_input_username.text;
				if (obj_input_password.text != "")global.password = obj_input_username.text;
				room_restart();
                

                
            } else {
                show_message_async("Ошибка: " + _data.message);
            }
        } catch (_exception) {
            show_debug_message("Сырой ответ: " + string(_response_json));
            show_message_async("Ошибка на сервере. Проверьте консоль.");
        }
    } else if (async_load[? "status"] < 0) {
        show_message_async("Нет связи с сервером.");
    }
}