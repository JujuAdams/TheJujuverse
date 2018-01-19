/// @description Returns if the primary draw target of a GRIP camera is its depth surface
/// @param name

if ( !GRIP_ON ) return undefined;

var _map = global.grip_cameras_map[? argument0 ];
if ( _map == undefined ) return undefined;
return _map[? "primary is depth" ];