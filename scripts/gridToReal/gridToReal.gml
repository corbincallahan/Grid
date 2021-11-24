function gridToReal(game, _x, _y){
	var ret = array_create(2);
	ret[0] = game.x + _x * game.spacing;
	ret[1] = game.y + _y * game.spacing;
	return ret;
}