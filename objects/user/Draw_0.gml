draw_self();


// we don't want the user to type line breaks (in GM:S or earlier) so we'll replace those:
var draw_string = string_replace_all(input_string, "#", "\#");
draw_text_transformed_colour(x, y-45, draw_string, 2, 2, 0, c_black, c_black, c_black, c_black, 1);
