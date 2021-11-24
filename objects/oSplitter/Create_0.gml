event_inherited();

color = 2;
amount = 0;
numOut = 0;
isSplitter = true;
makingOut = false;

function select(game) {
	if(numOut == 3) {
		makeError(id, "All Outputs Used");
		return false;
	}
	makingOut = true;
	return true;
}

function blocking(dir) {
	return !(flip(dir) == facing);
}

function addInput(in, dir) {
	if(in.color != color && color != 2) {
		makeError(id, "Wrong Color");
		return false;
	}
	
	conns[flip(dir)] = in;
	refresh(flip(dir));
	return true;
}

function refresh(dir) {
	findNumOut();
	if(numOut + instance_exists(conns[facing]) == 0) {
		color = 2;
		amount = 0;
		return;
	}
	
	if(instance_exists(conns[facing])) {
		amount = conns[facing].amount;
		color = conns[facing].color;
	}
	else {
		amount = 0;
		// color = 2;
	}
	
	for(var i = 0; i < 4; i++) {
		var curr = conns[i];
		if(i != facing && instance_exists(curr)) {
			curr.amount = amount / numOut;
			curr.color = color;
			curr.refresh(flip(i));
		}
	}
}

function findNumOut() {
	numOut = 0;
	for(var i = 0; i < 4; i++) {
		var curr = conns[i];
		if(i != facing && instance_exists(curr)) {
			numOut++;
		}
	}
}