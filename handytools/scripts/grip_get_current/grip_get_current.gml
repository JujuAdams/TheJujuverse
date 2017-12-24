if ( !GRIP_ON ) return undefined;

if ( global.grip_handling_manual ) return global.grip_current_manual;
return global.grip_view_list[| view_current ];