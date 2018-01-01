/// @description Nicely formats a JSON string so it's easier to read. including alphabetising dictionaries
///              This script is... a bit of a mess
///              Juju apologises. It's a good'un though
///
///              With thanks to yal.cc
///
/// @param string
/// @param [indent_size]
/// @param [newline_char]
/// @param [map_spacing]

var _json_string  = argument[0];
var _indent_size  = ((argument_count>1) && (argument[1]!=undefined))? argument[1] : 4;
var _newline_char = ((argument_count>2) && (argument[2]!=undefined))? argument[2] : chr(13) + chr(10);
var _map_space    = ((argument_count>3) && (argument[3]!=undefined))? argument[3] : 1;

var _stack                = [];
var _stack_type           = [];
var _stack_index          = [];
var _stack_current        = undefined;
var _stack_depth          = -1;
var _stack_current_type   = undefined;

var _alpha_list           = ds_list_create();
var _ds_string            = "";
var _indent_string        = "";
repeat( _indent_size ) _indent_string += " ";

var _in_real              = false;
var _real_string_dot      = 0;
var _real_string_last_sig = 1;
                
var _in_string            = false;
var _string_escape        = false;
var _string               = "";
var _string_map_mode      = JSON_MAP_KEY;
var _string_key           = "";
var _string_delimiter     = undefined;

