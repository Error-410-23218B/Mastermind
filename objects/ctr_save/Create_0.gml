
if global.is_breaker{
highscore = 0;
if(global.attempts < global.player_score){
highscore = global.attempts;
}
else{
highscore = global.player_score;
}

var save_data = ds_map_create();
ds_map_add(save_data, "score", global.attempts);
ds_map_add(save_data,"highscore",highscore);
var json_string = json_encode(save_data);

var file = file_text_open_write("savefile.json");
file_text_write_string(file,json_string);
file_text_close(file);

ds_map_destroy(save_data);
}