///vertex_buffer_definitions()

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_texcoord();
vertex_format_add_colour();
vertex_format_add_normal();
global.vft_simple = vertex_format_end();

//Common
global.vbf_prism         = vertex_create_buffer_from_obj( "models/prism.obj"       , global.vft_simple,   false, false,   0, 2.2, 0, 12 );
global.vbf_cube          = vertex_create_buffer_from_obj( "models/old_cube.obj"    , global.vft_simple,   false, false,   4, 0, 4, 1 );
global.vbf_phone_base    = vertex_create_buffer_from_obj( "models/phonebase.obj"   , global.vft_simple,   false, false,   0, 0, 0, 5 );
global.vbf_phone_headset = vertex_create_buffer_from_obj( "models/phoneheadset.obj", global.vft_simple,   false, false,   0, 0, 0, 5 );
global.vbf_phone_rotary  = vertex_create_buffer_from_obj( "models/rotary.obj"      , global.vft_simple,   false, false,   0, 0, 0, 5 );
global.vbf_pedestal      = vertex_create_buffer_from_obj( "models/pedestal.obj"    , global.vft_simple,   false, false,   0, 0, 0, 2.77 ); //original height = 13.367, new height = 40
global.vbf_door          = vertex_create_buffer_from_obj( "models/door.obj"        , global.vft_simple,   false, false,   0, 0, 0, 2.77 );
global.vbf_chair         = vertex_create_buffer_from_obj( "models/chair.obj"       , global.vft_simple,   false, false,   0, 0, 0, 2.77 );
global.vbf_table         = vertex_create_buffer_from_obj( "models/table.obj"       , global.vft_simple,   false, false,   1, 0, -1, 16 );
global.vbf_hanging_bulb  = vertex_create_buffer_from_obj( "models/hanging_bulb.obj", global.vft_simple,   false, false,   0, 0, 0,  5 );
global.vbf_floor_lamp    = vertex_create_buffer_from_obj( "models/floor_lamp.obj"  , global.vft_simple,   false, false,   0, 0, 0, 10 );
global.vbf_bottle        = vertex_create_buffer_from_obj( "models/bottle.obj"      , global.vft_simple,   false, false,   0, 0, 0,  3 );
global.vbf_cup           = vertex_create_buffer_from_obj( "models/cup.obj"         , global.vft_simple,   false, false,   0, 0, 0,  1 );
global.vbf_couch         = vertex_create_buffer_from_obj( "models/couch.obj"       , global.vft_simple,   false, false,   0, 0, 0, 18 );
global.vbf_desk_lamp     = vertex_create_buffer_from_obj( "models/desk_lamp.obj"   , global.vft_simple,   false, false,   0, 0, 0,  4 );

//Spiral room
global.vbf_spiral1       = vertex_create_buffer_from_obj( "models/spiral.obj"      , global.vft_simple,   false, false,   1, 0, -1, 6 );
global.vbf_spiral2       = vertex_create_buffer_from_obj( "models/spiral2.obj"     , global.vft_simple,   false, false,   1, 0, -1, 5 );

//Mirror room
global.vbf_mirror_frame  = vertex_create_buffer_from_obj( "models/mirrorframe.obj" , global.vft_simple,   false, false,   0, 0, 0, 10 );
global.vbf_bookshelf     = vertex_create_buffer_from_obj( "models/bookshelf.obj"   , global.vft_simple,   false, false,   0, 0, 0, 18 );
global.vbf_open_book     = vertex_create_buffer_from_obj( "models/open_book.obj"   , global.vft_simple,   false, false,   0, 0, 0,  9 );

//Rope room
global.vbf_scissors      = vertex_create_buffer_from_obj( "models/scissors.obj"    , global.vft_simple,   false, false,   1, 0, -1, 3 );
global.vbf_rope          = vertex_create_buffer_from_obj( "models/rope.obj"        , global.vft_simple,   false, false,   0, 0, 0, 10 );
global.vbf_rope_cut      = vertex_create_buffer_from_obj( "models/rope_cut.obj"    , global.vft_simple,   false, false,   0, 0, 0, 10 );
global.vbf_rope_pole     = vertex_create_buffer_from_obj( "models/rope_pole.obj"   , global.vft_simple,   false, false,   0, 0, 0, 16 );

