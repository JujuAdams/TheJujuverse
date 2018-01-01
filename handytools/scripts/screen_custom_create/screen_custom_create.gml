//Set up out mirror handling variables
global.mirror_count         = 0;
global.mirror_click_count   = 0;
global.mirror_render        = false;
global.click_through_mirror = false;

//Make some GRIP cameras
grip_create( "mirror click0", 960, 720, false, true );
grip_create( "mirror click1", 960, 720, false, true );
grip_create( "mirror0"      , 960, 720, false, true );
grip_create( "mirror1"      , 960, 720, false, true );
grip_create( "mirror2"      , 960, 720, false, true );
grip_create( "mirror3"      , 960, 720, false, true );