function isEmpty(game, _x, _y){
	if(game.grid[_x][_y] == 0 || !instance_exists(game.grid[_x][_y])) {
		return true;
	}
	return false;
}