///vertex_buffer_definitions()

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_texcoord();
vertex_format_add_colour();
vertex_format_add_normal();
global.vft_simple = vertex_format_end();

global.obj_map      = tr_map_create( "<.obj map>"     , true );
global.obj_load_map = tr_map_create( "<.obj load map>", true );

load_obj_async( "prism"       , "models/prism.obj"       , global.vft_simple,   false, false,   0, 2.2, 0, 12 );
load_obj_async( "old_cube"    , "models/old_cube.obj"    , global.vft_simple,   false, false,   4, 0, 4, 1 );
load_obj_async( "phonebase"   , "models/phonebase.obj"   , global.vft_simple,   false, false,   0, 0, 0, 5 );
load_obj_async( "phoneheadset", "models/phoneheadset.obj", global.vft_simple,   false, false,   0, 0, 0, 5 );
load_obj_async( "rotary"      , "models/rotary.obj"      , global.vft_simple,   false, false,   0, 0, 0, 5 );
load_obj_async( "pedestal"    , "models/pedestal.obj"    , global.vft_simple,   false, false,   0, 0, 0, 2.77 ); //original height = 13.367, new height = 40
load_obj_async( "door"        , "models/door.obj"        , global.vft_simple,   false, false,   0, 0, 0, 2.77 );
load_obj_async( "chair"       , "models/chair.obj"       , global.vft_simple,   false, false,   0, 0, 0, 2.77 );
load_obj_async( "table"       , "models/table.obj"       , global.vft_simple,   false, false,   1, 0, -1, 16 );
load_obj_async( "hanging_bulb", "models/hanging_bulb.obj", global.vft_simple,   false, false,   0, 0, 0,  5 );
load_obj_async( "floor_lamp"  , "models/floor_lamp.obj"  , global.vft_simple,   false, false,   0, 0, 0, 10 );
load_obj_async( "bottle"      , "models/bottle.obj"      , global.vft_simple,   false, false,   0, 0, 0,  3 );
load_obj_async( "cup"         , "models/cup.obj"         , global.vft_simple,   false, false,   0, 0, 0,  1 );
load_obj_async( "couch"       , "models/couch.obj"       , global.vft_simple,   false, false,   0, 0, 0, 18 );
load_obj_async( "desk_lamp"   , "models/desk_lamp.obj"   , global.vft_simple,   false, false,   0, 0, 0,  4 );									  
load_obj_async( "spiral"      , "models/spiral.obj"      , global.vft_simple,   false, false,   1, 0, -1, 6 );
load_obj_async( "spiral2"     , "models/spiral2.obj"     , global.vft_simple,   false, false,   1, 0, -1, 5 );										  
load_obj_async( "mirrorframe" , "models/mirrorframe.obj" , global.vft_simple,   false, false,   0, 0, 0, 10 );
load_obj_async( "bookshelf"   , "models/bookshelf.obj"   , global.vft_simple,   false, false,   0, 0, 0, 18 );
load_obj_async( "open_book"   , "models/open_book.obj"   , global.vft_simple,   false, false,   0, 0, 0,  9 );										  
load_obj_async( "scissors"    , "models/scissors.obj"    , global.vft_simple,   false, false,   1, 0, -1, 3 );
load_obj_async( "rope"        , "models/rope.obj"        , global.vft_simple,   false, false,   0, 0, 0, 10 );
load_obj_async( "rope_cut"    , "models/rope_cut.obj"    , global.vft_simple,   false, false,   0, 0, 0, 10 );
load_obj_async( "rope_pole"   , "models/rope_pole.obj"   , global.vft_simple,   false, false,   0, 0, 0, 16 );										  
load_obj_async( "vase1"       , "models/vase1.obj"       , global.vft_simple,   false, false,   1, 0, -1, 3 );
load_obj_async( "vase2"       , "models/vase2.obj"       , global.vft_simple,   false, false,   1, 0, -1, 3 );
load_obj_async( "hammer"      , "models/hammer.obj"      , global.vft_simple,   false, false,   1, 0, -1, 3 );
load_obj_async( "shard1"      , "models/shard1.obj"      , global.vft_simple,   false, false,   0, 0, 0,  3 );
load_obj_async( "shard2"      , "models/shard2.obj"      , global.vft_simple,   false, false,   0, 0, 0,  3 );
load_obj_async( "shard3"      , "models/shard3.obj"      , global.vft_simple,   false, false,   0, 0, 0,  3 );
load_obj_async( "shard4"      , "models/shard4.obj"      , global.vft_simple,   false, false,   0, 0, 0,  3 );										  
load_obj_async( "tree"        , "models/tree.obj"        , global.vft_simple,   false, false,   0, 0, 0, 10 );
load_obj_async( "flowerpot"   , "models/flowerpot.obj"   , global.vft_simple,   false, false,   1, 0, -1, 3 );
load_obj_async( "flower1"     , "models/flower1.obj"     , global.vft_simple,   false, false,   1, 0, -1, 3 );
load_obj_async( "flower2"     , "models/flower2.obj"     , global.vft_simple,   false, false,   1, 0, -1, 3 );
load_obj_async( "flower3"     , "models/flower3.obj"     , global.vft_simple,   false, false,   1, 0, -1, 3 );
load_obj_async( "flower4"     , "models/flower4.obj"     , global.vft_simple,   false, false,   1, 0, -1, 3 );
load_obj_async( "flower5"     , "models/flower5.obj"     , global.vft_simple,   false, false,   1, 0, -1, 3 );										  
load_obj_async( "skele"       , "models/skele.obj"       , global.vft_simple,   false, false,   0, 0, 0, 2.5 );
load_obj_async( "chessboard"  , "models/chessboard.obj"  , global.vft_simple,   false, false,   0, 0, 0, 15 );
load_obj_async( "chess_king"  , "models/chess_king.obj"  , global.vft_simple,   false, false,   0, 0, 0,  1 );
load_obj_async( "chess_queen" , "models/chess_queen.obj" , global.vft_simple,   false, false,   0, 0, 0,  1 );
load_obj_async( "chess_rook"  , "models/chess_rook.obj"  , global.vft_simple,   false, false,   0, 0, 0, 0.9 );								  
load_obj_async( "spiral3"     , "models/spiral3.obj"     , global.vft_simple,   false, false,   1, 0, -1, 6 );
load_obj_async( "coil"        , "models/coil.obj"        , global.vft_simple,   false, false,   1, 0, -1, 12 );
load_obj_async( "square_frame", "models/square_frame.obj", global.vft_simple,   false, false,   0, 0, 0,  1 );