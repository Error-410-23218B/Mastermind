

if (dragging) {
    x = mouse_x - offset_x;
    y = mouse_y - offset_y;
}

if (global.slots_filled == 4){
	global.slots_filled = 0;
	global.attempts++;
	audio_play_sound(explosion,3,false,5);
	show_debug_message(global.attempts);
}
