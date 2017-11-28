sound_play( snd_good_donk, 1, false );
instance_destroy( other.id );
	
global.next_particle_x = other.x;
global.next_particle_y = other.y;
	
with(collectable_particles) {
	part_emitter_region(
		system,
		emit,
		global.next_particle_x,
		global.next_particle_x + 1,
		global.next_particle_y,
		global.next_particle_y + 1,
		ps_shape_rectangle,
		ps_distr_linear
	);
		
	part_emitter_burst(system, emit, particle1, 6);
}
	
score_add( player_index, 500 );