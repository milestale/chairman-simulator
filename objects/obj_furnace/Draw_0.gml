// Draw Event
draw_self(); // Draw furnace sprite if you have one
draw_set_color(c_yellow);
draw_set_font(Font1);
draw_text(x + 20, y - 40, "Температура: " + string(round(temperature)) + "°C");
draw_text(x + 20, y - 20, "Цель: " + string(target_temp) + "±" + string(temp_range) + "°C");
draw_text(x + 20, y, "Требуемое время: " + string(round(timer / 60)) + "/10s");

if (game_won) {
    room_goto(mainroom3);
}