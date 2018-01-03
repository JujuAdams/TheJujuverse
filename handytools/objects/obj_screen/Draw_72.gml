if ( SCREEN_3D ) screen_3d_start();
if ( SCREEN_BACKGROUND_COLOUR != undefined ) draw_clear( SCREEN_BACKGROUND_COLOUR );

switch( grip_current() ) {
    
    case "3d": //What the player sees
        //This check fixes a bug with GM automatically submitting a blank vertex buffer to a shader in the wrong format
        if ( instance_exists( obj_par_3d ) ) s_shader_begin( SCREEN_3D_SHADER );
    break;
    
    case "click": //A screenspace click detection render
        global.screen_click_render = true;
    break;
    
}

//Call custom script
if ( script_exists( SCREEN_DRAW_BEGIN_SCRIPT ) ) script_execute( SCREEN_DRAW_BEGIN_SCRIPT );