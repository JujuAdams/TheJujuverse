/// @description Master .obj model loading definitions

if ( DOTOBJ_ON ) {
    
    global.dotobj_total_time = 0;
    
    dotobj_load_async( "deer 0", "models\\deer.obj"        , global.vft_simple_3d,   false,  true,   0, 0  ,  0,  1   ,   undefined            , 0 );
    dotobj_load_async( "cube"  , "models\\old_cube.obj"    , global.vft_simple_3d,   false, false,   4, 0  ,  4,  1   ,   spr_tex_white        , 0 );
    
}