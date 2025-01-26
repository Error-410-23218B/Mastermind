var buffer = async_load[? "buffer"];
buffer_seek(buffer, buffer_seek_start,0);
var msg = buffer_read(buffer, buffer_u8);





show_debug_message(msg);

