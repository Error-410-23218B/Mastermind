//Get the port and ip of the client, so we can reply
remote_port = async_load[? "port"];
remote_ip = string(async_load[? "ip"]);



//get the buffer so we can process it

var buffer = async_load[? "buffer"];
buffer_seek(buffer, buffer_seek_start,0);
var msg_id = buffer_read(buffer,buffer_u8);
var msg = buffer_read(buffer, buffer_string);

role = msg

show_debug_message(msg);
