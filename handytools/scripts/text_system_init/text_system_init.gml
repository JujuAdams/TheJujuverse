/// @description text_system_init( char min, char max, surface size, padding, font, [font]... )
/// @function text_system_init
/// @param  char min
/// @param  char max
/// @param  surface size
/// @param  padding
/// @param  font
/// @param  [font]... 

#macro TEXT_DEFAULT ""
#macro text_no_fade 0
#macro text_fade 1
#macro text_fade_per_char 2
#macro text_fade_per_line 3
#macro text_fade_per_word 4
#macro text_state_intro 0
#macro text_state_visible 1
#macro text_state_outro 2
#macro text_state_invisible 3


vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_texcoord();
vertex_format_add_colour();
global.text_font_vertex_format = vertex_format_end();

enum e_text_system { l, t, r, b, w, h, x, y, kern_w, kern_h }

draw_set_halign( fa_left );
draw_set_valign( fa_top );

var _old_x = x;
var _old_y = y;
var _old_sprite_index = sprite_index;
x = 0;
y = 0;

global.text_font_char_min = argument[0];
global.text_font_char_max = argument[1];
var _surface_size         = argument[2];
var _char_surface_size    = argument[3];
var _padding              = argument[4];
global.text_font_default  = argument[5]; //First font is the default font

global.text_font_char_size = 1 + global.text_font_char_max - global.text_font_char_min;
global.text_font_json      = tr_map_create();
global.text_font_default   = fnt_default;

global.text_font_surface_width  = _surface_size;
global.text_font_surface_height = _surface_size;

var _surface = tr_surface_create( global.text_font_surface_width, global.text_font_surface_height );
var _char_surface = tr_surface_create( _char_surface_size, _char_surface_size );

surface_set_target( _surface );
draw_clear_alpha( c_white, 0 );
gpu_set_blendenable( false );
draw_set_colour( c_white );
draw_rectangle( 0, 0, 1, 1, false );
draw_set_alpha( 1 );
gpu_set_blendenable( true );
surface_reset_target();

var _surf_x           = 2 + _padding;
var _surf_y           = 0;
var _surf_line_height = 2 + _padding;

for( var _i = 5; _i < argument_count; _i++ ) {
    
    var _font = argument[_i];
    var _font_map = tr_map_create();
    tr_map_add_map( global.text_font_json, _font, _font_map );
    _font_map[? "name" ] = font_get_name( _font );
        
    var _uvs = undefined;
    /* 0 = bbox left relative to draw position
       1 = bbox top relative to draw position
       2 = bbox right relative to draw position
       3 = bbox bottom relative to draw position
       4 = bbox width
       5 = bbox height
       6 = x on texture page
       7 = y on texture page
       8 = string_width of character
       9 = string_height of character  */
    
    draw_set_font( _font );
    
    for( var _index = 0; _index < global.text_font_char_size; _index++ ) {
        
        var _ord = _index + global.text_font_char_min;
        if ( _ord == 35 ) var _char = "\#" else var _char = chr( _ord );
        
        var _char_w = string_width( _char );
        var _char_h = string_height( _char );
        var _char_padding = 20;
        
        surface_set_target( _char_surface );
            draw_clear_alpha( c_black, 0 );
            draw_text( _char_padding, _char_padding, _char );
        surface_reset_target();
        
        sprite_index = sprite_create_from_surface( _char_surface, 0, 0, _char_surface_size, _char_surface_size, false, false, _char_padding, _char_padding );
        sprite_collision_mask( sprite_index, false,   0, 0,0,0,0,   0, 2 );
        
        var _l = -_char_padding;
        var _t = -_char_padding;
        var _r = _char_padding + _char_w;
        var _b = _char_padding + _char_h;
        
        while( !collision_line( _l, _t, _l, _b, id, true, false ) and ( _l < _r ) ) _l++;
        while( !collision_line( _l, _t, _r, _t, id, true, false ) and ( _t < _b ) ) _t++;
        while( !collision_line( _r, _t, _r, _b, id, true, false ) and ( _r > _l ) ) _r--;
        while( !collision_line( _l, _b, _r, _b, id, true, false ) and ( _b > _t ) ) _b--;
        
        _r++;
        _b++;
        var _w = _r - _l;
        var _h = _b - _t;
        
        _uvs[ _index, e_text_system.l ] = _l;
        _uvs[ _index, e_text_system.t ] = _t;
        _uvs[ _index, e_text_system.r ] = _r;
        _uvs[ _index, e_text_system.b ] = _b;
        _uvs[ _index, e_text_system.w ] = _w;
        _uvs[ _index, e_text_system.h ] = _h;
        
        if ( _surf_x + _w + _padding >= _surface_size ) {
            _surf_x = 0;
            _surf_y += _surf_line_height;
            _surf_line_height = 0;
        }
        
        _uvs[ _index, e_text_system.x ] = _surf_x;
        _uvs[ _index, e_text_system.y ] = _surf_y;
        _uvs[ _index, e_text_system.kern_w ] = _char_w;
        _uvs[ _index, e_text_system.kern_h ] = _char_h;
        
        surface_set_target( _surface );
            gpu_set_blendenable( false );
            draw_set_colour( c_white );
            draw_sprite_part( sprite_index, 0,
                              _char_padding + _l, _char_padding + _t,
                              _char_padding + _r, _char_padding + _b,
                              _surf_x, _surf_y );
            draw_set_alpha( 1 );
            gpu_set_blendenable( true );
        surface_reset_target();
        
        sprite_delete( sprite_index );
        
        _surf_x += _uvs[_index, e_text_system.w ] + _padding;
        _surf_line_height = max( _surf_line_height, _uvs[_index, e_text_system.h ] + _padding );
        
    }
    
    _font_map[? "uvs" ] = _uvs;
    
}

global.text_font_sprite  = sprite_create_from_surface( _surface, 0, 0, global.text_font_surface_width, global.text_font_surface_height, false, false, 0, 0 );
global.text_font_texture = sprite_get_texture( global.text_font_sprite, 0 );

tr_surface_free( _surface );
tr_surface_free( _char_surface );

x = _old_x;
y = _old_y;
sprite_index = _old_sprite_index;