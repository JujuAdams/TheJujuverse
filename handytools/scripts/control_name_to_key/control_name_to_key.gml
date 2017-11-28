/// @param name

var _string = string_upper( argument0 );

if ( string_length( _string ) == 1 ) {
	var _ord = ord( _string );
	if ( between( _ord, 33, 126 ) ) return _ord else return undefined;
}

switch( _string ) {
	
	case "ESCAPE":          return vk_escape;    break;
	case "ESC":             return vk_escape;    break;
	case "SHIFT":           return vk_shift;     break;
	case "RETURN":          return vk_enter;     break;
	case "ENTER":           return vk_enter;     break;
	case "CONTROL":         return vk_control;   break;
	case "CTRL":            return vk_control;   break;
	case "ALT":             return vk_alt;       break;
	case "TAB":             return vk_tab;       break;
	case "BACKSPACE":       return vk_backspace; break;
	case "SPACE":           return vk_space;     break;
	
	case "LEFT ALT":        return vk_lalt;      break;
	case "LEFT CONTROL":    return vk_lcontrol;  break;
	case "LEFT CTRL":       return vk_lcontrol;  break;
	case "RIGHT ALT":       return vk_ralt;      break;
	case "RIGHT CONTROL":   return vk_rcontrol;  break;
	case "RIGHT CTRL":      return vk_rcontrol;  break;
	
	case "DELETE":          return vk_delete;    break;
	case "INSERT":          return vk_insert;    break;
	case "END":             return vk_end;       break;
	case "HOME":            return vk_home;      break;
	case "PAGE DOWN":       return vk_pagedown;  break;
	case "PAGE UP":         return vk_pageup;    break;
	
	case "UP":              return vk_up;        break;
	case "DOWN":            return vk_down;      break;
	case "LEFT":            return vk_left;      break;
	case "RIGHT":           return vk_right;     break;
	
	case "NUMPAD 0":        return vk_numpad0;   break;
	case "NUMPAD 1":        return vk_numpad1;   break;
	case "NUMPAD 2":        return vk_numpad2;   break;
	case "NUMPAD 3":        return vk_numpad3;   break;
	case "NUMPAD 4":        return vk_numpad4;   break;
	case "NUMPAD 5":        return vk_numpad5;   break;
	case "NUMPAD 6":        return vk_numpad6;   break;
	case "NUMPAD 7":        return vk_numpad7;   break;
	case "NUMPAD 8":        return vk_numpad8;   break;
	case "NUMPAD 9":        return vk_numpad9;   break;
	
	case "NUMPAD +":        return vk_add;       break;
	case "NUMPAD ADD":      return vk_add;       break;
	case "NUMPAD PLUS":     return vk_add;       break;
	case "NUMPAD -":        return vk_subtract;  break;
	case "NUMPAD SUBTRACT": return vk_subtract;  break;
	case "NUMPAD MINUS":    return vk_subtract;  break;
	case "NUMPAD /":        return vk_divide;    break;
	case "NUMPAD DIVIDE":   return vk_divide;    break;
	case "NUMPAD *":        return vk_multiply;  break;
	case "NUMPAD MULTIPLY": return vk_multiply;  break;
	
	default:
		return undefined;
	break;
	
}