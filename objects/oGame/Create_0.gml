#macro right 0
#macro up 1
#macro left 2
#macro down 3

gridWidth = 0;
gridHeight = 0;

spacing = 128; // Change this to set it to the width of sGridScale?

gridVisible = true;

cursorX = 0;
cursorY = 0;

selecting = false;
selected = noone;

grid = noone;

errorMsg = "";

function moveCursorTo(_x, _y, dir) {
	if(!isOnGrid(id, _x, _y)) {
		audio_play_sound(snHurt, 0, false);
		return;
	}
	if(selecting && selected.isNode && selected.isSplitter && selected.makingOut) {
		// Move all of this to a method in oSplitter?
		
		if(dir == selected.facing) {
			audio_play_sound(snHurt, 0, false);
			return;
		}
		
		var next = grid[_x][_y];
		if(next != 0 && instance_exists(next)) {
			audio_play_sound(snHurt, 0, false);
			return;
		}
		selected.makingOut = false;
		
		var createAt = gridToReal(id, _x, _y);
		audio_sound_pitch(snConn, .5);
		selected.conns[dir] = instance_create_layer(createAt[0], createAt[1], "Connections", oConnection);
		selected.conns[dir].from = flip(dir);
		selected.conns[dir].updateSprite();
		selected.conns[dir].parNode = selected;
		selected.conns[dir].parDir = dir;
		selected.refresh(dir);
		grid[_x][_y] = selected.conns[dir];
	}
	else if(selecting) {
		var next = grid[_x][_y];
		var last = grid[cursorX][cursorY];
		
		if(dir == last.from && !next.isNode) {
			last.silenced = true;
			instance_destroy(last);
			
			cursorX = _x;
			cursorY = _y;
			
			next.to = -1;
			next.updateSprite();
			
			audio_sound_pitch(snConn, next.pitch);
			audio_play_sound(snConn, 0, false);
			
			return;
		}
		
		if(next != 0 && instance_exists(next)) {
			if(next.blocking(dir)) {
				audio_play_sound(snHurt, 0, false);
				return;
			}
			
			// Set input of receiver/splitter/merger here
			if(next.addInput(last, dir)) {
				audio_play_sound(snDing, 0, false);
				last.next = next;
				last.to = dir;
				last.updateSprite();
			}
			else {
				return;
			}
			
			cursorX = _x;
			cursorY = _y;
			
			selecting = false;
			selected = noone;
			return;
		}
		
		last.to = dir;
		last.updateSprite();
		
		var createAt = gridToReal(id, _x, _y);
		audio_sound_pitch(snConn, last.pitch + .25);
		last.next = instance_create_layer(createAt[0], createAt[1], "Connections", oConnection);
		last.next.from = (dir + 2) % 4;
		last.next.parNode = last.parNode;
		last.next.parDir = last.parDir;
		last.next.amount = last.amount;
		last.next.color = last.color;
		last.next.updateSprite();
		last.next.pitch = last.pitch + .25;
		grid[_x][_y] = last.next;
	}
	
	audio_play_sound(snMove, 0, false);
	cursorX = _x;
	cursorY = _y;
}

function makeGrid() {
	// Delete old grid?
	
	grid = array_create(gridWidth, noone);
	for(var i = 0; i < gridWidth; i++) {
		grid[i] = array_create(gridHeight, 0);
	}
	
	// Iterate through existing nodes and place them in grid
	for(var i = 0; i < instance_number(oNode); i++) {
		var curr = instance_find(oNode, i);
		var gridPos = realToGrid(id, curr.x, curr.y)
		grid[gridPos[0]][gridPos[1]] = curr;
	}
}