trace_f( "Initialising services" );
	
vertex_format_begin();
vertex_format_add_position_3d(); //12
vertex_format_add_texcoord();    // 8
vertex_format_add_colour();      // 4
vertex_format_add_normal();      //12 = 36
global.vft_simple_3d = vertex_format_end();

vertex_format_begin();
vertex_format_add_position(); //8
vertex_format_add_texcoord(); //8
vertex_format_add_colour();   //4 = 20
global.vft_simple_2d = vertex_format_end();

global.vbf_sphere = vertex_buffer_sphere( -1, -1, -1,
                                           1,  1,  1,
										   1,  1, 16 );

   tracker_init();
  imguigml_init();
   control_init();
     audio_init();
       wan_init();
   options_init();
       fps_init();
   devtool_init();
    rumble_init();
     trace_init();
resolution_init();
      grip_init();
    editor_init();
 obj_model_init();
  scribble_init();
transition_init();
     jiffy_init();