var _url = "http://localhost:81/update_settings.php";

// Получаем текст из полей ввода и убираем лишние пробелы по краям, если они есть
var _input_username = string_trim(obj_input_username.text); 
var _input_password = string_trim(obj_input_password.text);

var _avatar_base64 = "";

// Если игрок выбрал новую аватарку, читаем файл и кодируем в Base64
if (variable_global_exists("new_avatar_path") && global.new_avatar_path != "") {
    if (file_exists(global.new_avatar_path)) {
        var _buffer = buffer_load(global.new_avatar_path);
        _avatar_base64 = buffer_base64_encode(_buffer, 0, buffer_get_size(_buffer));
        buffer_delete(_buffer); // Очищаем память
    }
}

// 1. Создаем БАЗОВУЮ структуру. ID игрока нужен серверу всегда, чтобы знать, кого обновлять.
var _data_struct = {
    player_id: global.player_id
};

// 2. Добавляем имя пользователя, ТОЛЬКО если поле не пустое
if (_input_username != "") {
    _data_struct.username = _input_username;
}

// 3. Добавляем пароль, ТОЛЬКО если поле не пустое
if (_input_password != "") {
    _data_struct.password = _input_password;
}

// 4. Добавляем аватарку, ТОЛЬКО если мы ее успешно закодировали
if (_avatar_base64 != "") {
    _data_struct.avatar = _avatar_base64;
}

// Проверяем: если структура состоит только из 1 переменной (player_id), 
// значит игрок нажал "Сохранить", но ничего не изменил. 
// В таком случае незачем даже отправлять запрос на сервер.
if (variable_struct_names_count(_data_struct) <= 1) {
    show_message_async("Вы ничего не изменили.");
    exit; // Останавливаем выполнение кода здесь
}

// Превращаем структуру в строку JSON
var _json_string = json_stringify(_data_struct);

// Создаем заголовки
var _headers = ds_map_create();
ds_map_add(_headers, "Content-Type", "application/json");

// Отправляем запрос
global.settings_request = http_request(_url, "POST", _headers, _json_string);

// Удаляем карту заголовков из памяти
ds_map_destroy(_headers);