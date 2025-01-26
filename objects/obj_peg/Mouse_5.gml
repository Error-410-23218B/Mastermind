var closest_slot = instance_nearest(mouse_x, mouse_y, obj_slot);

if(closest_slot.occupied and closest_slot.fillable){
closest_slot.occupied = false;
closest_slot.occupant = noone;
global.slots_filled--;

instance_destroy();

}