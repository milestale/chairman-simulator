draw_self(); // Draw button sprite
if (is_pressed) {
	draw_set_font(Font1);
    draw_set_color(c_red);
    draw_text(x + 20, y + 20, "Нагреваем...");
}