//event_inherited();

if ( ( !editor_is_open() || obj_editor.window_page != E_EDITOR_PAGE.PLACE )
&& instances_exist( obj_tri_b, obj_tri_c, obj_tri_sphere )
&& ( grip_get_current() == "3d" ) ) {
	
	var _px      = obj_tri_sphere.x;
	var _py      = obj_tri_sphere.y;
	var _pz      = obj_tri_sphere.z;
	var _closest = VERY_LARGE;
	
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
	
	vertex_submit_and_delete(
		vertex_buffer_line( 1*_ix+_ax, 1*_iy+_ay, 1*_iz+_az,
			                      _ax,       _ay,       _az,
							c_red, 1, 0.8 )
	);
	
	vertex_submit_and_delete(
		vertex_buffer_line( 1*_jx+_ax, 1*_jy+_ay, 1*_jz+_az,
			                      _ax,       _ay,       _az,
							c_blue, 1, 0.8 )
	);
	
	var _vx = _px - _ax;
	var _vy = _py - _ay;
	var _vz = _pz - _az;
	
	//Find the normal of the triangle
	var _normal = cross_product_normalised( _ix, _iy, _iz,
		                                    _jx, _jy, _jz );
	var _nx = _normal[0];
	var _ny = _normal[1];
	var _nz = _normal[2];
	
	//Project V onto the triangle's plane
	var _dot = dot_product_3d( _vx, _vy, _vz,   _nx, _ny, _nz );
	var _sx = _vx - _nx*_dot;
	var _sy = _vy - _ny*_dot;
	var _sz = _vz - _nz*_dot;
	
	vertex_submit_and_delete(
		vertex_buffer_line( _sx+_ax, _sy+_ay, _sz+_az,
			                    _px,     _py,     _pz,
							c_white, 1, 0.8 )
	);
	vertex_submit_sphere( _sx+_ax, _sy+_ay, _sz+_az, 0.8 );
	
	//Find the distance to the plane early - this is the minimum value the distance ever can be
	var _rx = _sx - _vx;
	var _ry = _sy - _vy;
	var _rz = _sz - _vz;
	var _dist = sqrt( _rx*_rx + _ry*_ry + _rz*_rz );
	
	var _i_sqr_dist = _ix*_ix + _iy*_iy + _iz*_iz;
	var _i_dist     = sqrt( _i_sqr_dist );
	var _j_sqr_dist = _jx*_jx + _jy*_jy + _jz*_jz;
	var _j_dist     = sqrt( _j_sqr_dist );
	
	var _result = cross_product_normalised( _nx, _ny, _nz,   _ix, _iy, _iz );
	var _kx = _result[0]*_i_dist;
	var _ky = _result[1]*_i_dist;
	var _kz = _result[2]*_i_dist;
	
	
	//Project onto the basis vectors for the triangle
	var _i = dot_product_3d( _sx, _sy, _sz,   _ix, _iy, _iz ) / _i_sqr_dist;
	var _k = dot_product_3d( _sx, _sy, _sz,   _kx, _ky, _kz ) / _i_sqr_dist;
	
	var _j_dot_i = dot_product_3d( _jx, _jy, _jz,   _ix, _iy, _iz ) / _i_sqr_dist;
	var _j_dot_k = dot_product_3d( _jx, _jy, _jz,   _kx, _ky, _kz ) / _i_sqr_dist;
	
	var _j = _k / _j_dot_k;
	_i = ( _sx - _j*_jx ) / _ix;
	
	vertex_submit_and_delete(
		vertex_buffer_line( _j*_jx+_ax, _j*_jy+_ay, _j*_jz+_az,
			                   _sx+_ax,    _sy+_ay,    _sz+_az,
							c_blue, 1, 0.8 )
	);
	
	vertex_submit_sphere( _i*_ix+_ax, _i*_iy+_ay, _i*_iz+_az, 1 );
	vertex_submit_sphere( _j*_jx+_ax, _j*_jy+_ay, _j*_jz+_az, 1 );
	
	output_i = _i;
	output_j = _j;
	output_x = _sx;
	output_y = _sy;
	output_z = _sz;
	
	/*
		|\
		| \
		|  \
		|   \
		L____\
	*/
	
	var _closest_i = 0;
	var _closest_j = 0;
	if ( _i < 0 ) && ( _j >= 0 ) {
		
		//Left
		//_closest_i = 0;
		_closest_j = min( 1, _j );
		
		_rx = _jx*_closest_j - _vx;
		_ry = _jy*_closest_j - _vy;
		_rz = _jz*_closest_j - _vz;
		_dist = sqrt( _rx*_rx + _ry*_ry + _rz*_rz );
		
		output_x = _rx;
		output_y = _ry;
		output_z = _rz;
		
	} else if ( _i >= 0 ) && ( _j < 0 ) {
		
		//Below
		_closest_i = min( _i, 1 );
		//_closest_j = 0;
		
		_rx = _ix*_closest_i - _vx;
		_ry = _iy*_closest_i - _vy;
		_rz = _iz*_closest_i - _vz;
		_dist = sqrt( _rx*_rx + _ry*_ry + _rz*_rz );
		
		output_x = _rx;
		output_y = _ry;
		output_z = _rz;
		
	} else if ( _i < 0 ) && ( _j < 0 ) {
		
		//Bottom-left
		//_closest_i = 0;
		//_closest_j = 0;
		
		_dist = sqrt( _vx*_vx + _vy*_vy + _vz*_vz );
		
		output_x = _vx;
		output_y = _vy;
		output_z = _vz;
		
	} else if ( _i + _j > 1 ) {
		
		//Outside (remember that y=1-x defines the hypotenuese)
		//Shortest distance is always on the line y=x+c
		//Closest point satisfies both equations
		_closest_i = 0.5*( 1 + (_j - _i) );
		_closest_j = 1 - _closest_i;
		
		_rx = _ix*_closest_i + _jx*_closest_j - _vx;
		_ry = _iy*_closest_i + _jy*_closest_j - _vy;
		_rz = _iz*_closest_i + _jz*_closest_j - _vz;
		_dist = sqrt( _rx*_rx + _ry*_ry + _rz*_rz );
		
		output_x = _rx;
		output_y = _ry;
		output_z = _rz;
		
	} else {
		
		//Inside the triangle
		//No recalc necessary - this is the same as the early distance
		//_closest_i = _i;
		//_closest_j = _j;
		
		output_x = _sx;
		output_y = _sy;
		output_z = _sz;
	}
	
	//if ( current_time mod 1000 < 500 ) vertex_submit_sphere( output_x+_ax, output_y+_ay, output_z+_az, 2 );
	_closest = min( _closest, _dist );
	
}