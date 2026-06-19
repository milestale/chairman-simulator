draw_self();
draw_text_colour(x, y-100, "Enter a new username", c_black, c_black, c_black, c_black, 1);


// we don't want the user to type line breaks (in GM:S or earlier) so we'll replace those:
var draw_string = string_replace_all(input_string, "#", "\#");
draw_text_transformed_colour(x + 10, y-45, draw_string, 2, 2, 0, c_black, c_black, c_black, c_black, 1);


if (is_active == 1)
{
// draw the caret:
var caret_offset = string_width(string_copy(draw_string, 1, caret_pos));
if (current_time < caret_flash_start + caret_flash_delay
|| (current_time - caret_flash_start) mod (caret_flash_rate * 2) > caret_flash_rate
) {
    draw_line(x + caret_offset, y, x + caret_offset, y + string_height("Q"));
}
}
