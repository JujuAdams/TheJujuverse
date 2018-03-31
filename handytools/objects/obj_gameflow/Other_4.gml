if ( room != rm_init ) {
    
    var _inst = tr_instance_create( 0, 120, obj_camera );
    _inst.z = 150;
    _inst.look_xy_angle =  90;
    _inst.look_pz_angle = -70;
    with( _inst ) event_perform( ev_step, ev_step_normal );
    
    tr_instance_create_z( 0, 0, 0,   0,   obj_cassette );
    
    var _inst = tr_instance_create_z( 0, 0, 50, 0, obj_light );
    _inst.range = 300;
    _inst.colour = c_white
}