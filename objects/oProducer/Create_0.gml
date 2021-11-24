event_inherited();

image_index += color * 4;

function select(game) {
	var connCoord = arrayCopy(coord);
	connCoord = coordMove(connCoord, facing);
	if(!isOnGrid(game, connCoord[0], connCoord[1]) || !isEmpty(game, connCoord[0], connCoord[1])) {
		return false;
	}
	var connReal = gridToReal(game, connCoord[0], connCoord[1]);
	var conn = instance_create_layer(connReal[0], connReal[1], "Connections", oConnection);
	conns[facing] = conn;
	conn.from = flip(facing);
	conn.parNode = id;
	conn.parDir = facing;
	conn.amount = amount;
	conn.color = color;
	conn.updateSprite();
	
	game.grid[connCoord[0]][connCoord[1]] = conn;
	game.cursorX = connCoord[0];
	game.cursorY = connCoord[1];
	return true;
}

function blocking(dir) {
	return true;
}