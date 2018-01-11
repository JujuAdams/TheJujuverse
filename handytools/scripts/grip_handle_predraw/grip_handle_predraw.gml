/// @description Manually renders out GRIP cameras that are active and unbound
///              This function does not respect depth!
///              
///              If you're using Draw Begin/Draw End events to set e.g. shader states then
///              this script should be called in the object that is setting that draw state.

if ( !GRIP_ON ) return undefined;

//Keep view grip surfaces alive
var _size = ds_list_size( global.grip_view_list );
for( var _i = GRIP_VIEWS_START; _i <= GRIP_VIEWS_END; _i++ ) {
    var _name = global.grip_view_list[| _i ];
    if ( _name == undefined ) continue;
    grip_set_surface( _name, tr_surface_check_auto( grip_get_surface( _name ) ) );
    view_surface_id[_i] = grip_get_surface( _name );
}

//Only bother faffing around with matrices if we have to
var _size = ds_list_size( global.grip_manual_list );
if ( _size > 0 ) {
    
    global.grip_handling_manual = true;
    var _old_view = matrix_get( matrix_view );
    var _old_proj = matrix_get( matrix_projection );
    var _my_id    = id;
    
    for( var _i = 0; _i < _size; _i++ ) {
        global.grip_current_manual = global.grip_manual_list[| _i ];
        
        //Render out manual grips
        grip_surface_set_target( global.grip_current_manual );
        camera_apply( grip_get_camera( global.grip_current_manual ) );
        
        event_perform( ev_draw, ev_draw_begin );
        with( all ) if ( id != _my_id ) event_perform( ev_draw, ev_draw_begin );
        with( all ) event_perform( ev_draw, 0 );
        with( all ) if ( id != _my_id ) event_perform( ev_draw, ev_draw_end );
        event_perform( ev_draw, ev_draw_end );
            
        surface_reset_target();
    
    }

    global.grip_handling_manual = false;
    matrix_set( matrix_view, _old_view );
    matrix_set( matrix_projection, _old_proj );
    
}