///@param json
///@param shader
///@param smoothness

var _json       = argument[0];
var _shader     = ((argument_count < 2) || (argument[1] == undefined))? shd_scribble_basic : argument[1];
var _smoothness = ((argument_count < 3) || (argument[2] == undefined))?                  0 : argument[2];

_json[? "shader"            ] = _shader;
_json[? "shader smoothness" ] = _smoothness;