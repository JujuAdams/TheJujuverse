/// @description text_draw( x, y, json, fade, smoothness )
/// @function text_draw
/// @param  x
/// @param  y
/// @param  json
/// @param  fade
/// @param  smoothness 
//
//  April 2017
//  Juju Adams
//  julian.adams@email.com
//  @jujuadams
//
//  This code and engine are provided under the Creative Commons "Attribution - NonCommerical - ShareAlike" international license.
//  https://creativecommons.org/licenses/by-nc-sa/4.0/

var _old_alpha = draw_get_alpha();

var _x          = argument0;
var _y          = argument1;
var _json       = argument2;
var _fade       = argument3;
var _smoothness = argument4;
if ( _json < 0 ) exit;

if ( !is_real( _fade ) ) _fade = 1;
if ( !is_real( _smoothness ) ) _smoothness = 0;

var _hyperlinks        = _json[? "hyperlinks"        ];
var _hyperlink_regions = _json[? "hyperlink regions" ];
var _json_lines        = _json[? "lines"             ];

/*
shader_set( shd_text_basic );
//*/
//*
shader_set( shd_SCRIBBLE_FADE.ON_char );
shader_set_uniform_f( shader_get_uniform( shd_SCRIBBLE_FADE.ON_char, "u_fTime" ), ( _json[? "vbuff chars" ] + _smoothness ) * _fade );
shader_set_uniform_f( shader_get_uniform( shd_SCRIBBLE_FADE.ON_char, "u_fSmoothness" ), _smoothness );
//*/
/*
shader_set( shd_SCRIBBLE_FADE.ON_line );
shader_set_uniform_f( shader_get_uniform( shd_SCRIBBLE_FADE.ON_line, "u_fTime" ), ( ds_list_size( _json[? "lines" ] ) + _smoothness ) * _fade );
shader_set_uniform_f( shader_get_uniform( shd_SCRIBBLE_FADE.ON_line, "u_fSmoothness" ), _smoothness );
//*/

var _matrix;
_matrix[15] =  1;
_matrix[ 0] =  1;
_matrix[ 5] =  1;
_matrix[10] =  1;
_matrix[12] = _x;
_matrix[13] = _y;
matrix_set( matrix_world, _matrix );
vertex_submit( _json[? "vertex buffer" ], pr_trianglelist, global.scribble_texture );
_matrix[12] = 0;
_matrix[13] = 0;
matrix_set( matrix_world, _matrix );
shader_reset();



var _sprite_list = _json[? "vbuff sprites" ];
var _sprites_size = ds_list_size( _sprite_list );
for( var _i = 0; _i < _sprites_size; _i++ ) {
    
    var _sprite_map = _sprite_list[| _i ];
    var _sprite_x = _x + _sprite_map[? "x" ];
    var _sprite_y = _y + _sprite_map[? "y" ];
    
    draw_sprite( _sprite_map[? "sprite" ], -1, _sprite_x, _sprite_y );
    
}



var _regions = ds_list_size( _hyperlink_regions );
for( var _i = 0; _i < _regions; _i++ ) {
    
    var _region_map    = _hyperlink_regions[| _i ];
    var _hyperlink_map = _hyperlinks[? _region_map[? "hyperlink" ] ];
    var _region_line   = _region_map[? "line" ];
    var _region_word   = _region_map[? "word" ];
    
    var _line_map   = _json_lines[| _region_line ];
    var _words_list = _line_map[? "words" ];
    var _word_map   = _words_list[| _region_word ];
    
    var _region_x = _x + _line_map[? "x" ] + _word_map[? "x" ];
    var _region_y = _y + _line_map[? "y" ] + _word_map[? "y" ];
    
    if ( _hyperlink_map[? "down" ] ) {
        draw_rectangle( _region_x, _region_y, _region_x + _word_map[? "width" ], _region_y + _word_map[? "height" ], false );
    }
    
}