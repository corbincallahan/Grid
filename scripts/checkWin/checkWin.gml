function checkWin(){
	for(var i = 0; i < instance_number(oReceiver); i++) {
		var curr = instance_find(oReceiver, i);
		if(curr.amount != curr.receiving) {
			return;
		}
	}
	nextLevel();
}