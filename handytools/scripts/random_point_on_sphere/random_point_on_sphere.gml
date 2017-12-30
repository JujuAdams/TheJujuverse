var _a = random( 180 );
var _b = random( 360 );
var _cos = dcos( _a );
var _sin = sqrt( 1 - _cos*_cos );

var _array;
_array[2] = dcos( _a );
_array[1] = _sin * dsin( _b );
_array[0] = _sin * dcos( _b );

return _array;