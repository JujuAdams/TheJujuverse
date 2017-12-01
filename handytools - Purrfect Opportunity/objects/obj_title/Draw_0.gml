for (var i = 0; i < sub_images; i++) {
	if (i != 16) {
		time_keepers[i] = (time_keepers[i] + oscillation) mod 360;
		var shift = amplitude * dsin(time_keepers[i]);
	
		var _y = y + shift;
		draw_sprite_ext(sprite_index, i, x, _y, 0.75, 0.75, 0, image_blend, image_alpha);
	}
}

time_keepers[16] = (time_keepers[16] + oscillation) mod 360;
var shift = amplitude * dsin(time_keepers[16]);
	
var _y = y + shift;
draw_sprite_ext(sprite_index, 16, x, _y, 0.75, 0.75, 0, image_blend, image_alpha);
