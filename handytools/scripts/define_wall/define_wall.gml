///define_wall( x1, y1, z1, x2, y2, z2, texture sprite )

if ( !OBJ_MODEL_ON ) {
	trace_error_q( false, "Can't build wall - turn OBJ_MODEL on" );
	exit;
}

var _x1          = argument0;
var _y1          = argument1;
var _z1          = argument2;
var _x2          = argument3;
var _y2          = argument4;
var _z2          = argument5;
var _sprite      = argument6;
var _tile_size   = 32;
var _thickness   = 2;

var _inst = tr_instance_create( _x1, _y1, obj_wall );
with( _inst ) {
    
    x1 = _x1;
    y1 = _y1;
    z1 = _z1;
    z  = _z1;
    x2 = _x2;
    y2 = _y2;
    z2 = _z2;
    thickness = _thickness;
    sprite = _sprite;
    texture = sprite_get_texture( _sprite, 0 );
    
    var _length = point_distance( x1, y1, x2, y2 )
    image_xscale = _length;
    image_yscale = thickness*6;
    image_angle  = point_direction( x1, y1, x2, y2 );
    
    x += lengthdir_x( 6*thickness*0.5, image_angle+90 );
    y += lengthdir_y( 6*thickness*0.5, image_angle+90 );
    
    
    vbf_wall = tr_vertex_create_buffer( "wall" );
    var _vbuff = vbf_wall;
    vertex_begin( _vbuff, global.vft_simple_3d );
    
    for( var _x = 0; _x < _length; _x += _tile_size ) {
        for( var _z = 0; _z < _z2-_z1; _z += _tile_size ) {
            
            var _p_l = _x;
            var _p_t = _z;
            var _p_r = _x + _tile_size;
            var _p_b = _z + _tile_size;
            
            var _y = _thickness*0.5;
            vertex_position_3d( _vbuff, _p_l, _y, _p_t ); vertex_texcoord( _vbuff, 0, 0 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, 1, 0 );
            vertex_position_3d( _vbuff, _p_l, _y, _p_b ); vertex_texcoord( _vbuff, 0, 1 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, 1, 0 );
            vertex_position_3d( _vbuff, _p_r, _y, _p_t ); vertex_texcoord( _vbuff, 1, 0 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, 1, 0 );
            
            vertex_position_3d( _vbuff, _p_r, _y, _p_t ); vertex_texcoord( _vbuff, 1, 0 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, 1, 0 );
            vertex_position_3d( _vbuff, _p_l, _y, _p_b ); vertex_texcoord( _vbuff, 0, 1 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, 1, 0 );
            vertex_position_3d( _vbuff, _p_r, _y, _p_b ); vertex_texcoord( _vbuff, 1, 1 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, 1, 0 );
            
            _y = -_thickness*0.5;
            vertex_position_3d( _vbuff, _p_r, _y, _p_t ); vertex_texcoord( _vbuff, 1, 0 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, -1, 0 );
            vertex_position_3d( _vbuff, _p_l, _y, _p_b ); vertex_texcoord( _vbuff, 0, 1 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, -1, 0 );
            vertex_position_3d( _vbuff, _p_l, _y, _p_t ); vertex_texcoord( _vbuff, 0, 0 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, -1, 0 );
            
            vertex_position_3d( _vbuff, _p_r, _y, _p_b ); vertex_texcoord( _vbuff, 1, 1 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, -1, 0 );
            vertex_position_3d( _vbuff, _p_l, _y, _p_b ); vertex_texcoord( _vbuff, 0, 1 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, -1, 0 );
            vertex_position_3d( _vbuff, _p_r, _y, _p_t ); vertex_texcoord( _vbuff, 1, 0 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, -1, 0 );
            
        }
    }
    
    vertex_end( _vbuff );
    
}

return _inst;