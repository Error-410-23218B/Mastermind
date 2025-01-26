dragging = false;
   
	var closest_slot = instance_nearest(mouse_x, mouse_y, obj_slot);
    if (point_in_rectangle(mouse_x, mouse_y, closest_slot.x - 25, closest_slot.y - 25, closest_slot.x + 25, closest_slot.y + 25) and closest_slot.fillable) {
      draggable = false;
	  x = closest_slot.x + 8;
        y = closest_slot.y + 8;	
		
    if (!closest_slot.occupied) {
            closest_slot.occupied = true;   
            closest_slot.occupant = string_delete(object_get_name(object_index),1,4);   
			inSlot = true;
			global.slots_filled++;
			
			
        } else if (!inSlot and closest_slot.occupied){
         
            show_debug_message("Slot already occupied!");
            x = start_x;
            y = start_y;	
			draggable = true;
        }
    } else if (!inSlot) {

        x = start_x;
        y = start_y;
		draggable = true;
    }