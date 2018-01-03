event_inherited();

if ( ( !editor_is_open() || obj_editor.window_page != E_EDITOR_PAGE.PLACE )
&& instances_exist( obj_tri_b, obj_tri_c, obj_line_a, obj_line_b )
&& ( grip_current() == "3d" ) ) {
    
    vertex_submit_and_delete(
        vertex_buffer_triangle( obj_tri_a.x, obj_tri_a.y, obj_tri_a.z,
                                obj_tri_b.x, obj_tri_b.y, obj_tri_b.z,
                                obj_tri_c.x, obj_tri_c.y, obj_tri_c.z,
                                c_white, 1 )
    );
    
    if ( vector_intersects_triangle( obj_line_a.x, obj_line_a.y, obj_line_a.z,
                                     obj_line_b.x, obj_line_b.y, obj_line_b.z,
                                     obj_tri_a.x , obj_tri_a.y , obj_tri_a.z ,
                                     obj_tri_b.x , obj_tri_b.y , obj_tri_b.z ,
                                     obj_tri_c.x , obj_tri_c.y , obj_tri_c.z   ) ) {
        var _result = vector_plane_intersection( obj_line_a.x, obj_line_a.y, obj_line_a.z,
                                                 obj_line_b.x, obj_line_b.y, obj_line_b.z,
                                                 obj_tri_a.x , obj_tri_a.y , obj_tri_a.z ,
                                                 obj_tri_b.x , obj_tri_b.y , obj_tri_b.z ,
                                                 obj_tri_c.x , obj_tri_c.y , obj_tri_c.z  );
        vertex_submit_sphere( _result[0], _result[1], _result[2], 1 );
    }
    
}