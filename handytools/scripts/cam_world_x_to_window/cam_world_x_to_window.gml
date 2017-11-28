/// @param x

if ( !cam_exists() ) return argument0 * obj_render.scaling_x;
return ( argument0 - camera_get_view_x( obj_camera.camera ) ) * obj_camera.camera_zoom * obj_render.scaling_x;