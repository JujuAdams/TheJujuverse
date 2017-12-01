/// @param x
/// @param y
/// @param object

if ( ERROR_DEPRECIATED_SCRIPTS ) trace_error( false, "instance_create() is a depreciated script. use instance_create_depth() instead" );

return instance_create_depth( argument0, argument1, 0, argument2 );