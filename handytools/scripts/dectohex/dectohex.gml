/// @description Turn decimal into heximal
/// @param int
/// @return string
var n,r;
n=argument0;
r="";
while(n) {
    r=string_char_at("0123456789ABCDEF",n mod 16+1)+r;
    n=n div 16
}
if (r == "") {
   r = "0";
}
return r;