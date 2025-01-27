var buffer = async_load[? "buffer"];
buffer_seek(buffer, buffer_seek_start,0);
var msg = buffer_read(buffer, buffer_string);







if msg == "Won"{
room_goto(Room3);
}

if msg == "Lost"{
room_goto(Room2);
}