/// @description Decode a string based on RFC 1738
/// @param string The string to decode
/// @return string
/// @todo only works up to #FF (255) characters.
var str;
var dec = argument0;
var output = "";
var pos = string_pos("%", dec);
while (pos != 0) {
    //Copy general output
    output += string_copy(dec, 1, pos-1);
    //Grab part to decode
    str = string_copy(dec, pos+1, 2);
    //Decode and add to output
    output += chr(hextodec(str));
    //Remove all up to this thing
    dec = string_delete(dec, 1, pos+2);
    //Reset pointer
    pos = string_pos("%", dec);
}
return output + dec;