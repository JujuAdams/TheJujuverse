/// @description SCREEN service initialisation

if ( SCREEN_ON ) {
    global.app_surf_w          = DEFAULT_APP_SURF_W;
    global.app_surf_h          = DEFAULT_APP_SURF_H;
    global.screen_do_dither    = false && SCREEN_ALLOW_DITHER;
    global.screen_do_lighting  = true && SCREEN_ALLOW_LIGHTING;
    global.screen_do_culling   = false;
    global.screen_do_fxaa      = false;
    global.screen_do_dof       = false;
    global.screen_show_click   = false;
    global.screen_click_render = false;
}