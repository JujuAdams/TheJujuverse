if ( SCREEN_3D ) screen_3d_start();
if ( SCREEN_BACKGROUND_COLOUR != undefined ) draw_clear( SCREEN_BACKGROUND_COLOUR );

s_shader_begin( grip_get_shader( grip_current() ) );
grip_surface_set_target( grip_current(), true );

switch( grip_current() ) {
    
    case "3d": //What the player sees
        //This check fixes a bug with GM automatically submitting a blank vertex buffer to a shader in the wrong format
        //gpu_set_blendenable( false );
        gpu_set_blendmode_ext( bm_one, bm_zero );
        if ( !instance_exists( obj_par_3d ) ) s_shader_end();
    break;
    
    case "click": //A screenspace click detection render. Only used for forward rendering
        global.screen_click_render = true;
    break;
    
}

//Call custom script
if ( script_exists( SCREEN_DRAW_BEGIN_SCRIPT ) ) script_execute( SCREEN_DRAW_BEGIN_SCRIPT );