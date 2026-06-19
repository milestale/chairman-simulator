if (mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, self))
	{
		is_active = 1;
		keyboard_string = "";
		show_debug_message("Password Active");
	}
	
if (mouse_check_button_released(mb_left) && !position_meeting(mouse_x, mouse_y, self))
	{
		is_active = 0;
		show_debug_message("Password not active");
	}

if (is_active == 1)
{
// cursor movement:
var caret_delta = keyboard_check(vk_right) - keyboard_check(vk_left);
if (caret_delta != 0) {
    if (caret_next_move <= current_time) {
        caret_next_move = current_time + caret_move_rate;
        caret_pos = clamp(caret_pos + caret_delta, 0, string_length(input_string));
        caret_flash_start = current_time;
    }
} else caret_next_move = current_time;

// keyboard_shortcuts:
if (keyboard_check_pressed(vk_home)) caret_pos = 0;
if (keyboard_check_pressed(vk_end)) caret_pos = string_length(input_string);
if (keyboard_check_pressed(vk_delete)) {
    input_string = string_delete(input_string, caret_pos + 1, 1);
}
if (keyboard_check(vk_control)) {
    if (keyboard_check_pressed(ord("C"))) clipboard_set_text(input_string);
    if (keyboard_check_pressed(ord("V"))) {
        input_string = clipboard_get_text();
        caret_pos = string_length(input_string);
    }
}
// actual input:
var nstr = keyboard_string;
if (nstr == "") { // `keyboard_string` is set to `""` when the window loses focus.
    keyboard_string = fill_string;
}
else if (nstr != fill_string) { // new user input!
    // the number of missing "filler" characters is the number of characters
    // that user wants to erase this frame
    var numBksp = fill_count - string_count(fill_char, nstr);
    numBksp = min(numBksp, caret_pos); // can't erase what doesn't exist
    if (numBksp > 0) {
        caret_pos -= numBksp;
        input_string = string_delete(input_string, caret_pos + 1, numBksp);
    }
    
    // the rest are the newly typed characters:
    nstr = string_replace_all(nstr, fill_char, "");
    nstr = string_replace_all(nstr, chr(127), ""); // ctrl+bksp types a DEL for some reason
    if (nstr != "") {
        input_string = string_insert(nstr, input_string, caret_pos + 1);
        caret_pos += string_length(nstr);
    }
    caret_flash_start = current_time;
    keyboard_string = fill_string;
}
text = input_string;

}

if (keyboard_check_pressed(vk_enter))
	{
		show_debug_message(global.password);
	}