event_inherited();

body_angle = dsin( current_time/10 ) * dcos( current_time/20 ) * 20;
head_angle = body_angle*0.2;
head_tilt = lerp( 20, -2, max( 0, dsin( current_time/2 ) ) );