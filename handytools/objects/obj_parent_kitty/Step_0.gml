if ( time_passed( start_time, delay ) ) {
	start_time = current_time;
	delay = random_range( 5000, 10000 );
	image_index = 0;
	image_speed = random_range( 0.45, 0.55 );
}