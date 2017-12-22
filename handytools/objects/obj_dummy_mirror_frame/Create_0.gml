event_inherited();

z = 0;

swell_x      = 0;
swell_y      = 0;
swell_amount = 0;

mirror_model = tr_vertex_create_buffer();
vertex_begin( mirror_model, global.vft_simple );
vertex_position_3d( mirror_model, 0, -42, 62 ); vertex_texcoord( mirror_model, 1, 0 ); vertex_colour( mirror_model, c_white, 1 ); vertex_normal( mirror_model, 1, 0, 0 );
vertex_position_3d( mirror_model, 0, -42,  3 ); vertex_texcoord( mirror_model, 1, 1 ); vertex_colour( mirror_model, c_white, 1 ); vertex_normal( mirror_model, 1, 0, 0 );
vertex_position_3d( mirror_model, 0,  46, 62 ); vertex_texcoord( mirror_model, 0, 0 ); vertex_colour( mirror_model, c_white, 1 ); vertex_normal( mirror_model, 1, 0, 0 );
vertex_position_3d( mirror_model, 0,  46,  3 ); vertex_texcoord( mirror_model, 0, 1 ); vertex_colour( mirror_model, c_white, 1 ); vertex_normal( mirror_model, 1, 0, 0 );
vertex_end( mirror_model );

mirror_index = global.mirror_count++;
grip_activate( concat( "mirror", mirror_index ) );