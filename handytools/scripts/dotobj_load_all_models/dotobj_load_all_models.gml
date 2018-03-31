/// @description Master .obj model loading definitions

if ( DOTOBJ_ON ) {
    
    global.dotobj_total_time = 0;
    
    dotobj_load_async( "cube"  , "models\\old_cube.obj"    , global.vft_simple_3d,   false, false,   4, 0  ,  4,  1   ,   spr_tex_white        , 0 );
    
    dotobj_load_async( "cassette 0", "models\\cassettes\\White_Cassette.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1,   UD, 0 );
    dotobj_load_async( "cassette 1", "models\\cassettes\\Black_Cassette.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1,   UD, 0 );
    dotobj_load_async( "cassette 2", "models\\cassettes\\Red_Cassette.obj"  , global.vft_simple_3d,   false, true,   0, 0, 0,   1,   UD, 0 );
    dotobj_load_async( "cassette 3", "models\\cassettes\\Grey_Cassette.obj" , global.vft_simple_3d,   false, true,   0, 0, 0,   1,   UD, 0 );
    dotobj_load_async( "cassette 4", "models\\cassettes\\Blue_Cassette.obj" , global.vft_simple_3d,   false, true,   0, 0, 0,   1,   UD, 0 );
    
}