function realToGrid(game, _x, _y){
	var ret = array_create(2, -1);
	ret[0] = int64((_x - game.x) / game.spacing);
	ret[1] = int64((_y - game.y) / game.spacing);
	return ret;
}