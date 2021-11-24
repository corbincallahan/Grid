function isOnGrid(game, _x, _y){
	if(_x < 0 || _x >= game.gridWidth || _y < 0 || _y >= game.gridHeight) {
		return false;
	}
	return true;
}