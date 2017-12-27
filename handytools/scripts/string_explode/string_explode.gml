/// @description Explode a string based on a key
/// @param string Seperator - Explode on what character(s)
/// @param string Data - String to explode
/// @return array|null (Returns null if no seperator was found)
var array, seperator, data, length;

seperator = argument0;
data = argument1;

//Check if the seperator was found in the string.
if (!string_count(seperator,data)) {
   array[0] = data;
} else {
    length = string_length(seperator);
    i = 0;
    repeat (string_count(seperator,data)) {
        p = string_pos(seperator,data)-1;
        array[i] = string_copy(data,1,p);
        data = string_delete(data,1,p+length);
        i += 1;
    }
    array[i] = data; //Append final data to end
}
return array;