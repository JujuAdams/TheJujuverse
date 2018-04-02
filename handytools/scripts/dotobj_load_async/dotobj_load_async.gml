/// @description Queues an .obj file on disk to be loaded and processed
/// @param name
/// @param filename
/// @param x
/// @param y
/// @param z
/// @param scale_x
/// @param scale_y
/// @param scale_z
/// @param ignore_groups

var _name     = argument0;
var _filename = argument1;
var _offset_x = argument2;
var _offset_y = argument3;
var _offset_z = argument4;
var _scale_x  = argument5;
var _scale_y  = argument6;
var _scale_z  = argument7;
var _ignore   = argument8;

return dotobj_load_async_ext( _name, _filename, global.vft_simple_3d, DOTOBJ_DEFAULT_FLIP_NORMALS, DOTOBJ_DEFAULT_FLIP_UVS, _offset_x, _offset_y, _offset_z, _scale_x, _scale_y, _scale_z, undefined, 0, _ignore );