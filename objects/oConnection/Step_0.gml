if(destroyTimer > 0) {
	destroyTimer -= 1;
}
else if(destroyTimer == 0) {
	instance_destroy();
}