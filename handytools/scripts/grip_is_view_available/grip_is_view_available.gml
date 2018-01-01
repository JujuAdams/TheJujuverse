/// @description Returns if a GameMaker-native view slot has no associated GRIP camera
/// @param view

if ( !GRIP_ON ) return false;

return ( global.grip_view_list[| argument0 ] == undefined );