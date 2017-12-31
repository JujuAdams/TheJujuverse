/// @description GRIP service initialisation

if ( GRIP_ON ) {
    
    trace_f( "GRIP" );
    global.grip_cameras_map = tr_map_create( "grip cameras", true );
    global.grip_view_list = tr_list_create( "grip views", true );
    global.grip_manual_list = tr_list_create( "grip manual", true );
    repeat( GRIP_VIEWS_END+1 ) ds_list_add( global.grip_view_list, undefined );
    
    global.grip_handling_manual = false;
    global.grip_current_manual = undefined;
    
}