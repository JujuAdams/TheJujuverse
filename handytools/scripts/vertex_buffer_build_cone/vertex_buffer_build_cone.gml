/// @description Draws a simple 3D cone.
/// @param x1 The initial x coordinate of the cone.
/// @param y1 The initial y coordinate of the cone.
/// @param z1 The initial z coordinate of the cone.
/// @param x2 The opposite x coordinate of the cone.
/// @param y2 The opposite y coordinate of the cone. 
/// @param z2 The opposite z coordinate of the cone.
/// @param hrepeat Amount of horizontal repetitions for the texture.
/// @param vrepeat Amount of vertical repetitions for the texture.
/// @param closed Sets whether to close (true) the bottom of the cone or not (false).
/// @param steps How many steps are used to make the cone "round" (typically 24)
/// @returns 

var _x1      = argument0;
var _y1      = argument1;
var _z1      = argument2;
var _x2      = argument3;
var _y2      = argument4;
var _z2      = argument5;
var _hrepeat = argument6;
var _vrepeat = argument7;
var _closed  = argument8;
var _steps   = argument9;

_steps = clamp( _steps, 3, 128 );

var _cc;
var _ss;
_cc[ _steps ] = 0;
_ss[ _steps ] = 0;

for( var _i = 0; _i <= _steps; _i++ ) {
	var _a = 360*_i/_steps;
	_cc[ _i ] = dcos( _a );
	_ss[ _i ] = dsin( _a );
}

var _mx = 0.5*( _x2 + _x1 );
var _my = 0.5*( _y2 + _y1 );
var _rx = 0.5*( _x2 - _x1 );
var _ry = 0.5*( _y2 - _y1 );


                        
var _vbuff = vertex_create_buffer();
vertex_begin( _vbuff, global.vft_simple_3d );

var _i = 0;
var _this = [ _mx + _cc[_i]*_rx,  _my + _ss[_i]*_ry, _z1,
                                 _hrepeat*_i/_steps,   0,
                                            c_white,   1,
                        _cc[_i],            _ss[_i],   0 ];

for( var _i = 1; _i <= _steps; _i++ ) {
    
    var _prev = _this;
    var _this = [ _mx + _cc[_i]*_rx,  _my + _ss[_i]*_ry, _z1,
                                     _hrepeat*_i/_steps,   0,
                                                c_white,   1,
                            _cc[_i],            _ss[_i],   0 ];
    
    vertex_position_3d( _vbuff,      _mx,      _my,      _z2 ); vertex_texcoord( _vbuff, _hrepeat*_i/_steps, _vrepeat ); vertex_colour( _vbuff,  c_white,        1 ); vertex_normal( _vbuff,        0,        0,        1 );
    vertex_position_3d( _vbuff, _prev[0], _prev[1], _prev[2] ); vertex_texcoord( _vbuff,           _prev[3], _prev[4] ); vertex_colour( _vbuff, _prev[5], _prev[6] ); vertex_normal( _vbuff, _prev[7], _prev[8], _prev[9] );
    vertex_position_3d( _vbuff, _this[0], _this[1], _this[2] ); vertex_texcoord( _vbuff,           _this[3], _this[4] ); vertex_colour( _vbuff, _this[5], _this[6] ); vertex_normal( _vbuff, _this[7], _this[8], _this[9] );
    
}

if ( _closed ) {
    
    var _i = 0;
    var _this = [ _mx+_cc[_i]*_rx, _my+_ss[_i]*_ry, _z1,
                                                 0,   0,
                                           c_white,   1,
                                0,               0,  -1 ];

    for( var _i = 1; _i <= _steps; _i++ ) {
    
        var _prev = _this;
        var _this = [ _mx+_cc[_i]*_rx, _my+_ss[_i]*_ry, _z1,
                                                     0,   0,
                                               c_white,   1,
                                    0,               0,  -1 ];
    
        vertex_position_3d( _vbuff,      _mx,      _my,      _z1 ); vertex_texcoord( _vbuff,        0,        0 ); vertex_colour( _vbuff,  c_white,        1 ); vertex_normal( _vbuff,        0,        0,       -1 );
        vertex_position_3d( _vbuff, _prev[0], _prev[1], _prev[2] ); vertex_texcoord( _vbuff, _prev[3], _prev[4] ); vertex_colour( _vbuff, _prev[5], _prev[6] ); vertex_normal( _vbuff, _prev[7], _prev[8], _prev[9] );
        vertex_position_3d( _vbuff, _this[0], _this[1], _this[2] ); vertex_texcoord( _vbuff, _this[3], _this[4] ); vertex_colour( _vbuff, _this[5], _this[6] ); vertex_normal( _vbuff, _this[7], _this[8], _this[9] );
    
    }
    
}

vertex_end( _vbuff );
return _vbuff;
