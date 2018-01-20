#define sr_ensure_singleton
///@function sr_ensure_singleton(_singleton_name)
///@desc called `with` object to be singleton - ensure the name passed is a singleton, will call instance destroy on a different id
///@param {String} _singleton_name   global name to use for the singleton
///@returns {Boolean} false if an existing instance is destroyed - be sure to check CleanUp / Destroys
gml_pragma("forceinline");

var _singleton_name = argument[0];
var existed = false;
if (variable_global_exists(_singleton_name)) {
  var existsId = variable_global_get(_singleton_name);
  if (existsId != undefined && existsId != id && instance_exists(existsId)) {
    instance_destroy(existsId);
    existed = true;
  }
}

variable_global_set(_singleton_name, id);
return !existed;

#define sr_ensure_font
///@functino rousr_ensure_font(_font_index)
///@desc cache the current font
///@param _font_index   font resource index
gml_pragma("global", "global.__rousr_set_font = undefined;");
gml_pragma("forceinline");

var _font_index = argument0;
if (_font_index != global.__rousr_set_font) {
  draw_set_font(_font_index);
  global.__rousr_set_font = _font_index;
}

#define sr_ensure_color
///function rousr_ensure_color(_color)
///@desc cache the current color
///@param {Real} _color   color value to set
gml_pragma("global", "global.__rousr_set_color = undefined;");
gml_pragma("forceinline");
var _color = argument0;

if (_color != global.__rousr_set_color) {
  draw_set_color(_color);
  global.__rousr_set_color = _color;
}

#define sr_color_hex
///@function sr_color_hex(_hex_color)
///@desc [Convert the RGB to BGR](https://forum.yoyogames.com/index.php?threads/why-are-hex-colours-bbggrr-instead-of-rrggbb.16325/#post-105309)
///@param _hex_color   color in $RRGGBB
///@returns {Real} color formatted in BBGGRR for GML
var _hex_color = argument0;
return (_hex_color & $FF) << 16 | (_hex_color & $FF00) | (_hex_color & $FF0000) >> 16;

#define sr_color_glsl
///@function sr_color_glsl(_color, [_out_array])
///@desc convert a color to an array float values [0.0 - 1.0]
///@param {Real} _color          color to convert
///@param {Array} [_out_array]   optional out array to not allocate a new array
///@returns {Array} array of colors in float range
var _color     = argument[0],
    _out_array = argument_count > 1 ? argument[1] : array_create(3);

_out_array[@ 0] = color_get_red(  _color)/255;
_out_array[@ 1] = color_get_green(_color)/255;
_out_array[@ 2] = color_get_blue( _color)/255;

return _out_array;


#define sr_next_pot
///@function sr_next_pot(_val)
///@desc return the nearest power of 2 for a given number (integer)
///@param {Real} _va   note: if a float is given, its rounded up to 'fit' the float into the POT
///@returns {Real} nearest power of 2 to given integer
var _val = argument0;

var npot = ceil(log2(ceil(_val)));
npot = power(2, npot);

return npot;

#define sr_shadow_text
///@function sr_shadow_text(_x, _y, _text, _fg, _bg, [_xoff=1], [_yoff=1])
///@desc Draw text with a shadow
///@param {Real}   _x          x position to draw text
///@param {Real}   _y          y position to draw text
///@param {String} _text       text to draw
///@param {Real}   _fg         foreground color
///@param {Real}   _bg         background (shadow) color
///@param {Real}   [_xoff=1]   x offset for the shadow
///@param {Real}   [_yoff=1]   y offset for the shadow
var _x       = argument[0];
var _y       = argument[1];
var _text    = argument[2];
var _fg      = argument[3];
var _bg      = argument[4];
var _xoff    = argument_count > 5 ? argument[5] : 1;
var _yoff    = argument_count > 6 ? argument[6] : 1;

sr_ensure_color(_bg);
draw_text(_x + _xoff, _y + _yoff, _text);

