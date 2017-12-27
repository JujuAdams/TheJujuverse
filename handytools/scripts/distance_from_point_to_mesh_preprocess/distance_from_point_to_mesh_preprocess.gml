///@param triangle_array

var _array = argument[0];

var _size = array_length_1d( _array );

var _output_size = 4*(_size div 3);
var _o = 0;
var _output;
_output[ _output_size-1 ] = 0;

for( var _tri = 0; _tri < _size; _tri += 9 ) {
	
	var _ax = _array[_tri  ];
	var _ay = _array[_tri+1];
	var _az = _array[_tri+2];
	
	var _bx = _array[_tri+3];
	var _by = _array[_tri+4];
	var _bz = _array[_tri+5];
	
	var _cx = _array[_tri+6];
	var _cy = _array[_tri+7];
	var _cz = _array[_tri+8];
	
	//Make all vertices relative to a single point (make A the origin)
	var _ix = _ax - _cx;
	var _iy = _ay - _cy;
	var _iz = _az - _cz;
	
	var _jx = _bx - _cx;
	var _jy = _by - _cy;
	var _jz = _bz - _cz;
	
	//Find the normal of the triangle
	var _normal = cross_product( _ix, _iy, _iz,
	                             _jx, _jy, _jz );
	
	//Bang this into the output array
	_output[_o   ] = _ix;
	_output[_o+ 1] = _iy;
	_output[_o+ 2] = _iz;
	
	_output[_o+ 3] = _jx;
	_output[_o+ 4] = _jy;
	_output[_o+ 5] = _jz;
	
	_output[_o+ 6] = _cx;
	_output[_o+ 7] = _cy;
	_output[_o+ 8] = _cz;
	
	_output[_o+ 9] = _normal[0];
	_output[_o+10] = _normal[1];
	_output[_o+11] = _normal[2];
	
	_o += 12;
	
}

return _output;