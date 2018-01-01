/// @description Gets the aspect ratio of a GRIP camera
/// @param name

if ( !GRIP_ON ) return surface_get_aspect( application_surface );

return grip_get_width( argument0 )/grip_get_height( argument0 );