/// @description TRACKER full dump of resource data

return concat( NL,
               "--------------------", NL,
	           " tracker dump", NL,
	           "--------------------", NL,
	           NL,
	           tr_map_dump(), NL,
	           tr_list_dump(), NL,
	           tr_grid_dump(), NL,
	           tr_surface_dump(), NL,
	           tr_vertex_dump(), NL,
	           tr_instance_dump(), NL,
	           "--------------------", NL,
	           " tracker dump ends", NL,
	           "--------------------", NL );