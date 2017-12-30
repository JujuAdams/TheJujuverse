/*
var _sprite_uvs = sprite_get_uvs( spr_distortion_aoe, 0 );
shader_set_uniform_f( shader_get_uniform( shd_displacement_aoe, "u_fUVs" ), _sprite_uvs[0], _sprite_uvs[1],
                                                                            _sprite_uvs[2] - _sprite_uvs[0],
                                                                            _sprite_uvs[3] - _sprite_uvs[1] );
shader_set_uniform_f( shader_get_uniform( shd_displacement_aoe, "u_fRepeats" ), 2 );
shader_set_uniform_f( shader_get_uniform( shd_displacement_aoe, "u_fSineOffset" ), -current_time / 1000 );
shader_set_uniform_f( shader_get_uniform( shd_displacement_aoe, "u_fIntensity" ), 0.7*sqr( image_alpha ) );
draw_sprite_ext( spr_distortion_aoe, 0, x, y, 1.8*image_xscale, 1.8*image_yscale, 0, c_white, image_alpha );
*/