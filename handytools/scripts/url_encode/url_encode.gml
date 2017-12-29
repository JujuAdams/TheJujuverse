/// @description Encode a string based on RFC 1738 
/// @param string The string to encode
/// @return string
/// @todo - doesn't work over ord(255) (hex FF) characters...
var char, i;
var output = "";
for (i = 1; i <= string_length(argument0); i += 1) {
     char = string_char_at(argument0, i);
     if (string_pos(char, " {}[]|\\^`\"#%<>;/@$=:?&") > 0 || ord(char) > 126 && ord(char) < 255) {
         char = "%" + dectohex(ord(char));
     }
     output += char;
}
return output;