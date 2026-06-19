draw_self();
draw_set_font(ft_info_small);
draw_text_colour(x+80, y+20, global.username, c_black, c_black, c_black, c_black, 1);

if (global.avatar_sprite == spr_default_avatar) draw_sprite_ext(global.avatar_sprite, 0, x+30, y+40, 0.12, 0.12, 0, c_white, 1);
else draw_sprite_ext(global.avatar_sprite, 0, x-5, y+5, 0.12, 0.12, 0, c_white, 1);

if (show_flyout) 
	{
		draw_rectangle(0,80,256, 256, false);
		draw_line_width_colour(0, lerp(80, 256, 0.5), 256, lerp(80, 256, 0.5), 3, c_black, c_black);
	
	}
	


