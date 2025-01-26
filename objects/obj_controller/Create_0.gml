COLOURS = ["blue","brown","green","red","orange","yellow","pink","purple","brown","grey"]



obj_slots = [];
 slot_count = 4;
 row_count = 10;
current_row = 0;
row_colour = [];
validation_pegs = [];

code = [];
remote_port = 8000;

   global.attempts = 0;
   global.slots_filled = 0;
   
if global.singleplayer{ 
for (var f = 0; f<slot_count;f++ ){
code[f] = COLOURS[irandom_range(0,array_length(COLOURS)-1)];
}
}

show_debug_message(code);

// Place slot objects and initialize their values
for(var i = 0; i<row_count;i++){
	obj_slots[i] = [];
	validation_pegs[i] = [];
	for (var j = 0; j < slot_count; j++) {
	    // Create a new slot object
	           obj_slots[i][j] = instance_create_layer(50 + j * 50, 20 + i * 50, "Instances", obj_slot);
			   validation_pegs[i][j] = instance_create_layer(270 + j * 50,35 + i*50,"Instances",obj_validation);	
	}
}

if global.singleplayer{
	for(var k =0; k<slot_count;k++){
	obj_slots[current_row][k].fillable = true;
	}
}

show_debug_message(obj_slots)

		row_colour = [];




