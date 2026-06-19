draw_self();
draw_set_font(ft_info_small);

draw_text_colour(x + 360, y+20, "Coins: " + string(global.coins), c_black, c_black, c_black, c_black, 1);
draw_text_colour(x + 530, y+20, "Stools: " + string(global.stools), c_black, c_black, c_black, c_black, 1);
draw_text_colour(x + 700, y+20, "Total stools: " + string(global.total_stools), c_black, c_black, c_black, c_black, 1);