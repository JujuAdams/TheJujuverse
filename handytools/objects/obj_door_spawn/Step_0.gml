if ( current_time > door_spawn_time ) and ( !instance_exists( obj_door ) ) {
    instance_create_z( x, y, z, image_angle, obj_door );
}