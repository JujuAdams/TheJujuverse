switch( global.gameflow_mode ) {
	case e_game_mode.ai: return "AI MODE"; break;
	case e_game_mode.single: return "SINGLE MODE"; break;
	case e_game_mode.local_: return "LOCAL MODE"; break;
	default: return "??? MODE NOT FOUND"; break;
}