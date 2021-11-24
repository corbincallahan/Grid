function arrayCopy(arr){
	var len = array_length(arr);
	var ret = array_create(len);
	array_copy(ret, 0, arr, 0, len);
	return ret;
}