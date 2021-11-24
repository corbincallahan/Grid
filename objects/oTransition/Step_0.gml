t += dt;
if(!wentNext && t >= .5) {
	wentNext = true;
	room_goto_next();
}
if(t >= 1) {
	instance_destroy();
}
x = view_xport[0] + animcurve_channel_evaluate(curve, t) * view_wport[0];