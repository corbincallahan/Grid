var game = instance_create_layer(x, y, "Instances", oGame);
game.gridWidth = image_xscale;
game.gridHeight = image_yscale;
game.makeGrid();

var midX = x + sprite_width / 2;
var midY = y + sprite_height / 2;
var camX = midX - view_wport[0] / 2;
var camY = midY - view_hport[0] / 2;

camera_set_view_pos(view_camera[0], camX, camY);