sr_ensure_color(_fg);
draw_text(_x, _y, _text);

#define sr_outline_text
///@function sr_outline_text(_x, _y, _text, _fg, _bg)
///@desc draw text with an oultine
///@param {Real} _x        x position for text
///@param {Real} _y        y position for text
///@param {String} _text   text to draw
///@param {Real} _fg       foreground color
///@param {Real} _bg       background color
var _x    = argument0,
    _y    = argument1,
    _text = argument2,
    _fg   = argument3,
    _bg   = argument4;

sr_ensure_color(_bg);
for (var i = -1; i <= 1; i++)
 for (var j = -1; j <=1; j++)
	draw_text(_x+i, _y+j, _text);

sr_ensure_color(_fg);
draw_text(_x, _y, _text);


#define sr_error
///@function sr_error([_system], _error_text)
///@desc Error wrapper (eventual logging system)
///@param {String} [_system]   system name for logging
///@param {String} _text       error message
var _sys = argument_count > 1 ? argument[0] : undefined;
var _txt = argument_count > 1 ? argument[1] : argument[0];

if (_sys != undefined)
  _txt = "[ERROR] " + _sys + " :: " + _txt;
else 
  _txt = "[ERROR] :: " + _txt;

// Potentially show error dialog
show_debug_message(_txt);

#define sr_log
///@function sr_log([_system], _error_text)
///@desc Log wrapper (eventual logging system)
///@param {String} [_system]   system name for logging
///@param {String} _text       log message
var _sys = argument_count > 1 ? argument[0] : undefined;
var _txt = argument_count > 1 ? argument[1] : argument[0];

if (_sys != undefined)
  _txt = "[LOG] " + _sys + " :: " + _txt;
else 
  _txt = "[LOG] :: " + _txt;

show_debug_message(_txt);

#define sr_execute
///@description rousr_execute - call a function with variadic argument support
///@param {Real}  _script_index - script to execute
///@param {Array} _params       - parameters to call, in an array
///@param {Real}  [paramCount]  - if you've already got the count ready, pass it, or else it's computed.
///@returns {*} return value from script call
var _func = argument[0];
var _params = argument[1];
var _paramCount = argument_count > 2 ? argument[2] : array_length_1d(_params);

