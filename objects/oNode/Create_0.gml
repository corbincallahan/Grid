// facing = int64(image_angle / 90);
facing = image_index % 4;

coord = realToGrid(oGame, x, y);

conns = array_create(4, noone);

isNode = true;
isSplitter = false;

function refresh(dir) {
	
}

function destroyConn(dir) {
	instance_destroy(conns[dir]);
	conns[dir] = noone;
	refresh(dir);
}