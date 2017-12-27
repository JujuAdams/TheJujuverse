/// @description Implode an array based on a key
/// @param string Glue - Implode using what character
/// @param array Array to implode
var output, seperator, array;
seperator = argument0;
array = argument1;

output = "";
for (i=0; i<array_length_1d(array); i++) {
    output = output + string(array[i]) + string(seperator);
}
length = string_length(seperator);
output = string_copy(output,0, string_length(output) - string_length(seperator));
return output;

