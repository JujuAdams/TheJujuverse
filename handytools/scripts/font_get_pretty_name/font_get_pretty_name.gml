///@param font

if ( argument0 == undefined ) return "<nothing!>";
return string_replace_all( string_replace( font_get_name( argument0 ), "fnt_", "" ), "_", " " )