var ret = undefined;
switch (_paramCount) {
	case 0:  ret = script_execute(_func); break;
	case 1:  ret = script_execute(_func, _params[0]); break;
	case 2:  ret = script_execute(_func, _params[0], _params[1]); break;
	case 3:  ret = script_execute(_func, _params[0], _params[1], _params[2]); break;
	case 4:  ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3]); break;
	case 5:  ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4]); break;
	case 6:  ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5]); break;
	case 7:  ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5], _params[6]); break;
	case 8:  ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5], _params[6], _params[7]); break;
	case 9:  ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5], _params[6], _params[7], _params[8]); break;
	case 10: ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5], _params[6], _params[7], _params[8], _params[9]); break;
	case 11: ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5], _params[6], _params[7], _params[8], _params[9], _params[10]); break;
	case 12: ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5], _params[6], _params[7], _params[8], _params[9], _params[10], _params[11]); break;
	case 13: ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5], _params[6], _params[7], _params[8], _params[9], _params[10], _params[11], _params[12]); break;
	case 14: ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5], _params[6], _params[7], _params[8], _params[9], _params[10], _params[11], _params[12], _params[13]); break;
	case 15: ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5], _params[6], _params[7], _params[8], _params[9], _params[10], _params[11], _params[12], _params[13], _params[14]); break;
  case 16: ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5], _params[6], _params[7], _params[8], _params[9], _params[10], _params[11], _params[12], _params[13], _params[14], _params[15]); break;
  case 17: ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5], _params[6], _params[7], _params[8], _params[9], _params[10], _params[11], _params[12], _params[13], _params[14], _params[15], _params[16]); break;
  case 18: ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5], _params[6], _params[7], _params[8], _params[9], _params[10], _params[11], _params[12], _params[13], _params[14], _params[15], _params[16], _params[17]); break;
  case 19: ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5], _params[6], _params[7], _params[8], _params[9], _params[10], _params[11], _params[12], _params[13], _params[14], _params[15], _params[16], _params[17], _params[18]); break;
  case 20: ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5], _params[6], _params[7], _params[8], _params[9], _params[10], _params[11], _params[12], _params[13], _params[14], _params[15], _params[16], _params[17], _params[18], _params[19]); break;
  case 21: ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5], _params[6], _params[7], _params[8], _params[9], _params[10], _params[11], _params[12], _params[13], _params[14], _params[15], _params[16], _params[17], _params[18], _params[19], _params[20]); break;
  case 22: ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5], _params[6], _params[7], _params[8], _params[9], _params[10], _params[11], _params[12], _params[13], _params[14], _params[15], _params[16], _params[17], _params[18], _params[19], _params[20], _params[21]); break;
  case 23: ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5], _params[6], _params[7], _params[8], _params[9], _params[10], _params[11], _params[12], _params[13], _params[14], _params[15], _params[16], _params[17], _params[18], _params[19], _params[20], _params[21], _params[22]); break;
  case 24: ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5], _params[6], _params[7], _params[8], _params[9], _params[10], _params[11], _params[12], _params[13], _params[14], _params[15], _params[16], _params[17], _params[18], _params[19], _params[20], _params[21], _params[22], _params[23]); break;
  case 25: ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5], _params[6], _params[7], _params[8], _params[9], _params[10], _params[11], _params[12], _params[13], _params[14], _params[15], _params[16], _params[17], _params[18], _params[19], _params[20], _params[21], _params[22], _params[23], _params[24]); break;
  case 26: ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5], _params[6], _params[7], _params[8], _params[9], _params[10], _params[11], _params[12], _params[13], _params[14], _params[15], _params[16], _params[17], _params[18], _params[19], _params[20], _params[21], _params[22], _params[23], _params[24], _params[25]); break;
  case 27: ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5], _params[6], _params[7], _params[8], _params[9], _params[10], _params[11], _params[12], _params[13], _params[14], _params[15], _params[16], _params[17], _params[18], _params[19], _params[20], _params[21], _params[22], _params[23], _params[24], _params[25], _params[26]); break;
  case 28: ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5], _params[6], _params[7], _params[8], _params[9], _params[10], _params[11], _params[12], _params[13], _params[14], _params[15], _params[16], _params[17], _params[18], _params[19], _params[20], _params[21], _params[22], _params[23], _params[24], _params[25], _params[26], _params[27]); break;
  case 29: ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5], _params[6], _params[7], _params[8], _params[9], _params[10], _params[11], _params[12], _params[13], _params[14], _params[15], _params[16], _params[17], _params[18], _params[19], _params[20], _params[21], _params[22], _params[23], _params[24], _params[25], _params[26], _params[27], _params[28]); break;
  case 30: ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5], _params[6], _params[7], _params[8], _params[9], _params[10], _params[11], _params[12], _params[13], _params[14], _params[15], _params[16], _params[17], _params[18], _params[19], _params[20], _params[21], _params[22], _params[23], _params[24], _params[25], _params[26], _params[27], _params[28], _params[29]); break;
  case 31: ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5], _params[6], _params[7], _params[8], _params[9], _params[10], _params[11], _params[12], _params[13], _params[14], _params[15], _params[16], _params[17], _params[18], _params[19], _params[20], _params[21], _params[22], _params[23], _params[24], _params[25], _params[26], _params[27], _params[28], _params[29], _params[30]); break;
  case 32: ret = script_execute(_func, _params[0], _params[1], _params[2], _params[3], _params[4], _params[5], _params[6], _params[7], _params[8], _params[9], _params[10], _params[11], _params[12], _params[13], _params[14], _params[15], _params[16], _params[17], _params[18], _params[19], _params[20], _params[21], _params[22], _params[23], _params[24], _params[25], _params[26], _params[27], _params[28], _params[29], _params[30], _params[31]); break;
};

