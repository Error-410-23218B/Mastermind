
global.is_breaker = false;

global.network_is_server = false;

audio_play_sound(button,0,false)

if global.ip_entered{
instance_create_layer(0,0,"Instances",ctr_client);
}
else{
show_message("Enter an IP Address!");
}