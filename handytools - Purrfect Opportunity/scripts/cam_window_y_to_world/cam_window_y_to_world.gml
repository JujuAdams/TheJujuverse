/// @param y

if ( !cam_exists() ) return argument0 / obj_render.scaling_y;
return camera_get_view_y( obj_camera.camera ) + argument0 / ( obj_camera.camera_zoom * obj_render.scaling_y );