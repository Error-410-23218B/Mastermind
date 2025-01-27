
audio_play_sound(button,2,false);
audio_play_sound(Tetris,1,true,0.5);
COLOURS = ["blue","brown","green","red","orange","yellow","pink","purple","brown","grey"]



obj_slots =  [];
 slot_count = 4;
 row_count = 10;
current_row = 0;
row_colour = [];
validation_pegs = [];
saveMap = [];
code = [];
gameMap = [];
loadPegs = [];
remote_port = 8000;


   global.attempts = 0;
   global.slots_filled = 0;
   global.player_score = 0;
   global.is_breaker = true;
if (!global.singleplayer){   
   if(global.network_is_server){
remote_port = 8001;
}
}

if global.singleplayer{ 
for (var f = 0; f<slot_count;f++ ){
code[f] = COLOURS[irandom_range(0,array_length(COLOURS)-1)];
}
}




if (global.loadGame)
{
var files = file_text_open_read("savestate.json");
var json_strings = file_text_read_string(files);
file_text_close(files);

var load_datas = json_parse(json_strings);
show_debug_message(load_datas);

gameMap = load_datas.gamemap;
global.attempts = load_datas.attempts;
show_debug_message(gameMap);


}
   

// Place slot objects and initialize their values
for(var i = 0; i<row_count;i++){
	obj_slots[i] = [];
	validation_pegs[i] = [];
	for (var j = 0; j < slot_count; j++) {
	    // Create a new slot object
	           obj_slots[i][j] = instance_create_layer(50 + j * 50, 20 + i * 50, "Instances", obj_slot);
		   if global.loadGame
		 {
			if(gameMap[i][j] != -4){
		   obj_slots[i][j].occupant = gameMap[i][j];
		   obj_slots[i][j].occupied = true;
		   var obj_name = "obj_"+gameMap[i][j];
		   show_debug_message(asset_get_index(obj_name));
		   loadPegs[i][j] = instance_create_layer(obj_slots[i][j].x + 8,obj_slots[i][j].y + 8,"Instances",asset_get_index(obj_name));
		   loadPegs[i][j].draggable = false;
		   loadPegs[i][j].inSlot = true;
		   loadPegs[i][j].depth = -100;
		   }
		}
	
			   validation_pegs[i][j] = instance_create_layer(270 + j * 50,35 + i*50,"Instances",obj_validation);	
	}
}

if global.singleplayer{
	for(var k =0; k<slot_count;k++){
	obj_slots[current_row][k].fillable = true;
	}
}


		row_colour = [];


var file = file_text_open_read("savefile.json");
var json_string = file_text_read_string(file);
file_text_close(file);

var load_data = json_decode(json_string);

global.player_score = load_data[? "score"];
global.highscoreLoad = load_data[? "highscore"];

show_debug_message(global.player_score);
show_debug_message(global.highscoreLoad);




