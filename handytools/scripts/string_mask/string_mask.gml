/// @description Hide a string based on its length (e.g. passwords in inputfields)
/// @param string Character to use (e.g. "*" or "•")
/// @param string The string to mask
/// @return string
return string_repeat(argument0, string_length(argument1));