/// @description Master .obj model loading definitions

if ( DOTOBJ_ON ) {
    
    global.dotobj_total_time = 0;

    dotobj_load_async( "cube"           , "models\\old_cube.obj"    , global.vft_simple_3d,   false, false,   4, 0  ,  4,  1   ,   spr_tex_white        , 0 );
    dotobj_load_async( "qubicle"        , "models\\qubicle.obj"     , global.vft_simple_3d,   false,  true,   0, 0  ,  0,  1   ,   UD                   , 0 );
    dotobj_load_async( "prism"          , "models\\prism.obj"       , global.vft_simple_3d,   false, false,   0, 2.2,  0, 12   ,   spr_tex_white        , 0 );
    dotobj_load_async( "door"           , "models\\door.obj"        , global.vft_simple_3d,   false, false,   0, 0  ,  0,  2.77,   spr_tex_door         , 0 );                                                                                                               
    dotobj_load_async( "phonebase"      , "models\\phonebase.obj"   , global.vft_simple_3d,   false, false,   0, 0  ,  0,  5   ,   spr_tex_phone_base   , 0 );
    dotobj_load_async( "phoneheadset"   , "models\\phoneheadset.obj", global.vft_simple_3d,   false, false,   0, 0  ,  0,  5   ,   spr_tex_phone_headset, 0 );
    dotobj_load_async( "phonerotary"    , "models\\rotary.obj"      , global.vft_simple_3d,   false, false,   0, 0  ,  0,  5   ,   spr_tex_phone_rotary , 0 );
    dotobj_load_async( "pedestal"       , "models\\pedestal.obj"    , global.vft_simple_3d,   false, false,   0, 0  ,  0,  2.77,   spr_tex_pedestal     , 0 ); //original height = 13.367, new height = 40
    dotobj_load_async( "chair"          , "models\\chair.obj"       , global.vft_simple_3d,   false, false,   0, 0  ,  0,  2.77,   spr_tex_chair        , 0 );
    dotobj_load_async( "table"          , "models\\table.obj"       , global.vft_simple_3d,   false, false,   1, 0  , -1, 16   ,   spr_tex_table        , 0 );
    dotobj_load_async( "hanging_bulb"   , "models\\hanging_bulb.obj", global.vft_simple_3d,   false, false,   0, 0  ,  0,  5   ,   spr_tex_hanging_bulb , 0 );
    dotobj_load_async( "floor_lamp"     , "models\\floor_lamp.obj"  , global.vft_simple_3d,   false, false,   0, 0  ,  0, 10   ,   spr_tex_floor_lamp   , 0 );
    dotobj_load_async( "bottle"         , "models\\bottle.obj"      , global.vft_simple_3d,   false, false,   0, 0  ,  0,  3   ,   spr_tex_bottle       , 0 );
    dotobj_load_async( "cup"            , "models\\cup.obj"         , global.vft_simple_3d,   false, false,   0, 0  ,  0,  1   ,   spr_tex_cup          , 0 );
    dotobj_load_async( "couch"          , "models\\couch.obj"       , global.vft_simple_3d,   false, false,   0, 0  ,  0, 18   ,   spr_tex_couch        , 0 );
    dotobj_load_async( "desk_lamp"      , "models\\desk_lamp.obj"   , global.vft_simple_3d,   false, false,   0, 0  ,  0,  4   ,   spr_tex_desk_lamp    , 0 );                                      
    dotobj_load_async( "spiral1"        , "models\\spiral.obj"      , global.vft_simple_3d,   false, false,   1, 0  , -1,  6   ,   spr_tex_spiral       , 0 );
    dotobj_load_async( "spiral2"        , "models\\spiral2.obj"     , global.vft_simple_3d,   false, false,   1, 0  , -1,  5   ,   spr_tex_spiral2      , 0 );                                          
    dotobj_load_async( "mirror_frame"   , "models\\mirrorframe.obj" , global.vft_simple_3d,   false, false,   0, 0  ,  0, 10   ,   spr_tex_mirror_frame , 0 );
    dotobj_load_async( "bookshelf"      , "models\\bookshelf.obj"   , global.vft_simple_3d,   false, false,   0, 0  ,  0, 18   ,   spr_tex_bookshelf    , 0 );
    dotobj_load_async( "open_book"      , "models\\open_book.obj"   , global.vft_simple_3d,   false, false,   0, 0  ,  0,  9   ,   spr_tex_open_book    , 0 );                                          
    dotobj_load_async( "scissors"       , "models\\scissors.obj"    , global.vft_simple_3d,   false, false,   1, 0  , -1,  3   ,   spr_tex_red          , 0 );
    dotobj_load_async( "rope"           , "models\\rope.obj"        , global.vft_simple_3d,   false, false,   0, 0  ,  0, 10   ,   spr_tex_rope         , 0 );
    dotobj_load_async( "rope_cut"       , "models\\rope_cut.obj"    , global.vft_simple_3d,   false, false,   0, 0  ,  0, 10   ,   spr_tex_rope         , 0 );
    dotobj_load_async( "rope_pole"      , "models\\rope_pole.obj"   , global.vft_simple_3d,   false, false,   0, 0  ,  0, 16   ,   spr_tex_rope_pole    , 0 );                                          
    dotobj_load_async( "vase1"          , "models\\vase1.obj"       , global.vft_simple_3d,   false, false,   1, 0  , -1,  3   ,   spr_tex_vase1        , 0 );
    dotobj_load_async( "vase2"          , "models\\vase2.obj"       , global.vft_simple_3d,   false, false,   1, 0  , -1,  3   ,   spr_tex_vase2        , 0 );
    dotobj_load_async( "hammer"         , "models\\hammer.obj"      , global.vft_simple_3d,   false, false,   1, 0  , -1,  3   ,   spr_tex_hammer       , 0 );
    dotobj_load_async( "shard1"         , "models\\shard1.obj"      , global.vft_simple_3d,   false, false,   0, 0  ,  0,  3   ,   UD                   , 0 );
    dotobj_load_async( "shard2"         , "models\\shard2.obj"      , global.vft_simple_3d,   false, false,   0, 0  ,  0,  3   ,   UD                   , 0 );
    dotobj_load_async( "shard3"         , "models\\shard3.obj"      , global.vft_simple_3d,   false, false,   0, 0  ,  0,  3   ,   UD                   , 0 );
    dotobj_load_async( "shard4"         , "models\\shard4.obj"      , global.vft_simple_3d,   false, false,   0, 0  ,  0,  3   ,   UD                   , 0 );                                          
    dotobj_load_async( "dead_tree"      , "models\\tree.obj"        , global.vft_simple_3d,   false, false,   0, 0  ,  0, 10   ,   spr_tex_red          , 0 );
    dotobj_load_async( "flowerpot"      , "models\\flowerpot.obj"   , global.vft_simple_3d,   false, false,   1, 0  , -1,  3   ,   spr_tex_flowerpot    , 0 );
    dotobj_load_async( "flower1"        , "models\\flower1.obj"     , global.vft_simple_3d,   false, false,   1, 0  , -1,  3   ,   spr_tex_flower1      , 0 );
    dotobj_load_async( "flower2"        , "models\\flower2.obj"     , global.vft_simple_3d,   false, false,   1, 0  , -1,  3   ,   spr_tex_flower2      , 0 );
    dotobj_load_async( "flower3"        , "models\\flower3.obj"     , global.vft_simple_3d,   false, false,   1, 0  , -1,  3   ,   spr_tex_flower3      , 0 );
    dotobj_load_async( "flower4"        , "models\\flower4.obj"     , global.vft_simple_3d,   false, false,   1, 0  , -1,  3   ,   spr_tex_flower4      , 0 );
    dotobj_load_async( "flower5"        , "models\\flower5.obj"     , global.vft_simple_3d,   false, false,   1, 0  , -1,  3   ,   spr_tex_flower5      , 0 );                                          
    dotobj_load_async( "skele"          , "models\\skele.obj"       , global.vft_simple_3d,   false, false,   0, 0  ,  0,  2.5 ,   spr_tex_skele        , 0 );
    
    dotobj_load_async( "chessboard"     , "models\\chessboard.obj"  , global.vft_simple_3d,   false, false,   0, 0  ,  0, 15   ,   spr_tex_chessboard   , 0 );
    dotobj_load_async( "chess_king"     , "models\\chess_king.obj"  , global.vft_simple_3d,   false, false,   0, 0  ,  0,  1   ,   spr_tex_chess_green  , 0 );
    dotobj_load_async( "chess_queen"    , "models\\chess_queen.obj" , global.vft_simple_3d,   false, false,   0, 0  ,  0,  1   ,   spr_tex_chess_pink   , 0 );
    dotobj_load_async( "chess_rook"     , "models\\chess_rook.obj"  , global.vft_simple_3d,   false, false,   0, 0  ,  0,  0.9 ,   spr_tex_chess_pink   , 0 );
    dotobj_load_async( "chess_king_alt" , "models\\chess_king.obj"  , global.vft_simple_3d,   false, false,   0, 0  ,  0,  1   ,   spr_tex_chess_pink   , 0 );
    dotobj_load_async( "chess_queen_alt", "models\\chess_queen.obj" , global.vft_simple_3d,   false, false,   0, 0  ,  0,  1   ,   spr_tex_chess_green  , 0 );
    dotobj_load_async( "chess_rook_alt" , "models\\chess_rook.obj"  , global.vft_simple_3d,   false, false,   0, 0  ,  0,  0.9 ,   spr_tex_chess_green  , 0 );
    
    dotobj_load_async( "spiral3"        , "models\\spiral3.obj"     , global.vft_simple_3d,   false, false,   1, 0  , -1,  6   ,   UD                   , 0 );
    dotobj_load_async( "coil"           , "models\\coil.obj"        , global.vft_simple_3d,   false, false,   1, 0  , -1, 12   ,   UD                   , 0 );
    dotobj_load_async( "square_frame"   , "models\\square_frame.obj", global.vft_simple_3d,   false, false,   0, 0  ,  0,  1   ,   UD                   , 0 );

}