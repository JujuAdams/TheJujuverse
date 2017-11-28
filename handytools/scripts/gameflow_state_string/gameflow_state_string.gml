switch( global.gameflow_state ) {
	
	case e_game_state.menu:        return "menu";        break;
	
	case e_game_state.intro_pause: return "intro_pause"; break;
	case e_game_state.intro:       return "intro";       break;
	case e_game_state.intro_pan:   return "intro_pan";   break;
	
	case e_game_state.play_1a:     return "play_1a";     break;
	case e_game_state.follow_1a:   return "follow_1a";   break;
	case e_game_state.pan_1a:      return "pan_1a";      break;
	
	case e_game_state.play_2a:     return "play_2a";     break;
	case e_game_state.follow_2a:   return "follow_2a";   break;
	case e_game_state.pan_2a:      return "pan_2a";      break;
	
	case e_game_state.play_2b:     return "play_2b";     break;
	case e_game_state.follow_2b:   return "follow_2b";   break;
	case e_game_state.pan_2b:      return "pan_2b";      break;
	
	case e_game_state.play_1b:     return "play_1b";     break;
	case e_game_state.follow_1b:   return "follow_1b";   break;
	case e_game_state.pan_1b:      return "pan_1b";      break;
	
	case e_game_state.end_pause:   return "end_pause";   break;
	case e_game_state.scoring:     return "scoring";     break;
	case e_game_state.scritch:     return "scritch";     break;
	case e_game_state.bite:        return "bite";        break;
	case e_game_state.outro:       return "outro";       break;
	
	default: return "unknown state LOL"; break;
	
}