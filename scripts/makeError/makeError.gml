function makeError(obj, msg){
	var err = instance_create_layer(obj.x + obj.sprite_width / 2, obj.y + obj.sprite_width / 2, "Transitions", oErrorMessage);
	err.msg = msg;
}