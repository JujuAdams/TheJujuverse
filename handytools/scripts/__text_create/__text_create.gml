/// @description scribble( string, default font, default colour, default halign, box width, line height, box halign, box valign )
/// @function text_create
/// @param  string
/// @param  default font
/// @param  default colour
/// @param  default halign
/// @param  box width
/// @param  line height
/// @param  box halign
/// @param  box valign 
//
//  April 2017
//  Juju Adams
//  julian.adams@email.com
//  @jujuadams
//
//  This code and engine are provided under the Creative Commons "Attribution - NonCommerical - ShareAlike" international license.
//  https://creativecommons.org/licenses/by-nc-sa/4.0/

var _str         = argument0;
var _def_font    = argument1;
var _def_colour  = argument2;
var _def_halign  = argument3;
var _width_limit = argument4;
var _line_height = argument5;
var _box_halign  = argument6;
var _box_valign  = argument7;

//Replace newlines with single characters
_str = string_replace_all( _str, chr(10)+chr(13), chr(13) );
_str = string_replace_all( _str, chr(13)+chr(10), chr(13) );
_str = string_replace_all( _str,         chr(10), chr(13) );
_str = string_replace_all( _str,             "#", chr(13) );
_str = string_replace_all( _str,           "\\n", chr(13) );

draw_set_font( _def_font );
var _space_width = string_width( " " );
if ( !is_real( _line_height ) ) || ( _line_height < 0 ) var _line_height = string_height( chr(13) );

var _json = tr_map_create();

var _text_root_list         = tr_list_create();
var _hyperlink_map          = tr_map_create();
var _hyperlink_regions_list = tr_list_create();
var _vbuff_sprite_list      = tr_list_create();
tr_map_add_list( _json, "lines"            , _text_root_list );
tr_map_add_map(  _json, "hyperlinks"       , _hyperlink_map );
tr_map_add_list( _json, "hyperlink regions", _hyperlink_regions_list );
tr_map_add_list( _json, "vbuff sprites"    , _vbuff_sprite_list );
_json[? "string"           ] = _str;
_json[? "default font"     ] = _def_font;
_json[? "default colour"   ] = _def_colour;
_json[? "width limit"      ] = _width_limit;
_json[? "line height"      ] = _line_height;
_json[? "halign"           ] = _box_halign;
_json[? "valign"           ] = _box_valign;
_json[? "length"           ] = 0;
_json[? "words"            ] = 0;
_json[? "width"            ] = 0;
_json[? "height"           ] = 0;
_json[? "left"             ] = 0;
_json[? "top"              ] = 0;
_json[? "right"            ] = 0;
_json[? "bottom"           ] = 0;
_json[? "intro style"      ] = SCRIBBLE_FADE.OFF;
_json[? "intro max"        ] = 0;
_json[? "intro speed"      ] = 0.1;
_json[? "outro style"      ] = SCRIBBLE_FADE.OFF;
_json[? "outro max"        ] = 0;
_json[? "outro speed"      ] = 0.1;
_json[? "transition timer" ] = 0;
_json[? "transition state" ] = E_SCRIBBLE_STATE.INTRO;
_json[? "vertex buffer"    ] = noone;
_json[? "vbuff chars"      ] = 0;

var _text_x = 0;
var _text_y = 0;

var _line_map = noone;
var _line_list = noone;
var _line_length = 0;

var _text_font      = _def_font;
var _text_colour    = _def_colour;
var _text_halign    = _def_halign;
var _text_hyperlink = "";



//Find the first separator
var _sep_pos = string_length( _str ) + 1;
var _sep_prev_char = "";
var _sep_char = "";

var _char = " ";
var _pos = string_pos( _char, _str );
if ( _pos < _sep_pos ) && ( _pos > 0 ) {
    var _sep_char = _char;
    var _sep_pos = _pos;
}

var _char = chr(13);
var _pos = string_pos( _char, _str );
if ( _pos < _sep_pos ) && ( _pos > 0 ) {
    var _sep_char = _char;
    var _sep_pos = _pos;
}

var _char = "[";
var _pos = string_pos( _char, _str );
if ( _pos < _sep_pos ) && ( _pos > 0 ) {
    var _sep_char = _char;
    var _sep_pos = _pos;
}

var _char = "]";
var _pos = string_pos( _char, _str );
if ( _pos < _sep_pos ) && ( _pos > 0 ) {
    var _sep_char = _char;
    var _sep_pos = _pos;
}



