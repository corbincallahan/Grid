if(!room_exists(room_next(room))) {
	game_end();
}

x = view_wport[0];
t = 0;
dt = .02;
wentNext = false;
curve = animcurve_get(acTransition).channels[0];
levelName = string_replace_all(room_get_name(room_next(room)), "_", " ");
