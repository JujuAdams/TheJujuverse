/// @description Synchronously loads an .obj model from disk to a vertex buffer
///              This script assumes use of the global.vft_simple_3d vertex format.
/// @param filename
/// @param vertex_format
/// @param flip_normals
/// @param flip_UVs
/// @param x
/// @param y
/// @param z
/// @param scale

var _filename     = argument0;
var _format       = argument1;
var _flip_normals = argument2;
var _flip_UVs     = argument3;
var _offset_x     = argument4;
var _offset_y     = argument5;
var _offset_z     = argument6;
var _scale        = argument7;

if ( _flip_normals ) _flip_normals = -1 else _flip_normals = 1;

var _vertex_list  = tr_list_create(); ds_list_add( _vertex_list,   0,0,0 );
var _normal_list  = tr_list_create(); ds_list_add( _normal_list,   0,0,0 );
var _texture_list = tr_list_create(); ds_list_add( _texture_list,  0,0   );
var _faces_list   = tr_list_create();

var _file = file_text_open_read( _filename );
while( !file_text_eof( _file ) ) {

    var _row_string = file_text_read_string( _file );
    _row = string_replace_all( _row_string, "  ", " " );
    
    if ( string_copy( _row_string, 1, 2 ) == "v " ) {
        
        _row_string = string_delete( _row_string, 1, string_pos( " ", _row_string ) );
        var _pos = string_pos( " ", _row_string );
        var _x =  real( string_copy( _row_string, 1, _pos ) );
        
        _row_string = string_delete( _row_string, 1, _pos );
        var _pos = string_pos( " ", _row_string );
        var _y =  real( string_copy( _row_string, 1, _pos ) );
        
        var _z = real( string_delete( _row_string, 1, _pos ) );
        
        ds_list_add( _vertex_list,   ( _x + _offset_x ) * _scale,
                                     ( _y + _offset_y ) * _scale,
                                     ( _z + _offset_z ) * _scale );
        
    }
    
    if ( string_copy( _row_string, 1, 2 ) == "vn" ) {
        
        _row_string = string_delete( _row_string, 1, string_pos( " ", _row_string ) );
        var _pos = string_pos( " ", _row_string );
        var _x =  real( string_copy( _row_string, 1, _pos ) );
        
        _row_string = string_delete( _row_string, 1, _pos );
        var _pos = string_pos( " ", _row_string );
        var _y =  real( string_copy( _row_string, 1, _pos ) );
        
        var _z = real( string_delete( _row_string, 1, _pos ) );
        
        ds_list_add( _normal_list,   _x,
                                     _y,
                                     _z );
        
    }
    
    if ( string_copy( _row_string, 1, 2 ) == "vt" ) {
        
        _row_string = string_delete( _row_string, 1, string_pos( " ", _row_string ) );
        var _pos = string_pos( " ", _row_string );
        var _x =  real( string_copy( _row_string, 1, _pos ) );
        
        var _y = real( string_delete( _row_string, 1, _pos ) );
        
        ds_list_add( _texture_list,   _x,
                                      _y );
        
    }
    
    if ( string_copy( _row_string, 1, 2 ) == "f " ) {
        
        _row_string = string_replace_all( _row_string, "  ", " " );
        _row_string = string_delete( _row_string, 1, string_pos( " ", _row_string ) );
        if ( string_char_at( _row_string, string_length( _row_string ) ) == " " ) _row_string = string_copy( _row_string, 1, string_length( _row_string )-1 );
        
        var _face_num = string_count( " ", _row_string );
        var _faces; _faces[0] = 0;
        
        for( var _i = 1; _i <= _face_num; _i++ ) {
            var _pos = string_pos( " ", _row_string );
            _faces[ _i ] = string_copy( _row_string, 1, _pos );
            _row_string = string_delete( _row_string, 1, _pos );
        }
        _faces[ _face_num+1 ] = _row_string;
        
        
        ds_list_add( _faces_list,   _faces[ 2 ],
                                    _faces[ 3 ],
                                    _faces[ 1 ] );
        
                                    
        for( var _t = 0; _t <= _face_num-3; _t++ ) {
            ds_list_add( _faces_list,   _faces[ 4+_t ],
                                        _faces[ 1    ],
                                        _faces[ 3+_t ] );
        }
        
        
    } 
    
    file_text_readln( _file );          
}

file_text_close( _file );



var _vbuff = tr_vertex_create_buffer( argument0, true );
vertex_begin( _vbuff, _format );
    
    var _size = ds_list_size( _faces_list );
    for( var _i = 0; _i < _size; _i++ ) {
    
        var _face_string = _faces_list[| _i ];
        
        if ( string_count( "/", _face_string ) == 0 ) {
            var _f_index = _face_string;
            var _t_index = -1;
            var _n_index = -1;
        }
        
        var _slash_count = string_count( "/", _face_string );
        if ( _slash_count == 1 ) {
            
            _f_index = string_copy(   _face_string, 1, string_pos( "/", _face_string )-1 );
            _t_index = string_delete( _face_string, 1, string_pos( "/", _face_string ) );
            _n_index = -1;
            
        } else if ( _slash_count == 2 ) {
            
            var _double_slash_count = string_count( "//", _face_string );
            if ( _double_slash_count == 0 ) {
                
                _f_index     = string_copy(   _face_string, 1, string_pos( "/", _face_string )-1 );
                _face_string = string_delete( _face_string, 1, string_pos( "/", _face_string ) );
                _t_index     = string_copy(   _face_string, 1, string_pos( "/", _face_string )-1 );
                _n_index     = string_delete( _face_string, 1, string_pos( "/", _face_string ) );
                
            } else if ( _double_slash_count == 1 ) {
                
                _face_string = string_replace( _face_string, "//", "/" );
                _f_index     = string_copy(    _face_string, 1, string_pos( "/", _face_string )-1 );
                _n_index     = string_delete(  _face_string, 1, string_pos( "/", _face_string ) );
                _t_index     = -1;
                
            }
            
        }
        
        var _f_index = 3*floor( real( _f_index ) );
        var _vx = _vertex_list[| _f_index   ];
        var _vy = _vertex_list[| _f_index+1 ];
        var _vz = _vertex_list[| _f_index+2 ];
        
        var _nx = 0;
        var _ny = 0;
        var _nz = 0;
        if ( ( floor( real( _n_index ) ) != -1 ) && ( ds_list_size( _normal_list ) >= 1 ) ) {
            var _n_index = 3*floor( real( _n_index ) );
            _nx = _normal_list[| _n_index   ];
            _ny = _normal_list[| _n_index+1 ];
            _nz = _normal_list[| _n_index+2 ];
        }
        
        var _tx = 0;
        var _ty = 0;
        if ( ( floor( real( _t_index)) != -1 ) && ( ds_list_size( _texture_list ) >= 1 ) ) {
            var _t_index = 2*floor( real( _t_index ) );
            _tx = _texture_list[| _t_index   ];
            _ty = _texture_list[| _t_index+1 ];
            if ( _flip_UVs ) _ty = 1 - _ty;
        }
        
        vertex_position_3d( _vbuff,   _vx, _vy, _vz );
        vertex_texcoord(    _vbuff,   _tx, _ty );
        vertex_colour(      _vbuff,   c_white, 1 );
        vertex_normal(      _vbuff,   _nx, _ny, _nz );
         
    }

vertex_end( _vbuff );



tr_list_destroy( _vertex_list  );
tr_list_destroy( _normal_list  );
tr_list_destroy( _texture_list );
tr_list_destroy( _faces_list   );

return _vbuff;