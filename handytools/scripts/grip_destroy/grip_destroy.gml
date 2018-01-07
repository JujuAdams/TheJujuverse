/// @description Destroys a GRIP camera and frees the attached surface
/// @param name

if ( !GRIP_ON ) {
    trace_error_q( false, "Can't execute script - turn GRIP on" );
    exit;
}

var _map = global.grip_cameras_map[? argument0 ];

var _surface        = _map[? "surface"        ];
var _depth_surface  = _map[? "depth surface"  ];
var _normal_surface = _map[? "normal surface" ];
tr_surface_set_protect( _surface       , false ); tr_surface_free( _surface        );
tr_surface_set_protect( _depth_surface , false ); tr_surface_free( _depth_surface  );
tr_surface_set_protect( _normal_surface, false ); tr_surface_free( _normal_surface );

camera_destroy( _map[? "camera" ] );
tr_map_destroy( _map );

ds_map_delete( global.grip_cameras_map, argument0 );
ds_list_find_and_replace( global.grip_view_list, argument0, undefined, true );