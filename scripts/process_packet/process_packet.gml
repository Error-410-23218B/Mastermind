/// @description process_packet(buffer)
/// @param buffer
function process_packet(argument0) {
	var buffer = argument0;
	var msg_id = buffer_read(buffer,buffer_u8);
	var clickx = buffer_read(buffer, buffer_u32);//mousepos
	var clicky = buffer_read(buffer, buffer_u32);
	//do something with that mouse position
	remotex = clickx;
	remotey = clicky;



}
