///define_floor( x1, y1, x2, y2, z, tile size, texture sprite )

if ( !DOTOBJ_ON ) {
    trace_error_q( false, "Can't build floor - turn DOTOBJ on" );
    exit;
}

var _x1        = argument0;
var _y1        = argument1;
var _x2        = argument2;
var _y2        = argument3;
var _z         = argument4;
var _tile_size = argument5;
var _sprite    = argument6;

if ( object_index == obj_floor ) var _inst = id else var _inst = tr_instance_create( _x1, _y1, obj_floor );
with( _inst ) {
    
    x = _x1;
    y = _y1;
    z = _z;
    
    x1 = _x1;
    y1 = _y1;
    x2 = _x2;
    y2 = _y2;
    tile_size = _tile_size;
    sprite = _sprite;
    sprite_asset_name = sprite_get_name( _sprite );
    texture = sprite_get_texture( _sprite, 0 );
    
    vbf_floor = tr_vertex_create_buffer( "floor" );
    var _vbuff = vbf_floor;
    vertex_begin( _vbuff, global.vft_simple_3d );
    
    for( var _x = _x1; _x < _x2; _x += _tile_size ) {
        for( var _y = _y1; _y < _y2; _y += _tile_size ) {
            
            var _p_l = _x;
            var _p_t = _y;
            var _p_r = _x + _tile_size;
            var _p_b = _y + _tile_size;
            
            vertex_position_3d( _vbuff, _p_l, _p_t, _z ); vertex_texcoord( _vbuff, 0, 0 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, 0, 1 );
            vertex_position_3d( _vbuff, _p_r, _p_t, _z ); vertex_texcoord( _vbuff, 1, 0 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, 0, 1 );
            vertex_position_3d( _vbuff, _p_l, _p_b, _z ); vertex_texcoord( _vbuff, 0, 1 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, 0, 1 );
            
            vertex_position_3d( _vbuff, _p_r, _p_t, _z ); vertex_texcoord( _vbuff, 1, 0 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, 0, 1 );
            vertex_position_3d( _vbuff, _p_r, _p_b, _z ); vertex_texcoord( _vbuff, 1, 1 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, 0, 1 );
            vertex_position_3d( _vbuff, _p_l, _p_b, _z ); vertex_texcoord( _vbuff, 0, 1 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, 0, 1 );
            
        }
    }
    
    vertex_end( _vbuff );
    
}

return _inst;