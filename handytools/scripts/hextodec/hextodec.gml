/// @description Convert hexadecimal string to decimal number
/// @function hextodec
/// @param string The string to convert
/// @return integer
var d,r,l;
r=0;
d=string_upper(argument0);
l=string_length(d);
if(l>6) return -1;
for (i=l;i>0;i-=1) {
    r+=(string_pos(string_char_at(d,i),"0123456789ABCDEF")-1) * power(16,l-i);
}
return r;