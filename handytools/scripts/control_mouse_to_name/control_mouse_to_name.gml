/// @description Returns the string name for a GameMaker native mouse button index
/// @param mouse_button

var _mb = argument0;

switch( _mb ) {
    
    case mb_left:   return "LEFT";   break;
    case mb_middle: return "MIDDLE"; break;
    case mb_right:  return "RIGHT";  break;
    case mb_any:    return "ANY";    break;
    
    default:
        return undefined;
    break;
    
}