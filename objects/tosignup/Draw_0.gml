draw_self();
draw_set_font(ft_info_small);

switch(global.issignup)
	{
		case 0:
			draw_text_transformed_colour(x, y, "Sign up", 2, 2, 0, c_black, c_black, c_black, c_black, 1);
	
		case 1:
			draw_text_transformed_colour(x, y, "Sign up", 2, 2, 0, c_black, c_black, c_black, c_dkgray, 1);
	}
