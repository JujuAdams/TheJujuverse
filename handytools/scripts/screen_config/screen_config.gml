/// @description SCREEN configuration

#macro ALLOW_DITHER true
#macro ALLOW_LIGHTING (true && SCREEN_3D)
#macro ALLOW_FXAA true

#macro SCREEN_3D true
#macro SCREEN_3D_SHADER shd_hlsl_mrt
#macro SCREEN_CLICK_GRIP_AS_VIEW true
#macro SCREEN_BACKGROUND_COLOUR c_black //Set to undefined for no clear
#macro SCREEN_DOF_SMOOTH_RATE 0.07

#macro SCREEN_CREATE_SCRIPT     screen_custom_create
#macro SCREEN_STEP_SCRIPT       screen_custom_step
#macro SCREEN_DRAW_BEGIN_SCRIPT screen_custom_draw_begin
#macro SCREEN_DRAW_END_SCRIPT   screen_custom_draw_end