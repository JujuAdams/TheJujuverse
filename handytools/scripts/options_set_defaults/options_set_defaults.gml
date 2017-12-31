/// @description Sets the current option values to the default values

for( var _key = ds_map_find_first( global.options_defaults ); _key != undefined; _key = ds_map_find_next( global.options_defaults, _key ) ) {
    global.options_json[? _key ] = global.options_defaults[? _key ];
}