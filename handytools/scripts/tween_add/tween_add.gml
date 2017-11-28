///@param do
///@param start_time
///@param length

if ( variable_instance_exists( id, "tween_count" ) ) return tween_define( TWEEN_NEW, argument0, argument1, argument2 );
return tween_define( 0, argument0, argument1, argument2 );
