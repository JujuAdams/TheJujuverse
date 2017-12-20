///unload_current_room()

with ( obj_subtitle ) {
    alpha_animate = true;
    alpha_direction = -1;
}

tr_instance_destroy( obj_par_game );

global.game_text          = "";
global.game_phone_do_ring = false;
global.game_flower_index  = undefined;
global.game_got_hammer    = false;
global.game_got_scissors  = false;

global.game_outro_do = false;
global.game_outro_last_event = current_time;
global.game_outro_stage = 0;

grip_deactivate( "mirror0" );
grip_deactivate( "mirror1" );
grip_deactivate( "mirror2" );
grip_deactivate( "mirror3" );
grip_deactivate( "mirror click0" );
grip_deactivate( "mirror click1" );