///@param object_index

if ( argument0 == undefined ) return "<nothing!>";
return string_replace_all( string_replace( object_get_name( argument0 ), "obj_", "" ), "_", " " )