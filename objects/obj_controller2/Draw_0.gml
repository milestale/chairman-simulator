draw_set_font(Font1)
draw_set_color(c_yellow);
// obj_controller - Draw Event
draw_text(10, 10, "Очки (Требуется 10): " + string(global.score));