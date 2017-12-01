/// @description 
if (jumptrig) {
	jumptrig = false;
	jump = true;
	vsp = jump_speed;
	yorigin = y;
}

if (jump) {
	image_angle += dsin(current_time);
	vsp -= 0.2;
	y -= vsp;
	
	if (y >= yorigin) {
		jump = false;
		vsp = 0;
		y = yorigin;
		image_angle = 0;	
	}
}