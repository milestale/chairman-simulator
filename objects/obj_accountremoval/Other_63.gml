if (async_load[? "id"] == global.delete_dialog) {
    if (async_load[? "status"] == true) {
        // Игрок подтвердил удаление. Отправляем запрос на сервер.
        var _url = "http://localhost:81/delete_account.php";
        var _post_data = "player_id=" + string(global.player_id);
        
        global.delete_request = http_post_string(_url, _post_data);
    } else {
        show_debug_message("Удаление отменено.");
    }
}