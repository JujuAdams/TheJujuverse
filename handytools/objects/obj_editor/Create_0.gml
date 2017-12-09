enum E_EDITOR_PAGE { HOME, PLACE, INSTANCES,  }

persistent = true;

show_window = false;
window_has_set_size = false;
window_has_set_columns = false;
window_width = 940;
window_height = 700;
window_page = 0;
window_name = "Editor";

preview_surface = tr_surface_create( 600, 600 );
preview_object = undefined;
preview_instance = noone;

selected_object = undefined;

object_list = tr_list_create();
ds_list_add( object_list, obj_player_spawn       );
ds_list_add( object_list, obj_door_spawn         );
ds_list_add( object_list, obj_light              );
ds_list_add( object_list, ""                     );

ds_list_add( object_list, obj_phone              );
ds_list_add( object_list, obj_dummy_phone        );
ds_list_add( object_list, obj_mirror_frame       );
ds_list_add( object_list, obj_dummy_mirror_frame );
ds_list_add( object_list, ""                     );

ds_list_add( object_list, obj_vase1              );
ds_list_add( object_list, obj_vase2              );
ds_list_add( object_list, obj_hammer             );
ds_list_add( object_list, ""                     );

ds_list_add( object_list, obj_scissors           );
ds_list_add( object_list, obj_rope               );
ds_list_add( object_list, obj_rope_pole          );
ds_list_add( object_list, ""                     );

ds_list_add( object_list, obj_spiral1            );
ds_list_add( object_list, obj_spiral1_ceiling    );
ds_list_add( object_list, obj_spiral2            );
ds_list_add( object_list, obj_spiral2_ceiling    );
ds_list_add( object_list, ""                     );

ds_list_add( object_list, obj_flower_pot         );
ds_list_add( object_list, obj_flower1            );
ds_list_add( object_list, obj_flower2            );
ds_list_add( object_list, obj_flower3            );
ds_list_add( object_list, obj_flower4            );
ds_list_add( object_list, obj_flower5            );
ds_list_add( object_list, ""                     );

ds_list_add( object_list, obj_floor_lamp         );
ds_list_add( object_list, obj_desk_lamp          );
ds_list_add( object_list, obj_hanging_bulb       );
ds_list_add( object_list, ""                     );

ds_list_add( object_list, obj_chair              );
ds_list_add( object_list, obj_table              );
ds_list_add( object_list, obj_pedestal           );
ds_list_add( object_list, obj_bottle             );
ds_list_add( object_list, obj_cup                );
ds_list_add( object_list, obj_couch              );
ds_list_add( object_list, obj_bookshelf          );
ds_list_add( object_list, obj_open_book          );
ds_list_add( object_list, obj_dead_tree          );
ds_list_add( object_list, ""                     );

ds_list_add( object_list, obj_chessboard         );
ds_list_add( object_list, obj_chess_king         );
ds_list_add( object_list, obj_chess_queen        );
ds_list_add( object_list, obj_chess_rook         );
ds_list_add( object_list, obj_chess_king_alt     );
ds_list_add( object_list, obj_chess_queen_alt    );
ds_list_add( object_list, obj_chess_rook_alt     );
ds_list_add( object_list, obj_skele              );