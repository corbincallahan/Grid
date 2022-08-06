event_inherited();

color = 2;
amount = 0;
numOut = 0;
isSplitter = true;
makingOut = false;

function select(game) {
	if(numOut == 3) {
		makeError(id, "All Outputs Used");
		audio_play_sound(snHurt, 0, false);
		return false;
	}
	makingOut = true;
	return true;
}

function blocking(dir) {
	return !(flip(dir) == facing);
}

function addInput(in, dir) {
	if(checkLoop(in)) {
		makeError(in, "No loops!");
		audio_play_sound(snHurt, 0, false);
		return false;
	}
	if(in.color == 2 && color != 2) {
		in.parNode.color = color;
		in.parNode.refresh();
	}
	else if(in.color != color && color != 2) {
		makeError(id, "Wrong Color");
		audio_play_sound(snHurt, 0, false);
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
		if(conns[facing].color != 2) {
			amount = conns[facing].amount;
			color = conns[facing].color;
		}
		else if(color != 2) {
			conns[facing].parNode.color = color;
			conns[facing].parNode.refresh();
		}
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

function checkLoop(in) {
	for(var i = 0; i < 4; i++) {
		if(i != facing && instance_exists(conns[i])) {
			if(conns[i].checkLoop(in)) {
				return true;
			}
		}
	}
	return false;
}