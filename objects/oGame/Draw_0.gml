if(gridVisible) {
	draw_set_alpha(.8); 
	draw_set_color(c_white);

	var xTo = x + (gridWidth * spacing);
	var yTo = y + (gridHeight * spacing);

	for(var i = x - 1; i <= xTo; i += spacing) {
		draw_line_width(i, y, i, yTo, 2);
	}
	for(var i = y - 1; i <= yTo; i += spacing) {
		draw_line_width(x, i, xTo, i, 2);
	}
}

// Draw cursor

draw_set_color(c_red);
draw_set_alpha(1);

var xFrom = x + cursorX * spacing - 2;
var xTo = x + (cursorX + 1) * spacing;
var yFrom = y + cursorY * spacing - 2;
var yTo = y + (cursorY + 1) * spacing;

// -2/+2 for line width
draw_line_width(xFrom - 2, yFrom, xTo + 2, yFrom, 4);
draw_line_width(xTo, yFrom - 2, xTo, yTo + 2, 4);
draw_line_width(xTo + 2, yTo, xFrom - 2, yTo, 4);
draw_line_width(xFrom, yTo + 2, xFrom, yFrom - 2, 4);