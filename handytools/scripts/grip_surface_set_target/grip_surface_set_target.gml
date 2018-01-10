/// @param grip

if ( !GRIP_ON ) return undefined;

var _grip = argument0;

//Keep manual grip surfaces alive
var _surface        = tr_surface_check_auto( grip_get_surface(        _grip ) );
var _depth_surface  = tr_surface_check_auto( grip_get_depth_surface(  _grip ) );
var _normal_surface = tr_surface_check_auto( grip_get_normal_surface( _grip ) );
grip_set_surface(        _grip, _surface        )
grip_set_depth_surface(  _grip, _depth_surface  );
grip_set_normal_surface( _grip, _normal_surface );

//Set grip surface targets
if ( !ALLOW_MRT ) || ( ( _depth_surface == undefined ) && ( _normal_surface == undefined ) ) {
    surface_set_target( _surface );
} else {
    var _j = 0;
                                        surface_set_target_ext( _j++, _surface        );
    if ( _depth_surface  != undefined ) surface_set_target_ext( _j++, _depth_surface  );
    if ( _normal_surface != undefined ) surface_set_target_ext( _j++, _normal_surface );
}