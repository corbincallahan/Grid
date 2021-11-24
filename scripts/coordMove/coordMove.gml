function coordMove(pos, dir){
	switch(dir) {
		case right:
			pos[0] = pos[0] + 1;
			return pos;
		case up:
			pos[1] = pos[1] - 1;
			return pos;
		case left:
			pos[0] = pos[0] - 1;
			return pos;
		case down:
			pos[1] = pos[1] + 1;
			return pos;
	}
}