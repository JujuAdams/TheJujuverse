/// @description Returns the string name of a transition's destination room
/// @param destination_room

switch( argument0 ) {
    case TRANSITION_GAME_END: return "game_end"; break;
    case TRANSITION_NONE: return "no transition"; break;
    case TRANSITION_RETURN: return room_get_name( global.transition_previous_room ) + " (return)"; break;
    default:
        if ( room_exists( argument0 ) ) {
            return room_get_name( argument0 );
        } else {
            return "unknown (game_end)";
        }
    break;
}