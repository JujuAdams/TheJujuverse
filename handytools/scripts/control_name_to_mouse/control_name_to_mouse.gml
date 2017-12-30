/// @param name

var _string = string_upper( argument0 );

switch( _string ) {
    
    case "LEFT":   return mb_left;   break;
    case "MIDDLE": return mb_middle; break;
    case "RIGHT":  return mb_right;  break;
    case "ANY":    return mb_any;    break;
    
    default:
        return undefined;
    break;
    
}