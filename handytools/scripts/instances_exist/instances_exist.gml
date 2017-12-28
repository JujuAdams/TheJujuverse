/// @param obj
/// @param [obj...]

for( var _i = 0; _i < argument_count; _i++ ) if( !instance_exists( argument[_i] ) ) return false;
return true;