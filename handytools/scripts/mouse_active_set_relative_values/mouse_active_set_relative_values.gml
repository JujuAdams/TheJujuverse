///mouse_active_set_relative_values()

if ( mouse_selected ) {
    mouse_relative_x = x - obj_camera.x;
    mouse_relative_y = y - obj_camera.y;
    mouse_relative_z = z - obj_camera.z;
    mouse_relative_angle = image_angle - point_direction( x, y, obj_camera.x, obj_camera.y );
}