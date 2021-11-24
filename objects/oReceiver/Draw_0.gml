draw_self();

var centerX = x + sprite_width / 2;
var centerY = y + sprite_height / 2;

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color(c_white);
draw_set_font(fontMain);

var str = string(amount);

if(receiving != -1 && receiving != amount) {
	draw_set_color(c_red);
	str = string(receiving) + " / " + str;
}

draw_text(centerX, centerY, str);