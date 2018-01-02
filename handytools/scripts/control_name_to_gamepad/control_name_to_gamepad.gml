/// @description Returns the GM native gamepad button index for a string name
/// @param name

var _string = string_upper( argument0 );

switch( _string ) {
    
    case "START":          return gp_start;      break;
    case "SELECT":         return gp_select;     break;
    
    case "A":              return gp_face1;      break;
    case "B":              return gp_face2;      break;
    case "X":              return gp_face3;      break;
    case "Y":              return gp_face4;      break;
    
    case "CROSS":          return gp_face1;      break;
    case "CIRCLE":         return gp_face2;      break;
    case "SQUARE":         return gp_face3;      break;
    case "TRIANGLE":       return gp_face4;      break;
    
    case "DPAD_UP":        return gp_padu;       break;
    case "DPAD_DOWN":      return gp_padd;       break;
    case "DPAD_LEFT":      return gp_padl;       break;
    case "DPAD_RIGHT":     return gp_padr;       break;
    
    case "LEFT_SHOULDER":  return gp_shoulderl;  break;
    case "LEFT_TRIGGER":   return gp_shoulderlb; break;
    case "RIGHT_SHOULDER": return gp_shoulderr;  break;
    case "RIGHT_TRIGGER":  return gp_shoulderrb; break;
    
    case "LEFT_STICK":     return gp_stickl;     break;
    case "RIGHT_STICK":    return gp_stickr;     break;
    
    default:
        return undefined;
    break;
    
}