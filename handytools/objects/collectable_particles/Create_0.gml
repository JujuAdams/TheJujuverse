/// @description 
particle1 = part_type_create();
part_type_sprite(particle1,spr_collectible_particle,0,0,0);
part_type_size(particle1,1,1,0.10,0);
part_type_colour1(particle1,$e4a3ff);
part_type_alpha3(particle1,0.50,0, 0);
part_type_gravity(particle1,0,270);
part_type_blend(particle1,1);
part_type_life(particle1,18,18);

system = part_system_create();
emit = part_emitter_create(system);