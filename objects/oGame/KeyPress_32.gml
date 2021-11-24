var item = grid[cursorX][cursorY];

if(selecting) {
	audio_play_sound(snHurt, 0, false);
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
	if(item.select(id)) {
		audio_play_sound(snSelect, 0, false);
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
