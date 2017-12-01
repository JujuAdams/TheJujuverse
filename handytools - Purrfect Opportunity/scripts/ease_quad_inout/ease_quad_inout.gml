/// @param t

var _t = argument0;
_t *= 2;

if ( _t < 1 ) {
    return 0.5 * _t*_t;
} else {
    _t--;
    return -0.5 * ( _t*(_t-2) - 1 );
}