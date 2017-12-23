/*
	For default options/controls, see options_init() and options_default_controls()
	All possible inputs need to be defined here
*/

trace_f( "CONTROLS (forced)" );

var _list = tr_list_create( "control_master_list", true );
ds_list_add( _list, "left"      );
ds_list_add( _list, "right"     );
ds_list_add( _list, "fire"      );
ds_list_add( _list, "talk"      );
ds_list_add( _list, "alt left"  );
ds_list_add( _list, "alt right" );
ds_list_add( _list, "alt fire"  );
ds_list_add( _list, "back"      );
/*
	We do not include "mouse" or "sensitivity" as these are handled differently (and presumed common to all games)
*/
global.control_try_lock_mouse = true;
global.control_master_list = _list;