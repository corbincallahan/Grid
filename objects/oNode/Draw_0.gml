draw_self();

var centerX = x + sprite_width / 2;
var centerY = y + sprite_height / 2;

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color(c_white);
draw_set_font(fontMain);

draw_text(centerX, centerY, amount);