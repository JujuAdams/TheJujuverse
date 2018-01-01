/// @param lx1
/// @param ly1
/// @param lz1
/// @param lx2
/// @param ly2
/// @param lz2
/// @param tx1
/// @param ty1
/// @param tz1
/// @param tx2
/// @param ty2
/// @param tz2
/// @param tx3
/// @param ty3
/// @param tz3

var _px = argument0;
var _py = argument1;
var _pz = argument2;
var _qx = argument3;
var _qy = argument4;
var _qz = argument5;
    
var _ax = argument6;
var _ay = argument7;
var _az = argument8;
var _bx = argument9;
var _by = argument10;
var _bz = argument11;
var _cx = argument12;
var _cy = argument13;
var _cz = argument14;

//Make all vertices relative to a single point (make A the origin)
var _ix = (_bx - _ax);
var _iy = (_by - _ay);
var _iz = (_bz - _az);
var _i_inv_dist = vector_normaliser( _ix, _iy, _iz );

var _jx = (_cx - _ax);
var _jy = (_cy - _ay);
var _jz = (_cz - _az);
var _j_inv_dist = vector_normaliser( _jx, _jy, _jz );
    
//Find the normal of the triangle
// N = I x J
var _nx = _iy*_jz - _iz*_jy;
var _ny = _iz*_jx - _ix*_jz;
var _nz = _ix*_jy - _iy*_jx;
var _n_dist = sqrt( _nx*_nx + _ny*_ny + _nz*_nz );
if ( _n_dist == 0 ) return false;
var _n_inv_dist = 1 / _n_dist;
_nx *= _n_inv_dist;
_ny *= _n_inv_dist;
_nz *= _n_inv_dist;
/*
vertex_submit_and_delete(
    vertex_buffer_line( _ax, _ay, _az,
                        _ax+20*_nx, _ay+20*_ny, _az+20*_nz,
                        c_white, 1, 1 )
);
*/    
var _ux = _qx - _px;
var _uy = _qy - _py;
var _uz = _qz - _pz;

//Project U onto the triangle's plane
// U.N
var _u_dot_n = _ux*_nx + _uy*_ny + _uz*_nz;
if ( _u_dot_n == 0 ) return false;
    
var _wx = _px - _ax;
var _wy = _py - _ay;
var _wz = _pz - _az;
var _w_dot_n = _wx*_nx + _wy*_ny + _wz*_nz;
    
var _s = -_w_dot_n / _u_dot_n;
var _sx = _s*_ux + _px - _ax;
var _sy = _s*_uy + _py - _ay;
var _sz = _s*_uz + _pz - _az;

// K = N x I
var _kx = _ny*_iz - _nz*_iy;
var _ky = _nz*_ix - _nx*_iz;
var _kz = _nx*_iy - _ny*_ix;

// S.K / J.K
var _check_j = ( _sx*_kx + _sy*_ky + _sz*_kz ) / ( _jx*_kx + _jy*_ky + _jz*_kz );
if ( _check_j < 0 ) return false;

var _check_i = ( _sx - _check_j*_jx ) / _ix;
return ( _check_i >= 0 ) && ( _check_i + _check_j <= 1 );