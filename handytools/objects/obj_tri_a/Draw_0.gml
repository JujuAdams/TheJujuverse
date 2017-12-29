//event_inherited();

if ( ( !editor_is_open() || obj_editor.window_page != E_EDITOR_PAGE.PLACE )
&& instances_exist( obj_tri_b, obj_tri_c, obj_tri_sphere )
&& ( grip_get_current() == "3d" ) ) {
	
	var _px      = obj_tri_sphere.x;
	var _py      = obj_tri_sphere.y;
	var _pz      = obj_tri_sphere.z;
	
	var _ax = obj_tri_a.x;
	var _ay = obj_tri_a.y;
	var _az = obj_tri_a.z;
	var _bx = obj_tri_b.x;
	var _by = obj_tri_b.y;
	var _bz = obj_tri_b.z;
	var _cx = obj_tri_c.x;
	var _cy = obj_tri_c.y;
	var _cz = obj_tri_c.z;
	
	vertex_submit_and_delete(
		vertex_buffer_triangle( _ax, _ay, _az,
			                    _bx, _by, _bz,
			                    _cx, _cy, _cz,
								c_white, 1 )
	);
	
	//Make all vertices relative to a single point (make C the origin)
	var _ix = _bx - _ax;
	var _iy = _by - _ay;
	var _iz = _bz - _az;
	
	var _jx = _cx - _ax;
	var _jy = _cy - _ay;
	var _jz = _cz - _az;
	
	var _vx = _px - _ax;
	var _vy = _py - _ay;
	var _vz = _pz - _az;
	
	//Find the normal of the triangle
	var _normal = cross_product_normalised( _ix, _iy, _iz,    _jx, _jy, _jz );
	var _nx = _normal[0];
	var _ny = _normal[1];
	var _nz = _normal[2];
	
	//Project V onto the triangle's plane
	var _dot = dot_product_3d( _vx, _vy, _vz,    _nx, _ny, _nz );
	var _sx = _vx - _nx*_dot;
	var _sy = _vy - _ny*_dot;
	var _sz = _vz - _nz*_dot;
	
	//Find the distance to the plane early - this is the minimum value the distance ever can be
	var _rx = _sx - _vx;
	var _ry = _sy - _vy;
	var _rz = _sz - _vz;
	var _dist = sqrt( _rx*_rx + _ry*_ry + _rz*_rz );
	
	var _i_sqr_dist = _ix*_ix + _iy*_iy + _iz*_iz;
	var _i_dist     = sqrt( _i_sqr_dist );
	var _j_sqr_dist = _jx*_jx + _jy*_jy + _jz*_jz;
	var _j_dist     = sqrt( _j_sqr_dist );
	
	var _result = cross_product_normalised( _nx, _ny, _nz,    _ix, _iy, _iz );
	var _kx = _result[0]*_i_dist;
	var _ky = _result[1]*_i_dist;
	var _kz = _result[2]*_i_dist;
	
	//Project onto the basis vectors for the triangle
	var _i = dot_product_3d( _sx, _sy, _sz,    _ix, _iy, _iz ) / _i_sqr_dist;
	var _j = dot_product_3d( _sx, _sy, _sz,    _jx, _jy, _jz ) / _j_sqr_dist;
	var _k = dot_product_3d( _sx, _sy, _sz,    _kx, _ky, _kz ) / _i_sqr_dist;
	
	var _j_dot_i = dot_product_3d( _jx, _jy, _jz,   _ix, _iy, _iz ) / _i_sqr_dist;
	var _j_dot_k = dot_product_3d( _jx, _jy, _jz,   _kx, _ky, _kz ) / _i_sqr_dist;
	
	var _check_j = _k / _j_dot_k;
	var _check_i = ( _sx - _check_j*_jx ) / _ix;
	
	/*
		|\
		| \
		|  \
		|   \
		L____\
	*/
	
	if ( _check_i < 0 ) && ( _check_j >= 0 ) {
		
		//Left
		_j = clamp( _j, 0, 1 );
		var _dist = point_distance_3d( _vx, _vy, _vz,   _j*_jx, _j*_jy, _j*_jz );
		
	} else if ( _check_i >= 0 ) && ( _check_j < 0 ) {
		
		//Below
		_i = clamp( _i, 0, 1 );
		var _dist = point_distance_3d( _vx, _vy, _vz,   _i*_ix, _i*_iy, _i*_iz );
		
	} else if ( _check_i < 0 ) && ( _check_j < 0 ) {
		
		//Bottom-left
		var _dist = point_distance_3d( _vx, _vy, _vz,   0, 0, 0 );
		
	} else if ( _check_i + _check_j > 1 ) {
		
		//Outside (remember that y=1-x defines the hypotenuese)
		//Shortest distance is always on the line y=x+c
		//Closest point satisfies both equations
		
		var _lx = _jx - _ix;
		var _ly = _jy - _iy;
		var _lz = _jz - _iz;
		var _l_sqr_dist = _lx*_lx + _ly*_ly + _lz*_lz;
		var _l = dot_product_3d( _sx-_ix, _sy-_iy, _sz-_iz,   _lx, _ly, _lz ) / _l_sqr_dist;
		
		_l = clamp( _l, 0, 1 );
		var _dist = point_distance_3d( _vx, _vy, _vz,   _l*_lx + _ix, _l*_ly + _iy, _l*_lz + _iz );
		
	} else {
		
		//Inside the triangle
		var _dist = point_distance_3d( _vx, _vy, _vz,   _sx, _sy, _sz );
		
	}
	
	obj_tri_sphere.scale = _dist;
	
}