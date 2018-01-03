/// @description Returns the xfrom coordinate for a GRIP camera
///              This script will only work if grip_set_lookat() is used
/// @param name

if ( !GRIP_ON ) return undefined;

var _map = global.grip_cameras_map[? argument0 ];
return _map[? "xfrom" ];