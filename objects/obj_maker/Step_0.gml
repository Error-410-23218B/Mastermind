 // Initialize the array
global.filled = false;
for (var i = 0; i < 4; i++) {
    global.codeSent[i] = obj_slots[i].occupant; // Assuming obj_slots is defined and has at least 4 elements
	
}

for (var j = 0; j < 4; j++) {
	global.filled = true;
	if (typeof(global.codeSent[j]) != "string"){
		global.filled = false;
	}
}


if(global.sendCode){
	show_debug_message("sending..");
// Step 1: Serialize the array into a string
var serialized_data = "";
for (var i = 0; i < array_length(global.codeSent); i++) {
    if (i > 0) {
        serialized_data += ","; // Use a comma to separate values
    }
    serialized_data += global.codeSent[i];
}

// Step 2: Create a buffer
var buffer = buffer_create(string_byte_length(serialized_data) + 1, buffer_grow, 1);

// Step 3: Write the serialized data to the buffer
buffer_write(buffer, buffer_string, serialized_data);

network_send_udp(global.socket,global.ip_address,remote_port,buffer,buffer_tell(buffer));

}





