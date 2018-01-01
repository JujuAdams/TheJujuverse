/// @description Returns the current GRIP camera that's being rendered

if ( !GRIP_ON ) return undefined;

if ( global.grip_handling_manual ) return global.grip_current_manual;
return global.grip_view_list[| view_current ];