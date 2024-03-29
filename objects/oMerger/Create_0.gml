event_inherited();

color = 2;
amount = 0;

function select(game) {
	var connCoord = arrayCopy(coord);
	connCoord = coordMove(connCoord, facing);
	if(!isOnGrid(game, connCoord[0], connCoord[1]) || !isEmpty(game, connCoord[0], connCoord[1])) {
		return false;
	}
	var connReal = gridToReal(game, connCoord[0], connCoord[1]);
	var conn = instance_create_layer(connReal[0], connReal[1], "Connections", oConnection);
	conns[facing] = conn;
	conn.from = flip(facing);
	conn.parNode = id;
	conn.parDir = facing;
	conn.amount = amount;
	conn.color = color;
	conn.updateSprite();
	
	game.grid[connCoord[0]][connCoord[1]] = conn;
	game.cursorX = connCoord[0];
	game.cursorY = connCoord[1];
	return true;
}

function blocking(dir) {
	if(facing == flip(dir)) {
		return true;
	}
	return false;
}

function addInput(in, dir) {
	if(checkLoop(in)) {
		makeError(in, "No loops!");
		audio_play_sound(snHurt, 0, false);
		return false;
	}
	if(in.color != color) {
		if(in.color == 2) {
			in.parNode.color = color;
			in.parNode.refresh(in.parDir);
		}
		else if(color != 2) {
			makeError(id, "Wrong Color");
			audio_play_sound(snHurt, 0, false);
			return false;
		}
		color = in.color;
	}
	conns[flip(dir)] = in;
	refresh(flip(dir));
	return true;
}

function refresh(dir) {
	amount = 0;
	var numConn = 0;
	for(var i = 0; i < 4; i++) {
		var curr = conns[i];
		if(i != facing && instance_exists(curr)) {
			amount += curr.amount;
			numConn++;
			
			if(curr.color == 2 && color != 2) {
				curr.parNode.color = color;
				curr.parNode.refresh();
			}
		}
	}
	if(instance_exists(conns[facing])) {
		conns[facing].amount = amount;
		conns[facing].color = color;
		conns[facing].refresh(flip(facing));
		numConn++;
	}
	if(numConn == 0) {
		color = 2;
	}
}

function checkLoop(in) {
	if(instance_exists(conns[facing])) {
		return conns[facing].checkLoop(in);
	}
	return false;
}