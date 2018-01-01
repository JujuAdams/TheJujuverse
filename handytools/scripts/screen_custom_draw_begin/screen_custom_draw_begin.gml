//Custom GRIP rendering states
switch( grip_get_current() ) {
    
    case "mirror0": //Render out mirrors
    case "mirror1":
    case "mirror2":
    case "mirror3":
        global.mirror_render = true;
        s_shader_begin( SCREEN_3D_SHADER );
    break;
    
    case "mirror click0": //Render out mirror click detection
    case "mirror click1":
        global.screen_click_render = true;
        global.mirror_render = true;
    break;
    
}