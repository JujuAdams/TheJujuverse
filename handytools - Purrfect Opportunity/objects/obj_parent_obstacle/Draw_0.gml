/// @description 
if (jump) {
	draw_sprite_ext( sprite_index, 1, x, yorigin, 1, 1, image_angle, image_blend, 1);
	draw_sprite_ext( sprite_index, 0, x, y,		  1, 1, image_angle, image_blend, 1);
} else {
	draw_sprite_ext( sprite_index, 1, x, y, 1, 1, image_angle, image_blend, 1);
	draw_sprite_ext( sprite_index, 0, x, y, 1, 1, image_angle, image_blend, 1);
}