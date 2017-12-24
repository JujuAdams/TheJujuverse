event_inherited();

z = 0;
sprite = spr_tex_vase1;

rotation = random( 360 );
rotation_speed = 1;
rot_axis_x = random_range( -1, 1 );
rot_axis_y = random_range( -1, 1 );
rot_axis_z = random_range( -1, 1 );
var _d = 1/sqrt( rot_axis_x*rot_axis_x + rot_axis_y*rot_axis_y + rot_axis_z*rot_axis_z );
rot_axis_x *= _d;
rot_axis_y *= _d;
rot_axis_z *= _d;

sprite = spr_tex_white;
model = obj_model( "shard1" );