/// @description Append a string to a set length
/// @function string_append
/// @param string
/// @param  appendchar
/// @param  length
var str = string(argument0);
var appendchar = string(argument1);
if (string_length(str) >= argument2) {
   return str;
}
while (string_length(str) < argument2) {
      str = str + appendchar;
}

var overflow = string_length(str) - argument2;

return string_copy(str, overflow, argument2);
