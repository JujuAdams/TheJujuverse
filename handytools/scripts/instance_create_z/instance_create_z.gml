///instance_create_z( x, y, z, rotation, object )

var _x   = argument0;
var _y   = argument1;
var _z   = argument2;
var _rot = argument3;
var _obj = argument4;

var _inst = instance_create_depth( _x, _y, 0, _obj );
_inst.z = _z;
_inst.z_start = _z;
_inst.image_angle = _rot;

return _inst;