return ret;

#define sr_aabb_contains_line
///@function sr_aabb_contains_line(_line_x1, _line_y1, line_x2, line_y2, _rect_min_x, rect_min_y, _rect_max_x, _rect_max_y)
///@desc courtesy of https://stackoverflow.com/questions/1585525/how-to-find-the-intersection-point-between-a-line-and-a-rectangle
///@param {Real} _line_x1
///@param {Real} _line_y1
///@param {Real} _line_x2
///@param {Real} _line_y2
///@param {Real} _rect_min_x
///@param {Real} _rect_min_y
///@param {Real} _rect_max_x
///@param {Real} _rect_max_y
///@returns {Boolean} true if an aabb and line intersect
var _x1   = argument0,
    _y1   = argument1,
    _x2   = argument2,
    _y2   = argument3,
    _minX = argument4,
    _minY = argument5,
    _maxX = argument6,
    _maxY = argument7;

// Completely outside.
if ((_x1 <= _minX && _x2 <= _minX) || (_y1 <= _minY && _y2 <= _minY) || 
    (_x1 >= _maxX && _x2 >= _maxX) || (_y1 >= _maxY && _y2 >= _maxY))
    return false;

var m = (_y2 - _y1) / (_x2 - _x1);

var yy = m * (_minX - _x1) + _y1;
if (yy > _minY && yy < _maxY) 
  return true;

yy = m * (_maxX - _x1) + _y1;
if (yy > _minY && yy < _maxY) 
  return true;

xx = (_minY - _y1) / m + _x1;
if (xx > _minX && xx < _maxX) 
  return true;

xx = (_maxY - _y1) / m + _x1;
if (xx > _minX && xx < _maxX) 
  return true;

return false;

#define __extrousrcore_script_index
///@function __extrousrcore_script_index(ext_script_index)
///@desc Returns the actual runtime script index because YYG doesn't know how to do that apparently
///@param {Real} ext_script_index
///@extensionizer { "docs": false, "export": true} 
///@returns {Real} script_index
gml_pragma("forceinline")
gml_pragma("global", "global.__extrousrcore_script_index_lookup = array_create(0);global.__extrousrcore_script_index_lookup[@ sr_ensure_singleton] = asset_get_index(\"sr_ensure_singleton\");global.__extrousrcore_script_index_lookup[@ sr_ensure_font] = asset_get_index(\"sr_ensure_font\");global.__extrousrcore_script_index_lookup[@ sr_ensure_color] = asset_get_index(\"sr_ensure_color\");global.__extrousrcore_script_index_lookup[@ sr_color_hex] = asset_get_index(\"sr_color_hex\");global.__extrousrcore_script_index_lookup[@ sr_color_glsl] = asset_get_index(\"sr_color_glsl\");global.__extrousrcore_script_index_lookup[@ sr_next_pot] = asset_get_index(\"sr_next_pot\");global.__extrousrcore_script_index_lookup[@ sr_shadow_text] = asset_get_index(\"sr_shadow_text\");global.__extrousrcore_script_index_lookup[@ sr_outline_text] = asset_get_index(\"sr_outline_text\");global.__extrousrcore_script_index_lookup[@ sr_error] = asset_get_index(\"sr_error\");global.__extrousrcore_script_index_lookup[@ sr_log] = asset_get_index(\"sr_log\");global.__extrousrcore_script_index_lookup[@ sr_execute] = asset_get_index(\"sr_execute\");global.__extrousrcore_script_index_lookup[@ sr_aabb_contains_line] = asset_get_index(\"sr_aabb_contains_line\");");

var _index = argument0;return global.__extrousrcore_script_index_lookup[@ _index];
