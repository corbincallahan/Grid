var x1 = x;
var x2 = x + view_wport[0];

draw_set_color(c_black);
draw_rectangle(x1, 0, x2, view_hport[0], false);
draw_set_color(c_white);
draw_set_font(fontTrans);
draw_text(x + view_wport[0] / 2, view_hport[0] / 2, levelName);