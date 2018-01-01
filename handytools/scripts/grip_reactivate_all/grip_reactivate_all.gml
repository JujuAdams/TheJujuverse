/// @description Rebinds all GRIP cameras that were previously active to GM's native views
///              This function should be called on Room Start to keep GRIP cameras active.

if ( !GRIP_ON ) {
    trace_error_q( false, "Can't execute script - turn GRIP on" );
    exit;
}

for( var _i = GRIP_VIEWS_START; _i <= GRIP_VIEWS_END; _i++ ) {
    var _name = global.grip_view_list[| _i ];
    if ( _name == undefined ) continue;
    grip_activate_on_view( _name, _i );
}