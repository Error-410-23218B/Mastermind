var filled_row_count = 0;

for (var i = 0; i < row_count - 1; i++) { // Loop through rows, excluding the last row
    // Check if all slots in the current row are filled with colors
    var isRowFilled = true;
    for (var j = 0; j < slot_count; j++) {
		row_colour[j] = obj_slots[i][j].occupant;
        if (!obj_slots[i][j].occupied) { // If any slot in the row doesn't have a color, the row is not filled
            isRowFilled = false;
            break; // Exit the loop if a slot without a color is found
        }

		
		
    }




    // If the row is filled with colors, make the next row fillable
    if (isRowFilled) {

		
		
        for (var k = 0; k < slot_count; k++) {
            obj_slots[i + 1][k].fillable = true; // Set the fillable property to true for the next row
         }
		
		        for (var k = 0; k < slot_count; k++) {
					if(row_colour[k] == code[k]){
					validation_pegs[i][k].validationColour = c_green;
					}
					else if(found(code,row_colour[k])){
					validation_pegs[i][k].validationColour = c_orange;
					}
					
					
            obj_slots[i][k].fillable = false;
        }
		
		

		
		if(arrEqual(row_colour,code)){

		var bufferCon = buffer_create(256, buffer_fixed, 1);

// Step 3: Write the serialized data to the buffer
buffer_write(bufferCon, buffer_u8, 1);

network_send_udp(global.socket,global.ip_address,remote_port,bufferCon,buffer_tell(bufferCon));

		room_goto(Room2);
		return;
		}
	 
		 
        if (global.attempts >= 10) {
            show_debug_message("Max attempts reached! Transitioning to the failure room.");
            room_goto(Room3); // Go to failure room if max attempts reached
            return;
        }
		
		
		
		
				row_colour = [];
    }
}



