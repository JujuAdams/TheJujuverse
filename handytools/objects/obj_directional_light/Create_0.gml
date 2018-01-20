event_inherited();

range = random_range( 120, 400 );
colour = c_white; //make_colour_hsv( irandom( 255 ), 255, 255 );
light_sprite = spr_light_map;
light_image = 0;

grip_create( UNIQUE_NAME, 1, 1, true, true );
grip_activate( UNIQUE_NAME, true );

quat = quaternion_create();
grip_set_lookat_3d_quaternion( UNIQUE_NAME,   x, y, z,   quat );
grip_set_perspective( UNIQUE_NAME );
grip_set_shader( UNIQUE_NAME, shd_depth );

matrix = matrix_build_identity();

surface_set_target( grip_get_surface( UNIQUE_NAME ) );
draw_clear_alpha( c_black, 1 );
var _r = min( grip_get_width( UNIQUE_NAME )/2, grip_get_height( UNIQUE_NAME )/2 );
draw_set_colour( c_white );
draw_circle( grip_get_width( UNIQUE_NAME )/2, grip_get_height( UNIQUE_NAME )/2, _r, false );
surface_reset_target();