/// @param colour
/// @param alpha

if ( SCREEN_ALLOW_LIGHTING && global.screen_do_lighting ) {
    var _colour = ((argument_count<1) || (argument[0]==undefined))? C_AMBIENT : argument[0];
    var _alpha  = ((argument_count<2) || (argument[1]==undefined))?         0 : argument[1];
} else {
    var _colour = ((argument_count<1) || (argument[0]==undefined))? c_white : argument[0];
    var _alpha  = ((argument_count<2) || (argument[1]==undefined))?       1 : argument[1];
}

s_shader_rgba( "u_vAmbientColour", _colour, _alpha );