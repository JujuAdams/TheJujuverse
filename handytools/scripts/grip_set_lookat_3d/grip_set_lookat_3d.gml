/// @description Sets a view matrix implicitly for a GRIP camera
/// @param name
/// @param xfrom
/// @param yfrom
/// @param zfrom
/// @param xto
/// @param yto
/// @param zto
/// @param xup
/// @param yup
/// @param zup

if ( !GRIP_ON ) return undefined;

var _name   = argument0;
var _xfrom  = argument1;
var _yfrom  = argument2;
var _zfrom  = argument3;
var _xto    = argument4;
var _yto    = argument5;
var _zto    = argument6;
var _xup    = argument7;
var _yup    = argument8;
var _zup    = argument9;

var _matrix = matrix_build_lookat( _xfrom, _yfrom, _zfrom,
                                     _xto,   _yto,   _zto,
                                     _xup,   _yup,   _zup );
                                     
var _map = global.grip_cameras_map[? _name ];
_map[? "view matrix" ] = _matrix;
_map[? "xfrom"       ] = _xfrom;
_map[? "yfrom"       ] = _yfrom;
_map[? "zfrom"       ] = _zfrom;
camera_set_view_mat( _map[? "camera" ], _matrix );