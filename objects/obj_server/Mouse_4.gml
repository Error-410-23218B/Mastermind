global.network_is_server = true;
audio_play_sound(button,0,false);
instance_create_layer(0,0,"Instances",ctr_server);
instance_destroy(obj_textbox);
show_message("Server created\nWaiting for client..")
