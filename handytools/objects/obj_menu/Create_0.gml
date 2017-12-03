escape_down_time = current_time;
var _list = tr_list_create();

global.mouse_locked = false;

credit_string = "";
ds_list_add( _list, "JUJU ADAMS  /  @jujuadams", "DANIEL MARQUES  /  @i_am_thirteen", "JAN VORISEK  /  @blokatt", "CHRIS 'TOPHER' ANSELMO" );
ds_list_shuffle( _list );
var _size = ds_list_size( _list );
for( var _i = 0; _i < _size; _i++ ) {
    credit_string += _list[| _i ] + NL;
}

ds_list_clear( _list );
thanks_string = "";
ds_list_add( _list, "ROSA", "JUPITER", "LEWIS", "ANDREW", "JOHN", "GIADA", "FEDERICO", "KYLE" );
ds_list_shuffle( _list );
var _size = ds_list_size( _list );
for( var _i = 0; _i < _size; _i++ ) {
    thanks_string += _list[| _i ] + NL;
}
tr_list_destroy( _list );

if ( !instance_exists( obj_camera ) ) {
    instruction_string = "press ENTER to start\npress ESCAPE to pause/quit";
} else {
    instruction_string = "press ENTER to continue\npress ESCAPE to pause/quit";
}

instruction_string += "#press F4 to toggle fullscreen";