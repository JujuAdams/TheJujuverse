var _is_moving = ( abs( velocity_x ) + abs( velocity_y ) > 0.35 );

var _debug_factor = 1;
if ( DEVELOPMENT ) {
    if ( keyboard_check( vk_shift ) ) _debug_factor = 0.1;
} else {
    z = 50;
}

if ( DEVELOPMENT ) {
    if ( keyboard_check( ord( "Q" ) ) ) z += 2 * _debug_factor;
    if ( keyboard_check( ord( "E" ) ) ) z -= 2 * _debug_factor;
}
    
var _vpara = 0;
var _vperp = 0;
if ( keyboard_check( ord( "A" ) ) ) _vperp = -acceleration;
if ( keyboard_check( ord( "D" ) ) ) _vperp =  acceleration;
if ( keyboard_check( ord( "W" ) ) ) _vpara =  acceleration;
if ( keyboard_check( ord( "S" ) ) ) _vpara = -acceleration;
    
if ( !_is_moving )
and ( keyboard_check_pressed( ord( "W" ) )
    or keyboard_check_pressed( ord( "S" ) )
    or keyboard_check_pressed( ord( "A" ) )
    or keyboard_check_pressed( ord( "D" ) ) ) {
    footstep_time = VERY_NEGATIVE;
    view_bob_start_time = current_time;
}
    
if ( _vpara != 0 ) {
    velocity_x += lengthdir_x( _vpara, obj_camera.look_xy_angle ) * _debug_factor;
    velocity_y += lengthdir_y( _vpara, obj_camera.look_xy_angle ) * _debug_factor;
}
    
if ( _vperp != 0 ) {
    velocity_x += lengthdir_x( _vperp, obj_camera.look_xy_angle-90 ) * _debug_factor;
    velocity_y += lengthdir_y( _vperp, obj_camera.look_xy_angle-90 ) * _debug_factor;
}

velocity_x *= damping;
velocity_y *= damping;

if ( !obj_game.transition_do ) {
    if ( !place_meeting( x + velocity_x, y + velocity_y, obj_par_solid ) ) or ( global.game_editing ) {
        
        x += velocity_x;
        y += velocity_y;
        
        if ( global.game_room < 10 ) {
            
            if ( _is_moving ) {
                
                if ( current_time > footstep_time + 470 ) {
                    footstep_flipflop = !footstep_flipflop;
                    footstep_time = current_time;
                    if ( footstep_flipflop ) audio_play_sound( snd_footstep_0, 1, false ) else audio_play_sound( snd_footstep_1, 1, false );
                }
                
                view_bob_size = clamp( view_bob_size + 0.05, 0, 1 );
                
            } else {
            
                view_bob_size = clamp( view_bob_size - 0.05, 0, 1 );
                
            }
            
            view_bob_z = view_bob_size*0.9*sqr( dsin( ( current_time - view_bob_start_time )/3 ) );
            
        }
        
    } else {
		
		x += velocity_x;
		y += velocity_y;
		
        var _sign_x = sign( velocity_x );
        repeat( abs( velocity_x ) ) {
            if ( !place_meeting( x + _sign_x, y, obj_par_solid ) ) {
                x += _sign_x;
            } else {
                break;
            }
        }
        
        var _sign_y = sign( velocity_y );
        repeat( abs( velocity_y ) ) {
            if ( !place_meeting( x, y + _sign_y, obj_par_solid ) ) {
                y += _sign_y;
            } else {
                break;
            }
        }
		
    }
}

with( obj_camera ) {
    x = other.x;
    y = other.y;
    z = other.z + other.view_bob_z;
}