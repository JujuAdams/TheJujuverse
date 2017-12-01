/// @description text_test_for_click( json, hyperlink name )
/// @function text_test_for_click
/// @param  json
/// @param  hyperlink name 
//
//  April 2017
//  Juju Adams
//  julian.adams@email.com
//  @jujuadams
//
//  This code and engine are provided under the Creative Commons "Attribution - NonCommerical - ShareAlike" international license.
//  https://creativecommons.org/licenses/by-nc-sa/4.0/

var _json = argument0;
var _name = argument1;

if ( _json < 0 ) return false;

var _hyperlinks = _json[? "hyperlinks" ];
var _hyperlink_map = _hyperlinks[? _name ];

return _hyperlink_map[? "clicked" ];
