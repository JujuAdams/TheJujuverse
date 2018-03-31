/// @param integer
/// @param x
/// @param y
/// @param z

var _number = argument0;
var _x      = argument1;
var _y      = argument2;
var _z      = argument3;

_number = abs( floor( _number ) );
var _string = string( _number );

repeat( 8 - string_length( _string ) ) _string = "0" + _string;



var _length = string_length( _string );

var _width = max( 0, _length*7 );
_x -= _width/2;

for( var _i = 1; _i <= _length; _i++ ) {
    
    matrix_chain_begin();
    matrix_chain_translate( _x, _y, _z );
    matrix_chain_end( matrix_world );
    dotobj_submit( string_copy( _string, _i, 1 ) );
    
    _x += 7;
    
}