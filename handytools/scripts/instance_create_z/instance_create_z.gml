/// @param x
/// @param y
/// @param z
/// @param rotation
/// @param object

var _x   = argument0;
var _y   = argument1;
var _z   = argument2;
var _rot = argument3;
var _obj = argument4;

var _inst = tr_instance_create( _x, _y, _obj );
_inst.z = _z;
_inst.z_start = _z;
_inst.image_angle = _rot;

return _inst;