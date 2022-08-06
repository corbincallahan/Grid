from = -1;
to = -1;

color = 0;
amount = 1;

next = noone;

parNode = noone;
parDir = -1;

isNode = false;

destroyTimer = -1;

pitch = .5;
silenced = false;

audio_play_sound(snConn, 0, false);

function updateSprite() {
	if(to == -1) {
		image_index = from;
	}
	else if(abs(to - from) == 2) {
		if(from % 2 == 0) {
			image_index = 4;
		}
		else {
			image_index = 5;
		}
	}
	else {
		if(from == 0 && to == 3 || from == 3 && to == 0) {
			image_index = 9;
		}
		else {
			image_index = 6 + ((from + to - 1) / 2);
		}
	}
	image_index += 10 * color;
}

function blocking(dir) {
	return true;
}

function select() {
	parNode.destroyConn(parDir);
	return false;
}

function refresh(dir) {
	updateSprite();
	if(!instance_exists(next)) {
		return;
	}
	if(!next.isNode) {
		next.amount = amount;
		next.color = color;
	}
	next.refresh(flip(to));
}

function checkLoop(in) {
	if(in == id) {
		return true;
	}
	if(instance_exists(next)) {
		return next.checkLoop(in)
	}
	return false;
}