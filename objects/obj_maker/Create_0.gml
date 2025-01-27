audio_play_sound(button,2,false);
audio_play_sound(Tetris,1,true);
COLOURS = ["blue","brown","green","red","orange","yellow","pink","purple","brown","grey"]

global.attempts = 0;
global.slots_filled = 0;
global.filled = false;
global.codeSent = [];
global.is_breaker = false;

//Server IP and port, needed to send packets
remote_ip = "127.0.0.1";
remote_port = 8000;

if(global.network_is_server){
remote_port = 8001;
}


obj_slots = [];
 slot_count = 4;
 codeSent = [];
 
 	for (var j = 0; j < slot_count; j++) {
	    // Create a new slot object
	           obj_slots[j] = instance_create_layer(50 + j * 50, 20, "Instances", obj_slot);
			  	
	}
	
	for(var k =0; k<slot_count;k++){
obj_slots[k].fillable = true;
}
