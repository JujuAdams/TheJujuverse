#### `sr_ensure_singleton`   
| | | 
| ----------------- | --------------------------------------------- |   
**_singleton_name** | {String} global name to use for the singleton   
**returns**: |     {Boolean} false if an existing instance is destroyed - be sure to check CleanUp / Destroys   
```
sr_ensure_singleton(_singleton_name)
```   
called `with` object to be singleton - ensure the name passed is a singleton, will call instance destroy on a different id

---

#### `sr_ensure_font`   
| | | 
| ---------- | -------------------------- |   
**font**     | _font_index resource index   
**returns**: | None   
```
sr_ensure_font(font)
```   
cache the current font

---

#### `sr_ensure_color`   
| | | 
| ---------- | ------------------------- |   
**_color**   | {Real} color value to set   
**returns**: | None   
```
sr_ensure_color(_color)
```   
cache the current color

---

#### `sr_color_hex`   
| | | 
| ---------- | --------------------- |   
**color**    | _hex_color in $RRGGBB   
**returns**: | {Real} color formatted in BBGGRR for GML   
```
sr_color_hex(color)
```   
[Convert the RGB to BGR](https://forum.yoyogames.com/index.php?threads/why-are-hex-colours-bbggrr-instead-of-rrggbb.16325/#post-105309)

---

#### `sr_color_glsl`   
| | | 
| -------------- | ------------------------------------------------------ |   
**_color**       | {Real} color to convert   
**[_out_array]** | {Array} optional out array to not allocate a new array   
**returns**: |  {Array} array of colors in float range   
```
sr_color_glsl(_color, [_out_array])
```   
convert a color to an array float values [0.0 - 1.0]

---

#### `sr_next_pot`   
| | | 
| ---------- | -------------------------------------------------------------------------------- |   
**_va**      | {Real} note: if a float is given, its rounded up to 'fit' the float into the POT   
**returns**: | {Real} nearest power of 2 to given integer   
```
sr_next_pot(_va)
```   
return the nearest power of 2 for a given number (integer)

---

#### `sr_shadow_text`   
| | | 
| ----------- | -------------------------------- |   
**_x**        | {Real} x position to draw text   
**_y**        | {Real} y position to draw text   
**_text**     | {String} text to draw   
**_fg**       | {Real} foreground color   
**_bg**       | {Real} background (shadow) color   
**[_xoff=1]** | {Real} x offset for the shadow   
**[_yoff=1]** | {Real} y offset for the shadow   
**returns**: | None   
```
sr_shadow_text(_x, _y, _text, _fg, _bg, [_xoff=1], [_yoff=1])
```   
Draw text with a shadow

---

#### `sr_outline_text`   
| | | 
| ---------- | -------------------------- |   
**_x**       | {Real} x position for text   
**_y**       | {Real} y position for text   
**_text**    | {String} text to draw   
**_fg**      | {Real} foreground color   
**_bg**      | {Real} background color   
**returns**: | None   
```
sr_outline_text(_x, _y, _text, _fg, _bg)
```   
draw text with an oultine

---

#### `sr_error`   
| | | 
| ----------- | -------------------------------- |   
**[_system]** | {String} system name for logging   
**_text**     | {String} error message   
**returns**: | None   
```
sr_error([_system], _text)
```   
Error wrapper (eventual logging system)

---

#### `sr_log`   
| | | 
| ----------- | -------------------------------- |   
**[_system]** | {String} system name for logging   
**_text**     | {String} log message   
**returns**: | None   
```
sr_log([_system], _text)
```   
Log wrapper (eventual logging system)

---

#### `sr_execute`   
| | | 
| --------------- | ----------------------------------------------------------------------------- |   
**_script_index** | {Real} script to execute   
**_params**       | {Array} parameters to call, in an array   
**[paramCount]**  | {Real} if you've already got the count ready, pass it, or else it's computed.   
**returns**: |   {*} return value from script call   
```
sr_execute(_script_index, _params, [paramCount])
```   
rousr_execute - call a function with variadic argument support

---

#### `sr_aabb_contains_line`   
| | | 
| ------------- | ------- |   
**_line_x1**    | {Real}    
**_line_y1**    | {Real}    
**_line_x2**    | {Real}    
**_line_y2**    | {Real}    
**_rect_min_x** | {Real}    
**_rect_min_y** | {Real}    
**_rect_max_x** | {Real}    
**_rect_max_y** | {Real}    
**returns**: | {Boolean} true if an aabb and line intersect   
```
sr_aabb_contains_line(_line_x1, _line_y1, _line_x2, _line_y2, _rect_min_x, _rect_min_y, _rect_max_x, _rect_max_y)
```   
courtesy of https://stackoverflow.com/questions/1585525/how-to-find-the-intersection-point-between-a-line-and-a-rectangle

---

