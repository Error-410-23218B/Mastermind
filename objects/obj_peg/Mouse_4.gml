// If mouse is inside the object and the object is draggable
if (point_in_rectangle(mouse_x, mouse_y, x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2) && draggable) {
    if (!dragging) {
        dragging = true;              // Set dragging to true
        offset_x = mouse_x - x;       // Offset between the mouse position and object position
        offset_y = mouse_y - y;
        
        // Create a new object at the same position
        var new_obj = instance_create_layer(start_x, start_y, "Instances", object_index);
        new_obj.depth = depth - 1;
    }
} else if (dragging) {
    // When dragging, update object position to follow the mouse
    x = mouse_x - offset_x;
    y = mouse_y - offset_y;
}

// When dragging is finished (implement this when you release the mouse if desired)
if (dragging && !mouse_check_button_pressed(mb_left)) {
    dragging = false;
}
