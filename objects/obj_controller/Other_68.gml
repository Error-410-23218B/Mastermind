var buffer = async_load[? "buffer"];
buffer_seek(buffer, buffer_seek_start,0);
var msg = buffer_read(buffer, buffer_string);


code = string_split(msg,",");

if(array_length(code)>0){
	show_debug_message("filling");
	for(var k =0; k<slot_count;k++){
	obj_slots[current_row][k].fillable = true;
	}
}
show_debug_message(code);

