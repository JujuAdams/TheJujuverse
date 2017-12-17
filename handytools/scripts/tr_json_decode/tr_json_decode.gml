///@param string
///@param note
///@param protected
//
// Original: 2017/01/21 @jujuadams

var _json_string = argument0;
var _note        = argument1;
var _protected   = argument2;

var _stack            = [];
var _stack_ds         = [];
var _stack_currentr_  = undefined;
var _stack_index      = -1;
var _stack_type       = undefined;

var _in_string        = false;
var _string_escape    = false;
var _string           = "";
var _string_map_mode  = JSON_MAP_KEY;
var _string_key       = "";
var _string_delimiter = undefined;
var _value            = undefined;

var _index = 0;
var _size = string_length( _json_string );
repeat( _size ) {
    _index++;
    
    var _char = string_copy( _json_string, _index, 1 );
    var _ord = ord( _char );
    
    if ( _in_string ) {
        
        if ( ( _ord == _string_delimiter ) && !_string_escape ) {
            
            if ( _stack_type == ds_type_list ) {
                ds_list_add( _stack_currentr_, _string );
            } else if ( _string_map_mode == JSON_MAP_KEY ) {
                _string_key = _string;
            } else {
                _stack_currentr_[? _string_key ] = _string;
                _string_key = "";
                _string_map_mode = JSON_MAP_KEY;
            }
            
            _in_string = false;
            _string = "";
            
        } else if ( ( _ord == 92 ) && !_string_escape ) {
            
            _string_escape = true;
            
        } else {
            
            _string_escape = false;
            _string += _char;
            
        }
        
    } else if ( _ord == 34 ) || ( _ord == 39 ) { // ' or "
        
        if ( _string != "" ) trace_error( false, "tr_json_decode: unexpected string (index=", _index, ")" );
        _string = "";
        _string_delimiter = _ord;
        _in_string = true;
        
    } else switch( _ord ) {
        
        case  44: // ,
        case  93: // ]
        case 125: // }
            
            if ( _string != "" ) {
                
                if ( _string == "true"  ) _string = "1" else if ( _string == "false" ) _string = "0";
                if ( _string == "null" ) _value = undefined else _value = real( _string );
                
                if ( _stack_type == ds_type_list ) {
                    ds_list_add( _stack_currentr_, _value );
                } else if ( _string_map_mode == JSON_MAP_VALUE ) {
                    _stack_currentr_[? _string_key ] = _value;
                    _string_key = "";
                    _string_map_mode = JSON_MAP_KEY;
                } else if ( _string_key != "" ) {
                    trace_error( false, "tr_json_decode: unexpected key:value pair termination (key=", _string_key, ", index=", _index, ")" );
                }
                
            }
            
            _string = "";
            
            if ( _ord != 44 ) { //Only use this code for list/map terminators
                
                if ( _stack_index > 0 ) {
                    _stack_index--;
                    _stack_currentr_ = _stack[_stack_index];
                    _stack_type = _stack_ds[_stack_index];
                    _string_map_mode = JSON_MAP_KEY;
                } else {
                    return _stack[0];
                }
                
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
            
            var _new = tr_list_create( _note + ((_stack_index==-1)? ":ROOT" : ":mem"), _protected );
            if ( _stack_currentr_ != undefined ) {
                if ( _stack_type == ds_type_map ) { //using previous stack type
                    tr_map_add_list( _stack_currentr_, _string_key, _new );
                    _string_key = "";
                } else {
					tr_list_add_list( _stack_currentr_, _new );
                }
            }
            
            _stack_currentr_ = _new;
            _stack_index++;
            _stack[_stack_index] = _stack_currentr_;
			_stack_ds[_stack_index] = ds_type_list;
            _stack_type = ds_type_list;
            
        break;
        
        case 123: // {
            
            var _new = tr_map_create( _note + ((_stack_index==-1)? ":ROOT" : ":mem"), _protected );
            if ( _stack_currentr_ != undefined ) {
                if ( _stack_type == ds_type_map ) { //using previous stack type
                    tr_map_add_map( _stack_currentr_, _string_key, _new );
                    _string_key = "";
                } else {
                    tr_list_add_map( _stack_currentr_, _new );
                }
            }
            
            _stack_currentr_ = _new;
            _stack_index++;
            _stack[_stack_index] = _stack_currentr_;
			_stack_ds[_stack_index] = ds_type_map;
            _stack_type = ds_type_map;
            _string_map_mode = JSON_MAP_KEY;
            
        break;
        
    }
    
    
}

trace_error( false, "tr_json_decode: unexpected end of string" );
return _stack[0];