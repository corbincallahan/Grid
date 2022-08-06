var item = grid[cursorX][cursorY];

if(selecting) {
	if(selected.isSplitter) {
		audio_play_sound(snHurt, 0, false);
	}
	selecting = false;
	if(item.isNode && item.isSplitter) {
		item.makingOut = false;
	}
	else {
		item.parNode.destroyConn(item.parDir);
	}
	return;
}

if(item != 0 && instance_exists(item)) {
	audio_sound_pitch(snConn, .5);
	if(item.select(id)) {
		if(item.isSplitter) {
			audio_play_sound(snSelect, 0, false);
		}
		selecting = true;
		selected = item;
	}
	else {
		audio_play_sound(snHurt, 0, false);
	}
}
else {
	audio_play_sound(snHurt, 0, false);
}
