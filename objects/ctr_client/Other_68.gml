var buffer = async_load[? "buffer"];
buffer_seek(buffer, buffer_seek_start,0);
var msg_id = buffer_read(buffer,buffer_u8);
var msg = buffer_read(buffer, buffer_string);


show_debug_message(msg);

