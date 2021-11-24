if(instance_exists(next)) {
	// TODO: Notify reciever/splitter/merger that it is not receiving this input
	// If next is a connection, just destroy, otherwise need to notify
	if(next.isNode) {
		next.destroyConn(flip(to));
	}
	else {
		instance_destroy(next);
	}
}

var game = oGame;
var coord = realToGrid(game, x, y);
game.grid[coord[0]][coord[1]] = 0;
instance_destroy();