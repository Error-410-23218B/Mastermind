audio_stop_sound(Tetris);


for (var i = 0; i < row_count; i++;){

for(var j = 0; j < slot_count; j++;){
saveMap[i][j] = obj_slots[i][j].occupant;

}

}

var save_state = ds_map_create();
ds_map_add(save_state, "gamemap", saveMap);
ds_map_add(save_state,"attempts",global.attempts);
var json_string = json_encode(save_state);




var file = file_text_open_write("savestate.json");
file_text_write_string(file,json_string);
file_text_close(file);

ds_map_destroy(save_state);