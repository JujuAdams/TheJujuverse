if ( room != rm_init ) {
    
    var _inst = tr_instance_create( 0, 0, obj_camera );
    _inst.look_pz_angle = -30;
    
    tr_instance_create_z( 50, 0, 0,   0,   obj_qubicle );
    
    var _inst = tr_instance_create_z( 0, 0, 50, 0, obj_light );
    _inst.range = 300;
    _inst.colour = c_white
}