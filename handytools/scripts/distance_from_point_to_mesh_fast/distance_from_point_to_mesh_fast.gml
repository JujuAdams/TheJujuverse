///@param preprocessed_triangle_array
///@param x
///@param y
///@param z
///@param [initial_distance]


var _array   = argument[0];
var _px      = argument[1];
var _py      = argument[2];
var _pz      = argument[3];
var _closest = ((argument_count<5) || ( argument[4]==undefined))? VERY_LARGE : argument[4];

var _size = array_length_1d( _array );
for( var _tri = 0; _tri < _size; _tri += 12 ) {
	
	var _ix = _array[_tri   ];
	var _iy = _array[_tri+ 1];
	var _iz = _array[_tri+ 2];
	
	var _jx = _array[_tri+ 3];
	var _jy = _array[_tri+ 4];
	var _jz = _array[_tri+ 5];
	
	var _cx = _array[_tri+ 6];
	var _cy = _array[_tri+ 7];
	var _cz = _array[_tri+ 8];
	
	var _nx = _array[_tri+ 9];
	var _ny = _array[_tri+10];
	var _nz = _array[_tri+11];
	
	//Make the point P relative to C
	var _vx = _px - _cx;
	var _vy = _py - _cy;
	var _vz = _pz - _cz;
	
	//Project V onto the triangle's plane
	var _dot = dot_product_3d( _vx, _vy, _vz,   _nx, _ny, _nz );
	var _sx = _vx - _nx*_dot;
	var _sy = _vy - _ny*_dot;
	var _sz = _vz - _nz*_dot;
	
	//Find the distance to the plane early - this is the minimum value the distance ever can be
	var _rx = _sx - _vx;
	var _ry = _sy - _vy;
	var _rz = _sz - _vz;
	var _dist = sqrt( _rx*_rx + _ry*_ry + _rz*_rz );
	
	//If this minimum distance is still too far, skip the rest of this iteration
	if ( _dist >= _closest ) continue;
	
	//Project onto the basis vectors for the triangle
	var _i = dot_product_3d( _sx, _sy, _sz,   _ix, _iy, _iz );
	var _j = dot_product_3d( _sx, _sy, _sz,   _jx, _jy, _jz );
	
	/*
		|\
		| \
		|  \
		|   \
		L____\
	*/
	var _closest_i = 0;
	var _closest_j = 0;
	if ( _i < 0 ) && ( _j >= 0 ) {
		
		//Left
		//_closest_i = 0;
		_closest_j = min( 1, _j );
		
		_rx = _jx*_closest_j - _vx;
		_ry = _jy*_closest_j - _vy;
		_rz = _jz*_closest_j - _vz;
		_dist = sqrt( _rx*_rx + _ry*_ry + _rz*_rz );
		
	} else if ( _i >= 0 ) && ( _j < 0 ) {
		
		//Below
		_closest_i = min( _i, 1 );
		//_closest_j = 0;
		
		_rx = _ix*_closest_i - _vx;
		_ry = _iy*_closest_i - _vy;
		_rz = _iz*_closest_i - _vz;
		_dist = sqrt( _rx*_rx + _ry*_ry + _rz*_rz );
		
	} else if ( _i < 0 ) && ( _j < 0 ) {
		
		//Bottom-left
		//_closest_i = 0;
		//_closest_j = 0;
		
		_dist = sqrt( _vx*_vx + _vy*_vy + _vz*_vz );
		
	} else if ( _i + _j > 1 ) {
		
		//Outside (remember that y=1-x defines the hypotenuese)
		//Shortest distance is always on the line y=x+c
		//Closest point satisfies both equations
		_closest_i = 0.5*( 1 + (_j - _i) );
		_closest_j = 1 - _closest_i;
		
		_rx = _ix*_closest_i + _jx*_closest_j - _vx;
		_ry = _iy*_closest_i + _jy*_closest_j - _vy;
		_rz = _iz*_closest_i + _jz*_closest_j - _vz;
		_dist = sqrt( _rx*_rx + _ry*_ry + _rz*_rz );
		
	} else {
		
		//Inside the triangle
		//No recalc necessary - this is the same as the early distance
		//_closest_i = _i;
		//_closest_j = _j;
		
	}
	
	_closest = min( _closest, _dist );
	
}

return _closest;