/// @description CONTROL service initialisation

/*
    For default options/controls, see options_init() and options_default_controls()
    All possible inputs need to be defined here
*/

trace_f( "CONTROLS (forced)" );

global.control_master_list = tr_list_create( "control_master_list", true );
controls_init_controls();
global.control_master_total = ds_list_size( global.control_master_list );