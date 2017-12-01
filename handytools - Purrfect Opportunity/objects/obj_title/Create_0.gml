/// @description 
amplitude = 5;
oscillation = 2;

sub_images = sprite_get_number(sprite_index);
time_keepers = array_create(sub_images, 0);

for (var i = 0; i < sub_images; i++) {
	if (i == 16) {
		time_keepers[i] += (10 * 20);
	} else if (i == 22) {
		time_keepers[i] += (10 * 20);
	} else {
		time_keepers[i] += (10 * i);	
	}
}
