if (async_load[? "id"] == global.sync_request) {
    if (async_load[? "status"] == 0) {
        var _response_json = async_load[? "result"];
        
        // ДОБАВЬТЕ ЭТУ СТРОКУ, ЧТОБЫ УВИДЕТЬ РЕАЛЬНЫЙ ОТВЕТ СЕРВЕРА:
        show_debug_message("СЫРОЙ ОТВЕТ СИНХРОНИЗАЦИИ: " + string(_response_json));
        
        try {
            var _data = json_parse(_response_json);
            if (_data.status == "success") {
                show_debug_message("Синхронизация успешна: " + string(current_time));
            } else {
                show_debug_message("Ошибка синхронизации: " + _data.message);
            }
        } catch (_exception) {
            show_debug_message("Ошибка парсинга данных.");
        }
    } else if (async_load[? "status"] < 0) {
        show_debug_message("Нет связи с сервером для синхронизации.");
    }
}