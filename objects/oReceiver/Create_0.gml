event_inherited();

receiving = -1;

image_index += color * 4;

function select() {
	
}

function blocking(dir) {
	if(facing == flip(dir)) {
		// Handle setting input here or separate method?
		return false;
	}
	return true;
}

function addInput(in, dir) {
	if(in.color != color) {
		if(in.color == 2) {
			in.parNode.color = color;
			in.parNode.refresh();
		}
		else {
			makeError(id, "Wrong color");
			return false;
		}
	}
	conns[flip(dir)] = in;
	refresh(flip(dir));
	return true;
}

function refresh(dir) {
	if(instance_exists(conns[dir])) {
		receiving = conns[dir].amount;
	}
	else {
		receiving = -1;
	}
	checkWin();
	var satisfied = receiving == amount;
	image_index = satisfied * 8 + color * 4 + facing;
}