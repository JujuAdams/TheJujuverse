/// @param button

var _button = argument0;

switch( _button ) {
    
    case gp_start:      return "START";          break;
    case gp_select:     return "SELECT";         break;
    
    case gp_face1:      return "A";              break;
    case gp_face2:      return "B";              break;
    case gp_face3:      return "X";              break;
    case gp_face4:      return "Y";              break;
    
    case gp_padu:       return "DPAD UP";        break;
    case gp_padd:       return "DPAD DOWN";      break;
    case gp_padl:       return "DPAD LEFT";      break;
    case gp_padr:       return "DPAD RIGHT";     break;
    
    case gp_shoulderl:  return "LEFT SHOULDER";  break;
    case gp_shoulderlb: return "LEFT TRIGGER";   break;
    case gp_shoulderr:  return "RIGHT SHOULDER"; break;
    case gp_shoulderrb: return "RIGHT TRIGGER";  break;
    
    case gp_stickl:     return "LEFT STICK";     break;
    case gp_stickr:     return "RIGHT STICK";    break;
    
    default:
        return undefined;
    break;
    
}


















