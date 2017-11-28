/// @description 
var contributors = ds_list_create();

ds_list_add(contributors,
	obj_button_thirteen,
	obj_button_toph,
	obj_button_juju,
	obj_button_blobbles,
	obj_button_gartguy	
);

ds_list_shuffle(contributors);

for (var i = 0; i < ds_list_size(contributors); ++i) {
	instance_create_layer(
		((room_width - 248) div 2),
		75 + (i * 24),
		"Instances",
		contributors[| i]
	);
}

ds_list_destroy(contributors);