//Iterate over the entire string...
while( string_length( _str ) > 0 ) {
    
    var _skip = false;
    var _force_newline = false;
    
    var _substr_width = 0;
    var _substr_height = 0;
    
    var _substr_length = _sep_pos - 1;
    var _substr_sprite = noone;
    var _substr = string_copy( _str, 1, _substr_length );
    _str = string_delete( _str, 1, _sep_pos );
    
    var _first_character = false;
    if ( _line_list == noone ) {
        _first_character = true;
    } else if ( ds_list_size( _line_list ) <= 1 ) {
        _first_character = true;
    }
    
    //Command handling
    if ( !_skip ) {
        if ( _sep_prev_char == "[" ) && ( _sep_char == "]" ) {
            
            var _work_str = _substr + "|";
            
            var _pos = string_pos( "|", _work_str );
            var _parameters = undefined;
            var _count = 0;
            while( _pos > 0 ) {
                
                _parameters[_count] = string_copy( _work_str, 1, _pos - 1 );
                _count++;
                
                _work_str = string_delete( _work_str, 1, _pos );
                _pos = string_pos( "|", _work_str );
                
            }
            
            //If the dev has used the [] command to reset draw state...
            if ( _parameters[0] == "" ) {
                
                _skip = true;
                _text_font      = _def_font;
                _text_colour    = _def_colour;
                _text_hyperlink = "";
                if ( _line_map != noone ) _line_map[? "halign" ] = _text_halign;
                draw_set_font( _text_font );
                
                
                
            //The command is an alignment keyphrase... set the alignment for the line and force a newline if the previous had content
            } else if ( ( _parameters[0] == "fa_left" ) && _first_character ) {
                
                _text_halign = fa_left;
                if ( _line_map != noone ) _line_map[? "halign" ] = _text_halign;
                _substr = "";
                
            } else if ( ( ( _parameters[0] == "fa_center" ) || ( _parameters[0] == "fa_centre" ) ) && _first_character ) {
                
                _text_halign = fa_center;
                if ( _line_map != noone ) _line_map[? "halign" ] = _text_halign;
                _substr = "";
                
            } else if ( ( _parameters[0] == "fa_right" ) && _first_character ) {
                
                _text_halign = fa_right;
                if ( _line_map != noone ) _line_map[? "halign" ] = _text_halign;
                _substr = "";
                
                
                
            //If the command is something else...
            } else {
                
                var _asset = asset_get_index( _parameters[0] );
                if ( _asset >= 0 ) {
                    
                    //Asset is a sprite...
                    if ( asset_get_type( _parameters[0] ) == asset_sprite ) {
                        
                        _substr_sprite = _asset;
                        _substr_width  = sprite_get_width(  _substr_sprite );
                        _substr_height = sprite_get_height( _substr_sprite );
                        _substr_length = 1;
                        
                    //Asset is a font...
                    } else if ( asset_get_type( _parameters[0] ) == asset_font ) {
                        
                        _skip = true;
                        _text_font = _asset;
                        draw_set_font( _text_font );
                    
                    //Asset is a colour..?
                    } else {
                        
                        _skip = true;
                        var _colour = string_to_colour( _parameters[0] );
                        if ( _colour != noone ) _text_colour = _colour;
                        
                    }
                
                //Not an asset
                } else {
                    
                    _skip = true;
                    if ( _parameters[0] == "/link" ) {
                        
                        _text_hyperlink = "";
                        
                    } else if ( _parameters[0] == "link" ) {
                        
                        if ( array_length_1d( _parameters ) >= 2 ) {
                            
                            _text_hyperlink = _parameters[1];
                            
                            var _map = _hyperlink_map[? _text_hyperlink ];
                            if ( _map == undefined ) {
                                
                                _map = tr_map_create();
                                tr_map_add_map( _hyperlink_map, _text_hyperlink, _map );
                                _map[? "over" ] = false;
                                _map[? "down" ] = false;
                                
                                if ( array_length_1d( _parameters ) >= 3 ) {
                                    _map[? "script name" ] = _parameters[2];
                                    _map[? "script"      ] = asset_get_index( _parameters[2] );
                                } else {
                                    _map[? "script name" ] = "";
                                    _map[? "script"      ] = asset_get_index( "" );
                                }
                                
                            }
                            
                        } else {
                            
                            _text_hyperlink = "";
                            
                        }
                        
                    } else {
                        
                        //Test if it's a colour
                        var _colour = string_to_colour( _parameters[0] );
                        if ( _colour != noone ) {
                            
                            _text_colour = _colour;
                            
                        //Test if it's a hexcode
                        } else {
                            
                            var _colour_string = string_upper( _parameters[0] );
                            if ( string_length( _colour_string ) <= 7 ) && ( ( string_copy( _colour_string, 1, 1 ) == "#" ) || ( string_copy( _colour_string, 1, 1 ) == "$" ) ) {
                                
                                var _hex = "0123456789ABCDEF";
                                var _red   = max( string_pos( string_copy( _colour_string, 3, 1 ), _hex )-1, 0 ) + ( max( string_pos( string_copy( _colour_string, 2, 1 ), _hex )-1, 0 ) << 4 );
                                var _green = max( string_pos( string_copy( _colour_string, 5, 1 ), _hex )-1, 0 ) + ( max( string_pos( string_copy( _colour_string, 4, 1 ), _hex )-1, 0 ) << 4 );
                                var _blue  = max( string_pos( string_copy( _colour_string, 7, 1 ), _hex )-1, 0 ) + ( max( string_pos( string_copy( _colour_string, 6, 1 ), _hex )-1, 0 ) << 4 );
                                _text_colour = make_colour_rgb( _red, _green, _blue );
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            
        } else {
            
            _substr_width  = string_width( _substr );
            _substr_height = string_height( _substr );
            
        }
        
    }
    
    //Element positioning
    if ( !_skip ) {
        
        //If we've run over the maximum width of the string
        if ( ( _substr_width + _text_x > _width_limit ) || ( _line_map == noone ) || ( _sep_prev_char == chr(13) ) || _force_newline ) {
            
            if ( _line_map != noone ) {
                
                _line_map[? "width"  ] = _text_x;
                _line_map[? "height" ] = _line_height;
                
                _text_x = 0;
                _text_y += _line_height;
                _line_length = 0;
                
            }
            
            _line_map = tr_map_create();
            _line_list = tr_list_create();
            
            tr_list_add_map( _text_root_list, _line_map );
            
            _line_map[? "x"      ] = 0;
            _line_map[? "y"      ] = _text_y;
            _line_map[? "width"  ] = 0;
            _line_map[? "height" ] = _line_height;
            _line_map[? "length" ] = 0;
            _line_map[? "halign" ] = _text_halign;
            tr_map_add_list( _line_map, "words", _line_list );
            
        }
        
        //Add a new word
        var _map = tr_map_create();
        _map[? "x"         ] = _text_x;
        _map[? "y"         ] = ( _line_height - _substr_height ) div 2;
        _map[? "width"     ] = _substr_width;
        _map[? "height"    ] = _substr_height;
        _map[? "string"    ] = _substr;
        _map[? "sprite"    ] = _substr_sprite;
        _map[? "length"    ] = _substr_length; //Include the separator character!
        _map[? "font"      ] = _text_font;
        _map[? "colour"    ] = _text_colour;
        _map[? "hyperlink" ] = _text_hyperlink;
        
        //If we've got a word with a hyperlink, add it to our list of hyperlink regions
        if ( _text_hyperlink != "" ) {
            var _region_map = tr_map_create();
            _region_map[? "hyperlink" ] = _text_hyperlink;
            _region_map[? "line"      ] = ds_list_size( _text_root_list )-1;
            _region_map[? "word"      ] = ds_list_size( _line_list );
            tr_list_add_map( _hyperlink_regions_list, _region_map );
        }
        
        //Add the word to the line list
        ds_list_add_map( _line_list, _map );
        
        _text_x += _substr_width;
        if ( _sep_char == " " ) {
            _text_x += _space_width; //Add spacing if the separation character is a space
            if ( _substr != "" ) _map[? "width" ] += _space_width;
        }
        
        _line_map[? "length" ] += _substr_length;
        if ( _substr_length > 0 ) _json[? "words" ]++;
        _json[? "length" ] += _substr_length;
        
    }
    
    //Find the next separator
    _sep_prev_char = _sep_char;
    _sep_char = "";
    _sep_pos = string_length( _str ) + 1;
    
    if ( _sep_prev_char != "[" ) {
        _char = " ";
        _pos = string_pos( _char, _str );
        if ( _pos < _sep_pos ) && ( _pos > 0 ) {
            _sep_char = _char;
            _sep_pos = _pos;
        }
    }
    
    var _char = chr(13);
    var _pos = string_pos( _char, _str );
    if ( _pos < _sep_pos ) && ( _pos > 0 ) {
        _sep_char = _char;
        _sep_pos = _pos;
    }

    var _char = "[";
    var _pos = string_pos( _char, _str );
    if ( _pos < _sep_pos ) && ( _pos > 0 ) {
        var _sep_char = _char;
        var _sep_pos = _pos;
    }
    
    var _char = "]";
    var _pos = string_pos( _char, _str );
    if ( _pos < _sep_pos ) && ( _pos > 0 ) {
        var _sep_char = _char;
        var _sep_pos = _pos;
    }
    
}

//Finish defining the last line
_line_map[? "width"  ] = _text_x;
_line_map[? "height" ] = _line_height;

//Textbox width and height
var _lines_size = ds_list_size( _text_root_list );

var _textbox_width = 0;
for( var _i = 0; _i < _lines_size; _i++ ) {
    var _line_map = _text_root_list[| _i ];
    _textbox_width = max( _textbox_width, _line_map[? "width" ] );
}

var _line_map = _text_root_list[| _lines_size - 1 ];
var _textbox_height = _line_map[? "y" ] + _line_map[? "height" ];
  
_json[? "width" ]  = _textbox_width;
_json[? "height" ] = _textbox_height;

var _hyperlink_region_size = ds_list_size( _hyperlink_regions_list );

//Adjust word positions
for( var _i = 0; _i < _lines_size; _i++ ) {
    
    var _line_map = _text_root_list[| _i ];
    var _halign = _line_map[? "halign" ];
    
    switch( _halign ) {
        case fa_left:
            _line_map[? "x" ] = 0;
        break;
        case fa_center:
            _line_map[? "x" ] += ( _textbox_width - _line_map[? "width" ] ) div 2;
        break;
        case fa_right:
            _line_map[? "x" ] += _textbox_width - _line_map[? "width" ];
        break;
    }
    
}



//Horizontal justification
if ( _box_halign == fa_left ) {
    
    _json[? "left" ]  = 0;
    _json[? "right" ] = _textbox_width;
    
} else if ( _box_halign == fa_center ) {
    
    _json[? "left" ]  = -_textbox_width div 2;
    _json[? "right" ] =  _textbox_width div 2;
    
} else if ( _box_halign == fa_right ) {
    
    _json[? "left" ]  = -_textbox_width;
    _json[? "right" ] = 0;
    
}

//Vertical justification
if ( _box_valign == fa_top ) {
    
    _json[? "top" ]    = 0;
    _json[? "bottom" ] = _textbox_height;

} else if ( _box_valign == fa_middle ) {
    
    _json[? "top" ]    = -_textbox_height div 2;
    _json[? "bottom" ] =  _textbox_height div 2;
    
    //Adjust word positions
    for( var _i = 0; _i < _lines_size; _i++ ) {
        var _line_map = _text_root_list[| _i ];
        _line_map[? "y" ] -= _textbox_height div 2;
    }
    
} else if ( _box_valign == fa_bottom ) {
    
    _json[? "top" ]    = -_textbox_height;
    _json[? "bottom" ] = 0;
    
    //Adjust word positions
    for( var _i = 0; _i < _lines_size; _i++ ) {
        var _line_map = _text_root_list[| _i ];
        _line_map[? "y" ] -= _textbox_height;
    }
    
}








//Build precached text model
var _vbuff = tr_vertex_create_buffer();
vertex_begin( _vbuff, global.scribble_font_vertex_format );

var _max_alpha = draw_get_alpha();

var _text_limit  = _json[? "transition timer" ];
var _text_font   = _json[? "default font" ];
var _text_colour = _json[? "default colour" ];

draw_set_font( _text_font );
draw_set_colour( _text_colour );
draw_set_halign( fa_left );
draw_set_valign( fa_top );

var _texture_char = 0;
var _texture_line = 0;
var _texture_x    = 0;
var _texture_y    = 0;

var _lines = _json[? "lines" ];
var _lines_size = ds_list_size( _lines );
for( var _i = 0; _i < _lines_size; _i++ ) {
    
    var _line_map = _lines[| _i ];
    var _line_length = _line_map[? "length" ];
    
    var _line_x = _line_map[? "x" ];
    var _line_y = _line_map[? "y" ];
    
    var _words = _line_map[? "words" ];
    var _words_size = ds_list_size( _words );
    for( var _j = 0; _j < _words_size; _j++ ) {
        
        var _word_map = _words[| _j ];
        var _word_length = _word_map[? "length" ];
        var _str_x = _line_x + _word_map[? "x" ];
        var _str_y = _line_y + _word_map[? "y" ];
        var _sprite = _word_map[? "sprite" ];
        
        if ( _sprite != noone ) {
            
            var _sprite_map = tr_map_create();
            _sprite_map[? "x"      ] = _str_x + sprite_get_xoffset( _sprite );
            _sprite_map[? "y"      ] = _str_y + sprite_get_yoffset( _sprite );
            _sprite_map[? "sprite" ] = _sprite;
            
            tr_list_add_map( _vbuff_sprite_list, _sprite_map );
            
        } else {
            
            var _font     = _word_map[? "font" ];
            var _font_uvs = ds_map_find_value( global.scribble_font_json[? _font ], "uvs" );
            var _colour = _word_map[? "colour" ];
            
            var _str = _word_map[? "string" ];
            var _string_size = string_length( _str );
            
            var _char_x = _str_x;
            var _char_y = _str_y;
            for( var _k = 1; _k <= _string_size; _k++ ) {
                
                var _char = string_copy( _str, _k, 1 );
                var _ord = ord( _char ) - SCRIBBLE_FONT_CHAR_MIN;
                
                if ( _ord < 0 ) || ( _ord >= SCRIBBLE_FONT_CHAR_SIZE ) continue;
                
                var _uv_l   = _font_uvs[ _ord, 0 ]/SCRIBBLE_SURFACE_SIZE;
                var _uv_t   = _font_uvs[ _ord, 1 ]/SCRIBBLE_SURFACE_SIZE;
                var _char_w = _font_uvs[ _ord, 2 ];
                var _char_h = _font_uvs[ _ord, 3 ];
                var _uv_r   = _uv_l + _char_w/SCRIBBLE_SURFACE_SIZE;
                var _uv_b   = _uv_t + _char_h/SCRIBBLE_SURFACE_SIZE;
                
                var _z = _i + ( _texture_char << 8 );
                
                vertex_position_3d( _vbuff, _char_x        , _char_y        , _z ); vertex_texcoord( _vbuff, _uv_l, _uv_t ); vertex_colour( _vbuff, _colour, 1 );
                vertex_position_3d( _vbuff, _char_x+_char_w, _char_y        , _z ); vertex_texcoord( _vbuff, _uv_r, _uv_t ); vertex_colour( _vbuff, _colour, 1 );
                vertex_position_3d( _vbuff, _char_x        , _char_y+_char_h, _z ); vertex_texcoord( _vbuff, _uv_l, _uv_b ); vertex_colour( _vbuff, _colour, 1 );
				
                vertex_position_3d( _vbuff, _char_x+_char_w, _char_y        , _z ); vertex_texcoord( _vbuff, _uv_r, _uv_t ); vertex_colour( _vbuff, _colour, 1 );
                vertex_position_3d( _vbuff, _char_x+_char_w, _char_y+_char_h, _z ); vertex_texcoord( _vbuff, _uv_r, _uv_b ); vertex_colour( _vbuff, _colour, 1 );
                vertex_position_3d( _vbuff, _char_x        , _char_y+_char_h, _z ); vertex_texcoord( _vbuff, _uv_l, _uv_b ); vertex_colour( _vbuff, _colour, 1 );
                
                _char_x += _char_w;
                _texture_char++;
                
            }
            
        }
        
        if ( _hyperlink_map[? _word_map[? "hyperlink" ] ] != undefined ) {
            
            var _word_w = _word_map[? "width" ];
            var _word_h = _word_map[? "height" ];
            
            vertex_position_3d( _vbuff, _str_x        , _str_y+_word_h-1, _z ); vertex_texcoord( _vbuff, 0, 0 ); vertex_colour( _vbuff, _colour, 1 );
            vertex_position_3d( _vbuff, _str_x+_word_w, _str_y+_word_h-1, _z ); vertex_texcoord( _vbuff, 0, 0 ); vertex_colour( _vbuff, _colour, 1 );
            vertex_position_3d( _vbuff, _str_x        , _str_y+_word_h+1, _z ); vertex_texcoord( _vbuff, 0, 0 ); vertex_colour( _vbuff, _colour, 1 );
            																   
            vertex_position_3d( _vbuff, _str_x+_word_w, _str_y+_word_h-1, _z ); vertex_texcoord( _vbuff, 0, 0 ); vertex_colour( _vbuff, _colour, 1 );
            vertex_position_3d( _vbuff, _str_x+_word_w, _str_y+_word_h+1, _z ); vertex_texcoord( _vbuff, 0, 0 ); vertex_colour( _vbuff, _colour, 1 );
            vertex_position_3d( _vbuff, _str_x        , _str_y+_word_h+1, _z ); vertex_texcoord( _vbuff, 0, 0 ); vertex_colour( _vbuff, _colour, 1 );
            
        }
        
    }
    
}

draw_set_font( fnt_default );
draw_set_colour( c_black );

vertex_end( _vbuff );
_json[? "vertex buffer" ] = _vbuff;
_json[? "vbuff chars"   ] = _texture_char;

return _json;