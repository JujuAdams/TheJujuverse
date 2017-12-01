/// @param x

if ( !cam_exists() ) return argument0 / obj_render.scaling_x;
return camera_get_view_x( obj_camera.camera ) + argument0 / ( obj_camera.camera_zoom * obj_render.scaling_x );