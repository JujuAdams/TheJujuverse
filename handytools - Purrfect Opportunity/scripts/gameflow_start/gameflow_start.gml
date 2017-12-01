global.gameflow_state = e_game_state.menu;
global.gameflow_score_a = 0;
global.gameflow_score_b = 0;
random_set_seed( global.gameflow_random_seed );

transition( obj_transition_wipe, DEFAULT, DEFAULT, rm_game );