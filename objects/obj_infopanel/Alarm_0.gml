// Проверяем, авторизован ли игрок (чтобы не пытаться сохранить пустоту)
if (variable_global_exists("player_id")) {
    var _url = "http://localhost:81/sync.php"; // Замените на ваш URL
    
    var _post_data = "player_id=" + string(global.player_id) + 
                     "&coins=" + string(global.coins) + 
                     "&stools=" + string(global.stools) + 
                     "&total_stools=" + string(global.total_stools);

    global.sync_request = http_post_string(_url, _post_data);
}

// Запускаем этот же будильник снова на 5 секунд
alarm[0] = game_get_speed(gamespeed_fps) * 5;