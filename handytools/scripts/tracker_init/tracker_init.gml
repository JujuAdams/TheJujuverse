/// @description TRACKER service initialisation

trace_f( TRACKER_ON? "TRACKER" : "TRACKER (limited)" );

if ( TRACKER_ON ) {
	
	//maps and lists get mixed up due some weirdness with OoO
	global.tracker_maps           = ds_list_create();
	global.tracker_maps_origin    = ds_map_create();
	global.tracker_maps_note      = ds_map_create();
	global.tracker_maps_protect   = ds_map_create();
	global.tracker_maps_callstack = ds_map_create();
	
	global.tracker_lists           = ds_list_create();
	global.tracker_lists_origin    = tr_map_create( "<lists, origin>"   , true );
	global.tracker_lists_note      = tr_map_create( "<lists, note>"     , true );
	global.tracker_lists_protect   = tr_map_create( "<lists, protect>"  , true );
	global.tracker_lists_callstack = tr_map_create( "<lists, callstack>", true );
	
	__tr_list_register( global.tracker_maps , "<maps>" , true );
	__tr_map_register( global.tracker_maps_origin   , "<maps, origin>"   , true );
	__tr_map_register( global.tracker_maps_note     , "<maps, note>"     , true );
	__tr_map_register( global.tracker_maps_protect  , "<maps, protect>"  , true );
	__tr_map_register( global.tracker_maps_callstack, "<maps, callstack>", true );
	
	__tr_list_register( global.tracker_lists, "<lists>", true );
	
	//JSON handling
	global.tracker_map_nested_maps   = tr_map_create( "<map nested maps>"  , true );
	global.tracker_map_nested_lists  = tr_map_create( "<map nested lists>" , true );
	global.tracker_list_nested_maps  = tr_map_create( "<list nested maps>" , true );
	global.tracker_list_nested_lists = tr_map_create( "<list nested lists>", true );
	
	//pre-register these maps in preparation for having lists added to them
	global.tracker_map_nested_lists[? global.tracker_map_nested_maps   ] = noone;
	global.tracker_map_nested_lists[? global.tracker_map_nested_lists  ] = noone;
	global.tracker_map_nested_lists[? global.tracker_list_nested_maps  ] = noone;
	global.tracker_map_nested_lists[? global.tracker_list_nested_lists ] = noone;
	
	
	
	//grids
	global.tracker_grids           = tr_list_create( "<grids>"           , true );
	global.tracker_grids_origin    = tr_map_create(  "<grids, origin>"   , true );
	global.tracker_grids_note      = tr_map_create(  "<grids, note>"     , true );
	global.tracker_grids_protect   = tr_map_create(  "<grids, protect>"  , true );
	global.tracker_grids_callstack = tr_map_create(  "<grids, callstack>", true );
	
	//vertex buffers
	global.tracker_vbuffs           = tr_list_create( "<vbuffs>"           , true );
	global.tracker_vbuffs_origin    = tr_map_create(  "<vbuffs, origin>"   , true );
	global.tracker_vbuffs_note      = tr_map_create(  "<vbuffs, note>"     , true );
	global.tracker_vbuffs_protect   = tr_map_create(  "<vbuffs, protect>"  , true );
	global.tracker_vbuffs_callstack = tr_map_create(  "<vbuffs, callstack>", true );
	
	//instances
	global.tracker_instances           = tr_list_create( "<instances>"           , true );
	global.tracker_instances_origin    = tr_map_create(  "<instances, origin>"   , true );
	global.tracker_instances_note      = tr_map_create(  "<instances, note>"     , true );
	global.tracker_instances_protect   = tr_map_create(  "<instances, protect>"  , true );
	global.tracker_instances_callstack = tr_map_create(  "<instances, callstack>", true );
	
}

//Surfaces
global.tracker_surfaces        = tr_list_create( "<surfaces>"        , true );
global.tracker_surfaces_width  = tr_map_create(  "<surfaces, width>" , true );
global.tracker_surfaces_height = tr_map_create(  "<surfaces, height>", true );

if ( TRACKER_ON ) {
	global.tracker_surfaces_origin    = tr_map_create( "<surfaces, origin>"   , true );
	global.tracker_surfaces_note      = tr_map_create( "<surfaces, note>"     , true );
	global.tracker_surfaces_protect   = tr_map_create( "<surfaces, protect>"  , true );
	global.tracker_surfaces_callstack = tr_map_create( "<surfaces, callstack>", true );
}