var _i, _size, _key;
var _index = 0;
var _size = string_length( _json_string );
repeat( _size ) {
    _index++;
    
    var _char = string_copy( _json_string, _index, 1 );
    var _ord = ord( _char );
    
    if ( _in_string ) {
        #region STRING HANDLING
        
        if ( ( _ord == _string_delimiter ) && !_string_escape ) {
            
            //Add a string to the current data structure
            if ( _stack_current_type == ds_type_list ) {
                ds_list_add( _stack_current, "\"" + _string + "\"" );
            } else if ( _string_map_mode == JSON_MAP_KEY ) {
                _string_key = _string;
            } else {
                _stack_current[? _string_key ] = "\"" + _string + "\"";
                _string_key = "";
                _string_map_mode = JSON_MAP_KEY;
            }
            
            _in_string = false;
            _in_real = false;
            _string = "";
            
        } else if ( ( _ord == 92 ) && !_string_escape ) {
            
            _string_escape = true;
            
        } else {
            
            if ( _ord == 34 ) _char = "\\\""; //Handle escaping double quotes
            _string_escape = false;
            _string += _char;
            
        }
        
        #endregion
    } else switch( _ord ) {
        
        case  34: // "
        case  39: // '
            if ( _string != "" ) trace_error( false, "json_prettify_alphabetise: unexpected string (index=", _index, ")" );
            _string = "";
            _string_delimiter = _ord;
            _in_string = true;
        break;
        
        case  44: // ,
        case  93: // ]
        case 125: // }
            
            //Put this string into the current data structure
            if ( _string != "" ) {
                
                if ( _in_real ) {
                    _in_real = false;
                    if ( _real_string_dot >= _real_string_last_sig ) _real_string_last_sig = _real_string_dot-1;
                    _string = string_copy( _string, 1, _real_string_last_sig );
                }
                
                if ( _stack_current_type == ds_type_list ) {
                    ds_list_add( _stack_current, _string );
                } else if ( _string_map_mode == JSON_MAP_VALUE ) {
                    _stack_current[? _string_key ] = _string;
                    _string_key = "";
                    _string_map_mode = JSON_MAP_KEY;
                } else if ( _string_key != "" ) {
                    trace_error( false, "json_prettify_alphabetise: unexpected key:value pair termination (key=", _string_key, ", index=", _index, ")" );
                }
            }
            
            _string = "";
            
            if ( _ord != 44 ) { //Ignore if this character is a comma
                #region TURN DATA STRUCTURE INTO STRING
                
                _ds_string = "";
                
                //Compress down a list into a string
                if ( _ord == 93 ) && ( _stack_current_type == ds_type_list ) {
                    
                    _ds_string += "[";
                    
                    var _size = ds_list_size( _stack_current );
                    if ( _size > 0 ) {
                        
                        _ds_string += _newline_char;
                        
                        for( _i = 0; _i < _size; _i++ ) {
                            repeat( _stack_depth+1 ) _ds_string += _indent_string;
                            _ds_string += string( _stack_current[| _i ] ) + ((_i == _size-1)? "":",") + _newline_char;
                        }
                        
                        repeat( _stack_depth ) _ds_string += _indent_string;
                        
                    }
                    
                    _ds_string += "]";
                    
                //Compress down a map into a string
                } else if ( _ord == 125 ) && ( _stack_current_type == ds_type_map ) {
                    
                    _ds_string += "{";
                    
                    var _size = ds_map_size( _stack_current );
                    if ( _size > 0 ) {
                        
                        _ds_string += _newline_char;
                        
                        //Build alphabetisation list
                        ds_list_clear( _alpha_list );
                        var _i = 0;
                        for( _key = ds_map_find_first( _stack_current ); _key != undefined; _key = ds_map_find_next( _stack_current, _key ) ) _alpha_list[| _i++ ] = _key;
                        ds_list_sort( _alpha_list, true );
                    
                        //Actually form up the string
                        for( var _i = 0; _i < _size; _i++ ) {
                            repeat( _stack_depth+1 ) _ds_string += _indent_string;
                            _key = _alpha_list[| _i ];
                            if ( is_string( _key ) ) _ds_string += "\"" + _key + "\"" else _ds_string += string( _key );
                            _ds_string += ":";
                            repeat( _map_space ) _ds_string += " ";
                            _ds_string += _stack_current[? _key ] + ((_i == _size-1)? "":",") + _newline_char;
                        }
                        
                        repeat( _stack_depth ) _ds_string += _indent_string;
                        
                    }
                    
                    _ds_string += "}";
                    
                } else {
                    
                    trace_error( false, "json_prettify_alphabetise: unexpected terminator" );
                    
                }
                
                if ( _stack_depth > 0 ) {
                    #region MOVE UP STACK
                    
                    //Destroy our old data structure
                    if ( _stack_current_type == ds_type_list ) ds_list_destroy( _stack_current ) else ds_map_destroy( _stack_current );
                    var _prev_ds   = _stack[_stack_depth-1];
                    var _prev_type = _stack_type[_stack_depth-1];
                    
                    //Overwrite our old index with a string
                    if ( _prev_type == ds_type_list ) {
                        _prev_ds[| _stack_index[_stack_depth] ] = _ds_string;
                    } else {
                        _prev_ds[? _stack_index[_stack_depth] ] = _ds_string;
                    }
                    
                    _stack_depth--;
                    _stack_current = _prev_ds;
                    _stack_current_type = _prev_type;
                    _string_map_mode = JSON_MAP_KEY;
                    
                    #endregion
                } else {
                    #region RETURN FINAL STRING
                    
                    //Compress down a list into a string
                    if ( _stack_current_type == ds_type_list ) {
                    
                        _ds_string = "[";
                        
                        var _size = ds_list_size( _stack_current );
                        if ( _size > 0 ) {
                            _ds_string += _newline_char;
                            for( _i = 0; _i < _size; _i++ ) _ds_string += _indent_string + string( _stack_current[| _i ] ) + ((_i == _size-1)? "":",") + _newline_char;
                        }
                        
                        _ds_string += "]";
                        ds_list_destroy( _stack_current );
                    
                    //Compress down a map into a string
                    } else {
                        
                        _ds_string = "{";
                        
                        var _size = ds_map_size( _stack_current );
                        if ( _size > 0 ) {
                            _ds_string += _newline_char;
                            
                            //Build alphabetisation list
                            ds_list_clear( _alpha_list );
                            var _i = 0;
                            for( _key = ds_map_find_first( _stack_current ); _key != undefined; _key = ds_map_find_next( _stack_current, _key ) ) _alpha_list[| _i++ ] = _key;
                            ds_list_sort( _alpha_list, true );
                            
                            //Actually form up the string
                            for( var _i = 0; _i < _size; _i++ ) {
                                _key = _alpha_list[| _i ];
                                _ds_string += _indent_string;
                                if ( is_string( _key ) ) _ds_string += "\"" + _key + "\"" else _ds_string += string( _key );
                                _ds_string += ":";
                                repeat( _map_space ) _ds_string += " ";
                                _ds_string += _stack_current[? _key ] + ((_i == _size-1)? "":",") + _newline_char;
                            }
                            
                        }
                        
                        _ds_string += "}";
                        ds_map_destroy( _stack_current );
                        
                    }
                    
                    ds_list_destroy( _alpha_list );
                    return _ds_string;
                    
                    #endregion
                }
                
                #endregion
            }
            
        break;
        
        case  45: // -
        case  46: // .
        case  48: // 0
        case  49: // 1
        case  50: // 2
        case  51: // 3
        case  52: // 4
        case  53: // 5
        case  54: // 6
        case  55: // 7
        case  56: // 8
        case  57: // 9
            
            _string += _char;
            
            if ( _in_real ) {
                if ( _ord == 46 ) {
                    _real_string_dot = string_length( _string );
                    _real_string_last_sig = _real_string_dot;
                } else if ( _real_string_dot == 0 ) || ( _ord != 48 ) {
                    _real_string_last_sig++;
                }
            } else {
                _in_real = true;
                _real_string_dot = 0;
                _real_string_last_sig = 1;
            }
            
        break;
        
        case 116: // t
        case 114: // r
        case 117: // u
        case 101: // e
        case 102: // f
        case  97: // a
        case 108: // l
        case 115: // s
        case 110: // n
            _string += _char;
        break;
        
        case  84: // T
        case  82: // R
        case  85: // U
        case  69: // E
        case  70: // F
        case  65: // A
        case  76: // L
        case  83: // S
        case  78: // N
            _string += chr( _ord + 32 ); //lowercase
        break;
        
        case 58: // :
            _string_map_mode = JSON_MAP_VALUE;
        break;
        
        case 91: // [
            
            var _new = ds_list_create();
            if ( _stack_current != undefined ) {
                if ( _stack_current_type == ds_type_map ) { //using previous stack type
                    ds_map_add_list( _stack_current, _string_key, _new );
                    _stack_index[_stack_depth+1] = _string_key;
                    _string_key = "";
                } else {
                    ds_list_add( _stack_current, _new );
                    ds_list_mark_as_list( _stack_current, ds_list_size( _stack_current )-1 );
                    _stack_index[_stack_depth+1] = ds_list_size( _stack_current )-1;
                }
            }
            
            _stack_current = _new;
            _stack_depth++;
            _stack[_stack_depth]       = _stack_current;
            _stack_type[_stack_depth]  = ds_type_list;
            _stack_current_type        = ds_type_list;
            
        break;
        
        case 123: // {
            
            var _new = ds_map_create();
            if ( _stack_current != undefined ) {
                if ( _stack_current_type == ds_type_map ) { //using previous stack type
                    ds_map_add_map( _stack_current, _string_key, _new );
                    _stack_index[_stack_depth+1] = _string_key;
                    _string_key = "";
                } else {
                    ds_list_add( _stack_current, _new );
                    ds_list_mark_as_map( _stack_current, ds_list_size( _stack_current )-1 );
                    _stack_index[_stack_depth+1] = ds_list_size( _stack_current )-1;
                }
            }
            
            _stack_current = _new;
            _stack_depth++;
            _stack[_stack_depth]       = _stack_current;
            _stack_type[_stack_depth]  = ds_type_map;
            _stack_current_type        = ds_type_map;
            _string_map_mode           = JSON_MAP_KEY;
            
        break;
        
    }
    
    
}

trace_error( false, "json_prettify_alphabetise: unexpected end of string" );
ds_list_destroy( _alpha_list );
return _ds_string;