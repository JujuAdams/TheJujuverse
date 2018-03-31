/// @description Master .obj model loading definitions

if ( DOTOBJ_ON ) {
    
    global.dotobj_total_time = 0;
    
    dotobj_load_async( "cube", "models\\old_cube.obj", global.vft_simple_3d,   false, false,   4, 0, 4,   1, 1, 1,   spr_tex_white, 0 );
    
    dotobj_load_async( "cassette 0", "models\\cassettes\\White_Cassette.obj" , global.vft_simple_3d,   false, true,   0, 0, 2,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "cassette 1", "models\\cassettes\\Black_Cassette.obj" , global.vft_simple_3d,   false, true,   0, 0, 2,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "cassette 4", "models\\cassettes\\Grey_Cassette.obj"  , global.vft_simple_3d,   false, true,   0, 0, 2,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "cassette 2", "models\\cassettes\\Yellow_Cassette.obj", global.vft_simple_3d,   false, true,   0, 0, 2,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "cassette 3", "models\\cassettes\\Red_Cassette.obj"   , global.vft_simple_3d,   false, true,   0, 0, 2,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "cassette 5", "models\\cassettes\\Blue_Cassette.obj"  , global.vft_simple_3d,   false, true,   0, 0, 2,   1, -1, 1,   UD, 0 );
    
    dotobj_load_async( "poof 0", "models\\poof\\Match_P_1.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "poof 1", "models\\poof\\Match_P_2.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "poof 2", "models\\poof\\Match_P_3.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "poof 3", "models\\poof\\Match_P_4.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "poof 4", "models\\poof\\Match_P_5.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "poof 5", "models\\poof\\Match_P_6.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    
    dotobj_load_async( "note black 0", "models\\notes\\Black_Note_1.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "note black 1", "models\\notes\\Black_Note_2.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "note black 2", "models\\notes\\Black_Note_3.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    
    dotobj_load_async( "note blue 0", "models\\notes\\Blue_Note_1.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "note blue 1", "models\\notes\\Blue_Note_2.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "note blue 2", "models\\notes\\Blue_Note_3.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    
    dotobj_load_async( "note red 0", "models\\notes\\Red_Note_1.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "note red 1", "models\\notes\\Red_Note_2.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "note red 2", "models\\notes\\Red_Note_3.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    
    dotobj_load_async( "note yellow 0", "models\\notes\\Yellow_Note_1.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "note yellow 1", "models\\notes\\Yellow_Note_2.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "note yellow 2", "models\\notes\\Yellow_Note_3.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    
    dotobj_load_async( "boomy"  , "models\\boomy\\Character.obj", global.vft_simple_3d,   false, true,   0.0, 0, 0,   2, -2, 2,   UD, 0 );
    dotobj_load_async( "boomy o", "models\\boomy\\Head_1.obj"   , global.vft_simple_3d,   false, true,   0.5, 2, 4,   2, -2, 2,   UD, 0 );
    dotobj_load_async( "boomy )", "models\\boomy\\Head_2.obj"   , global.vft_simple_3d,   false, true,   0.5, 2, 4,   2, -2, 2,   UD, 0 );
    dotobj_load_async( "boomy D", "models\\boomy\\Head_3.obj"   , global.vft_simple_3d,   false, true,   0.5, 2, 4,   2, -2, 2,   UD, 0 );
    
    dotobj_load_async( "0", "models\\digits\\0.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "1", "models\\digits\\1.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "2", "models\\digits\\2.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "3", "models\\digits\\3.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "4", "models\\digits\\4.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "5", "models\\digits\\5.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "6", "models\\digits\\6.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "7", "models\\digits\\7.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "8", "models\\digits\\8.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    dotobj_load_async( "9", "models\\digits\\9.obj", global.vft_simple_3d,   false, true,   0, 0, 0,   1, -1, 1,   UD, 0 );
    
}