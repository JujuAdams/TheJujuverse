/// @description Prepend a string to a set length
/// @param string
/// @param  prependchar
/// @param  length
var str = string(argument0);
var prependchar = string(argument1);
if (string_length(str) >= argument2) {
   return str;
}
while (string_length(str) < argument2) {
      str = prependchar + str;
}
return string_copy(str, 1, argument2);
