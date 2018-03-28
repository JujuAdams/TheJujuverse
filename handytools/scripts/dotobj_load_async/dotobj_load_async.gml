/// @description Queues an .obj file on disk to be loaded and processed
/// @param name
/// @param filename
/// @param vertex_format
/// @param flip_normals
/// @param flip_UVs
/// @param x
/// @param y
/// @param z
/// @param scale
/// @param sprite
/// @param image

var _name         = argument0;
var _filename     = argument1;
var _format       = argument2;
var _flip_normals = argument3;
var _flip_UVs     = argument4;
var _offset_x     = argument5;
var _offset_y     = argument6;
var _offset_z     = argument7;
var _scale        = argument8;
var _sprite       = argument9;
var _image        = argument10;

if ( !is_real( _sprite ) ) || ( _sprite == "" ) {
    
    var _extension = filename_ext( _filename );
    var _sprite_path = string_copy( _filename, 1, string_length( _filename ) - string_length( _extension ) ) + ".png";
    
    if ( file_exists( _sprite_path ) ) {
        _sprite = sprite_add( _sprite_path, 1, false, false, 0, 0 );
        if ( DOTOBJ_VERBOSE_LOAD ) trace( "Loaded ", _sprite_path, " for ", QU, _name, QU, " (", _filename, ")" );
    } else {
        if ( DOTOBJ_VERBOSE_LOAD ) trace( QU, _name, QU, " has no internal nor external texture (", _filename, ")" );
    }
    
}

var _buffer = buffer_create( 1024*1024, buffer_fast, 1 );
var _id = buffer_load_async( _buffer, _filename, 0, -1 );

var _map = tr_map_create();
_map[? "name"          ] = _name;
_map[? "filename"      ] = _filename;
_map[? "format"        ] = _format;
_map[? "flip normals"  ] = _flip_normals;
_map[? "flip UVs"      ] = _flip_UVs;
_map[? "offset x"      ] = _offset_x;
_map[? "offset y"      ] = _offset_y;
_map[? "offset z"      ] = _offset_z;
_map[? "scale"         ] = _scale;
_map[? "vertex buffer" ] = undefined; //Set in dotobj_load_async_process()
_map[? "buffer"        ] = _buffer;
_map[? "load id"       ] = _id;
_map[? "sprite"        ] = _sprite;
_map[? "image"         ] = _image;
_map[? "texture"       ] = (_sprite != undefined)? sprite_get_texture( _sprite, _image ) : undefined;
_map[? "triangles"     ] = undefined;

tr_map_add_map( global.obj_load_map, _id, _map );
return _id;