/// @description Returns the shader attached to a GRIP camera
/// @param name

if ( !GRIP_ON ) return undefined;

var _map = global.grip_cameras_map[? argument0 ];
if ( _map == undefined ) return undefined;
return _map[? "shader" ];