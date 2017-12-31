/// @description Gets the destination room of the current transition, if any

with( obj_transition_parent ) return target_room;
return TRANSITION_NONE;