//Hammer room
global.vbf_vase1         = vertex_create_buffer_from_obj( "models/vase1.obj"       , global.vft_simple,   false, false,   1, 0, -1, 3 );
global.vbf_vase2         = vertex_create_buffer_from_obj( "models/vase2.obj"       , global.vft_simple,   false, false,   1, 0, -1, 3 );
global.vbf_hammer        = vertex_create_buffer_from_obj( "models/hammer.obj"      , global.vft_simple,   false, false,   1, 0, -1, 3 );
global.vbf_shard1        = vertex_create_buffer_from_obj( "models/shard1.obj"      , global.vft_simple,   false, false,   0, 0, 0,  3 );
global.vbf_shard2        = vertex_create_buffer_from_obj( "models/shard2.obj"      , global.vft_simple,   false, false,   0, 0, 0,  3 );
global.vbf_shard3        = vertex_create_buffer_from_obj( "models/shard3.obj"      , global.vft_simple,   false, false,   0, 0, 0,  3 );
global.vbf_shard4        = vertex_create_buffer_from_obj( "models/shard4.obj"      , global.vft_simple,   false, false,   0, 0, 0,  3 );

//Flowers room
global.vbf_dead_tree     = vertex_create_buffer_from_obj( "models/tree.obj"        , global.vft_simple,   false, false,   0, 0, 0, 10 );
global.vbf_flower_pot    = vertex_create_buffer_from_obj( "models/flowerpot.obj"   , global.vft_simple,   false, false,   1, 0, -1, 3 );
global.vbf_flower1       = vertex_create_buffer_from_obj( "models/flower1.obj"     , global.vft_simple,   false, false,   1, 0, -1, 3 );
global.vbf_flower2       = vertex_create_buffer_from_obj( "models/flower2.obj"     , global.vft_simple,   false, false,   1, 0, -1, 3 );
global.vbf_flower3       = vertex_create_buffer_from_obj( "models/flower3.obj"     , global.vft_simple,   false, false,   1, 0, -1, 3 );
global.vbf_flower4       = vertex_create_buffer_from_obj( "models/flower4.obj"     , global.vft_simple,   false, false,   1, 0, -1, 3 );
global.vbf_flower5       = vertex_create_buffer_from_obj( "models/flower5.obj"     , global.vft_simple,   false, false,   1, 0, -1, 3 );

//Ending
global.vbf_skele         = vertex_create_buffer_from_obj( "models/skele.obj"       , global.vft_simple,   false, false,   0, 0, 0, 2.5 );
global.vbf_chessboard    = vertex_create_buffer_from_obj( "models/chessboard.obj"  , global.vft_simple,   false, false,   0, 0, 0, 15 );
global.vbf_chess_king    = vertex_create_buffer_from_obj( "models/chess_king.obj"  , global.vft_simple,   false, false,   0, 0, 0,  1 );
global.vbf_chess_queen   = vertex_create_buffer_from_obj( "models/chess_queen.obj" , global.vft_simple,   false, false,   0, 0, 0,  1 );
global.vbf_chess_rook    = vertex_create_buffer_from_obj( "models/chess_rook.obj"  , global.vft_simple,   false, false,   0, 0, 0, 0.9 );

//These are unused
global.vbf_spiral3       = vertex_create_buffer_from_obj( "models/spiral3.obj"     , global.vft_simple,   false, false,   1, 0, -1, 6 );
global.vbf_coil          = vertex_create_buffer_from_obj( "models/coil.obj"        , global.vft_simple,   false, false,   1, 0, -1, 12 );
global.vbf_square_frame  = vertex_create_buffer_from_obj( "models/square_frame.obj", global.vft_simple,   false, false,   0, 0, 0,  1 );