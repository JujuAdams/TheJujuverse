/// @param sphere_array
/// @param x
/// @param y
/// @param z
/// @param radius
/// @param exception

var _sphere_array = argument0;
var _x            = argument1;
var _y            = argument2;
var _z            = argument3;
var _r            = argument4;
var _exception    = argument5;

var _size = array_length_1d( _sphere_array );
for( var _i = 0; _i < _size; _i += 4 ) {
    if ( _i == _exception ) continue;
    
    var _dx = _sphere_array[_i  ] - _x;
    var _dy = _sphere_array[_i+1] - _y;
    var _dz = _sphere_array[_i+2] - _z;
    if ( _dx*_dx + _dy*_dy + _dz*_dz <= sqr( _sphere_array[_i+3] + _r ) ) return true;
                
}

return false;