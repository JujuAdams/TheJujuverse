/// @param x1
/// @param y1
/// @param z1
/// @param x2
/// @param y2
/// @param z2
/// @param colour
/// @param alpha
/// @param thickness

var _x1        = argument0;
var _y1        = argument1;
var _z1        = argument2;    
var _x2        = argument3;
var _y2        = argument4;
var _z2        = argument5;
var _colour    = argument6;
var _alpha     = argument7;
var _thickness = argument8;

var _dx = _x2-_x1;
var _dy = _y2-_y1;
var _dz = _z2-_z1;

var _dist = sqrt( _dx*_dx + _dy*_dy + _dz*_dz );
var _norm_dx = _dx / _dist;
var _norm_dy = _dy / _dist;
var _norm_dz = _dz / _dist;

var _vbuff = vertex_create_buffer();
vertex_begin( _vbuff, global.vft_simple_3d );

var _lx1 = _x1 + _thickness*_norm_dy;
var _ly1 = _y1 + _thickness*_norm_dx;
var _lz1 = _z1;
var _lx2 = _x1 - _thickness*_norm_dy;
var _ly2 = _y1 - _thickness*_norm_dx;
var _lz2 = _z1;
var _lx3 = _lx1 + _dx;
var _ly3 = _ly1 + _dy;
var _lz3 = _lz1 + _dz;
var _lx4 = _lx2 + _dx;
var _ly4 = _ly2 + _dy;
var _lz4 = _lz2 + _dz;
var _normal = cross_product_normalised( _lx2-_lx1, _ly2-_ly1, _lz2-_lz1,
                                        _lx3-_lx1, _ly3-_ly1, _lz3-_lz1 );
var _nx = _normal[0];
var _ny = _normal[1];
var _nz = _normal[2];

vertex_position_3d( _vbuff, _lx1, _ly1, _lz1 ); vertex_texcoord( _vbuff, 0, 0 ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff, _nx, _ny, _nz );
vertex_position_3d( _vbuff, _lx2, _ly2, _lz2 ); vertex_texcoord( _vbuff, 1, 0 ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff, _nx, _ny, _nz );
vertex_position_3d( _vbuff, _lx3, _ly3, _lz3 ); vertex_texcoord( _vbuff, 0, 1 ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff, _nx, _ny, _nz );

vertex_position_3d( _vbuff, _lx2, _ly2, _lz2 ); vertex_texcoord( _vbuff, 1, 0 ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff, _nx, _ny, _nz );
vertex_position_3d( _vbuff, _lx4, _ly4, _lz4 ); vertex_texcoord( _vbuff, 1, 1 ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff, _nx, _ny, _nz );
vertex_position_3d( _vbuff, _lx3, _ly3, _lz3 ); vertex_texcoord( _vbuff, 0, 1 ); vertex_colour( _vbuff, _colour, _alpha ); vertex_normal( _vbuff, _nx, _ny, _nz );

vertex_end( _vbuff );
return _vbuff;