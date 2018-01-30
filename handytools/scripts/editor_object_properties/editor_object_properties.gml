global.editor_object_properties_map = tr_map_create( "EDITOR object properties", true );

//Define a null object
var _list = tr_list_create( concat( "EDITOR <null> properties" ), true );
tr_map_add_list( global.editor_object_properties_map, "<null>", _list );
editor_object_default_properties( "<null>", _list );

//Define debug primitives
editor_object_declare_default( [ obj_sphere, obj_cone, obj_tri_a, obj_tri_b, obj_tri_c, obj_tri_sphere, obj_line_a, obj_line_b ] );

//Define a typical basic object
editor_object_add_property( obj_player_spawn, "rotation", E_EDITOR_PROPERTY.FLOAT, 0, "image_angle" );

//Basically all objects in the game inherit from the player spawner
editor_object_copy_property( obj_player_spawn, [ obj_door_spawn, obj_phone, obj_dummy_phone, obj_cube,
                                                 obj_chair, obj_table, obj_pedestal, obj_bottle, obj_cup, obj_couch, obj_bookshelf, obj_open_book,
                                                 obj_floor_lamp, obj_desk_lamp, obj_hanging_bulb,
                                                 obj_spiral1, obj_spiral1_ceiling, obj_spiral2, obj_spiral2_ceiling,
                                                 obj_mirror_frame, obj_dummy_mirror_frame,
                                                 obj_scissors, obj_rope, obj_rope_pole,
                                                 obj_vase1, obj_vase2, obj_hammer,
                                                 obj_flower_pot, obj_flower1, obj_flower2, obj_flower3, obj_flower4, obj_flower5, obj_dead_tree,
                                                 obj_chessboard, obj_chess_king, obj_chess_queen, obj_chess_rook,
                                                 obj_chess_king_alt, obj_chess_queen_alt, obj_chess_rook_alt,
                                                 obj_skele ] );

//...apart from lights which have additional properties
editor_object_add_property( obj_light, "colour", E_EDITOR_PROPERTY.COLOUR, c_white, UD );
editor_object_add_property( obj_light, "range" , E_EDITOR_PROPERTY.FLOAT ,     200, UD );

return global.editor_object_properties_map;