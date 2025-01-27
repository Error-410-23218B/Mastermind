
if (mouse_x > x && mouse_x < x + sprite_width && mouse_y > y && mouse_y < y + sprite_height) {
    if (!hovering && !bounced) {

        y_offset = bounce_height;
        bounced = true; 
    }
    hovering = true; 
} else {
    hovering = false; 
}

y = originals_y + y_offset; 


if (bounced) {
    y_offset -= bounce_speed; 
    if (y_offset <= 0) {
        y_offset = 0; 
        bounced = false;
    }
}