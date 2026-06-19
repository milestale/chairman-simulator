input_string = ""; // current text
caret_pos = 0; // caret position (0 being before the first letter)

caret_next_move = current_time; // when's the next time you can move the caret left/right
caret_move_rate = 170; // delay between such movements

caret_flash_start = current_time; // when the caret will start flashing
caret_flash_delay = 700; // delay before flashing
caret_flash_rate = 600; // flashing rate

// we figure out the number of erased characters based on how many filler
// characters went missing from the string since we have last checked
fill_char = chr(27); // that's an ESC. It's not very typable as-is
fill_count = 16;
fill_string = string_repeat(fill_char, fill_count);
text = "";
is_active = 0;