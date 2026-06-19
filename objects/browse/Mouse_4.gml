// Открываем окно выбора файла (только PNG)
var _file_path = get_open_filename("PNG Images|*.png", "");

if (_file_path != "") {
    global.new_avatar_path = _file_path;
    show_message_async("Press save to apply it.");
}