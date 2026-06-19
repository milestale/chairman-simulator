if (global.avatar_sprite == spr_default_avatar) draw_sprite_ext(global.avatar_sprite, 0, x+85, y+20, 0.3, 0.3, 0, c_white, 1);
else draw_sprite_ext(global.avatar_sprite, 0, x, y-60, 0.3, 0.3, 0, c_white, 1);
draw_set_font(ft_info_big);
draw_text_transformed_colour(x, y+100, global.username, 1, 1, 0, c_black, c_black, c_black, c_black, 1);
