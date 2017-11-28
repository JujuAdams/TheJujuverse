/// @param key

var _ord = argument0;

if ( between( _ord, 33, 126 ) ) {
	var _string = chr( _ord );
	if ( string_length( _string ) == 1 ) return _string;
}

switch( _ord ) {
	
	case vk_escape:    return "ESCAPE";          break;
	case vk_shift:     return "SHIFT";           break;
	case vk_enter:     return "ENTER";           break;
	case vk_control:   return "CONTROL";         break;
	case vk_alt:       return "ALT";             break;
	case vk_tab:       return "TAB";             break;
	case vk_backspace: return "BACKSPACE";       break;
	case vk_space:     return "SPACE";           break;
												 
	case vk_lalt:      return "LEFT ALT";        break;
	case vk_lcontrol:  return "LEFT CONTROL";    break;
	case vk_ralt:      return "RIGHT ALT";       break;
	case vk_rcontrol:  return "RIGHT CONTROL";   break;
												 
	case vk_delete:    return "DELETE";          break;
	case vk_insert:    return "INSERT";          break;
	case vk_end:       return "END";             break;
	case vk_home:      return "HOME";            break;
	case vk_pagedown:  return "PAGE DOWN";       break;
	case vk_pageup:    return "PAGE UP";         break;
												 
	case vk_up:        return "UP";              break;
	case vk_down:      return "DOWN";            break;
	case vk_left:      return "LEFT";            break;
	case vk_right:     return "RIGHT";           break;
												 
	case vk_numpad0:   return "NUMPAD 0";        break;
	case vk_numpad1:   return "NUMPAD 1";        break;
	case vk_numpad2:   return "NUMPAD 2";        break;
	case vk_numpad3:   return "NUMPAD 3";        break;
	case vk_numpad4:   return "NUMPAD 4";        break;
	case vk_numpad5:   return "NUMPAD 5";        break;
	case vk_numpad6:   return "NUMPAD 6";        break;
	case vk_numpad7:   return "NUMPAD 7";        break;
	case vk_numpad8:   return "NUMPAD 8";        break;
	case vk_numpad9:   return "NUMPAD 9";        break;
												 
	case vk_add:       return "NUMPAD +";        break;
	case vk_subtract:  return "NUMPAD -";        break;
	case vk_divide:    return "NUMPAD /";        break;
	case vk_multiply:  return "NUMPAD *";        break;
	
	default:
		return "";
	break;
	
}