///@param map
///@param delete_buffer

var _total_time = get_timer();

var _map           = argument0;
var _delete_buffer = argument1;

var _name          = _map[? "name"         ];
var _filename      = _map[? "filename"     ];
var _format        = _map[? "format"       ];
var _flip_normals  = _map[? "flip normals" ];
var _flip_UVs      = _map[? "flip UVs"     ];
var _offset_x      = _map[? "offset x"     ];
var _offset_y      = _map[? "offset y"     ];
var _offset_z      = _map[? "offset z"     ];
var _scale         = _map[? "scale"        ];
var _buffer        = _map[? "buffer"       ];

if ( _flip_normals ) _flip_normals = -1 else _flip_normals = 1;

var _vertex_list  = tr_list_create(); ds_list_add( _vertex_list,   0,0,0 );
var _normal_list  = tr_list_create(); ds_list_add( _normal_list,   0,0,0 );
var _texture_list = tr_list_create(); ds_list_add( _texture_list,  0,0   );
var _faces_list   = tr_list_create();

var _entry_count = 0;
var _first_character = true;
var _string = "";
var _value = 0;
var _fractional = 1;
var _negative = 1;
var _mode = 0;
var _data = false;
var _ord = undefined;

var _inner_time = get_timer();
var _total_read_time = 0;
var _size = buffer_get_size( _buffer );
trace( _filename, "    size=", _size );
repeat( _size ) {
	
	_ord = buffer_read( _buffer, buffer_u8 );
	
	if ( OBJ_LOAD_HALT_ON_NULL && ( _ord == 0 ) ) {
		trace( "obj_model_load_async_process: Halting on NULL read (", _filename, ")" );
		break;
	}
	
	if ( _ord == 32 ) || ( _ord == 13 ) {
		
		if ( _data ) {
			
			_value *= _negative*_fractional*10;
			
			switch( _mode ) {
				case 1:
					switch( _entry_count ) {
						case 0: ds_list_add( _vertex_list, ( _value + _offset_x ) * _scale ); break;
						case 1: ds_list_add( _vertex_list, ( _value + _offset_y ) * _scale ); break;
						case 2: ds_list_add( _vertex_list, ( _value + _offset_z ) * _scale ); break;
					}
					_entry_count++;
				break;
				case 2: ds_list_add( _normal_list , _value ); break;
				case 3: ds_list_add( _texture_list, _value ); break;
				case 4: ds_list_add( _faces_list, _string ); break;
			}
			
			_value = 0;
			_negative = 1;
			_fractional = 1;
			_data = false;
			_string = "";
			
		}
		
		if ( _ord == 13 ) {
			_entry_count = 0;
			_mode = 0;
			_first_character = true;
		}
		
	} else if ( _ord > 32 ) {
		
		if ( _ord >= 48 ) && ( _mode <= 57 ) {
			
			if ( _fractional < 1 ) _fractional *= 0.1;
			_value = 10*_value + (_ord-48);
			_data = true;
			
		} else if ( _mode == 4 ) {
			
			_data = true;
			_string += chr( _ord );
			
		} else if ( _ord == 45 ) {
			
			_negative = -1;
			_data = true;
			
		} else if ( _ord == 46 ) {
			
			_fractional = 0.1;
			_data = true;
			
		} else if ( _first_character ) {
			
			if ( _ord == 102 ) _mode = 4 else
			if ( _ord == 118 ) _mode = 1;
			
		} else if ( _mode == 1 ) {
			
			if ( _ord == 110 ) _mode = 2 else
			if ( _ord == 116 ) _mode = 3;
			
		}
	
		_first_character = false;
	
	}
	
}
_inner_time = get_timer() - _inner_time;
trace( _filename, "    inner time=", _inner_time,
               ", total read time=", _total_read_time,
                      ", vertices=", ds_list_size( _vertex_list ),
					   ", normals=", ds_list_size( _normal_list ),
				     ", texcoords=", ds_list_size( _texture_list ),
			   	         ", faces=", ds_list_size( _faces_list ) );



var _vbuff = tr_vertex_create_buffer( ".obj: " + _name, true );
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

_map[? "vertex buffer" ] = _vbuff;
if ( _delete_buffer ) {
	buffer_delete( _buffer );
	_map[? "buffer" ] = undefined;
}

_total_time = get_timer() - _total_time;
trace( _filename, "    total time=", _total_time );
global.obj_model_total_time += _total_time;

return _vbuff;