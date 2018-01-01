/// @param triangle_array
/// @param x
/// @param y
/// @param z
/// @param [initial_distance]

var _array   = argument[0];
var _px      = argument[1];
var _py      = argument[2];
var _pz      = argument[3];
var _closest = ((argument_count<5) || ( argument[4]==undefined))? VERY_LARGE : argument[4];

var _size = array_length_1d( _array );
for( var _tri = 0; _tri < _size; _tri += 9 ) {
    
    var _ax = _array[_tri  ];
    var _ay = _array[_tri+1];
    var _az = _array[_tri+2];
    
    var _bx = _array[_tri+3];
    var _by = _array[_tri+4];
    var _bz = _array[_tri+5];
    
    var _cx = _array[_tri+6];
    var _cy = _array[_tri+7];
    var _cz = _array[_tri+8];
    
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
    // N = (I x J)^
    var _nx = _iy*_jz - _iz*_jy;
    var _ny = _iz*_jx - _ix*_jz;
    var _nz = _ix*_jy - _iy*_jx;
    var _n_dist = sqrt( _nx*_nx + _ny*_ny + _nz*_nz );
    if ( _n_dist == 0 ) continue;
    var _n_inv_dist = 1 / _n_dist;
    _nx *= _n_inv_dist;
    _ny *= _n_inv_dist;
    _nz *= _n_inv_dist;
    
    //Project V onto the triangle's plane
    // V.N
    var _dot = _vx*_nx + _vy*_ny + _vz*_nz; //dot_product_3d( _vx, _vy, _vz,    _nx, _ny, _nz );
    var _sx = _vx - _nx*_dot;
    var _sy = _vy - _ny*_dot;
    var _sz = _vz - _nz*_dot;
    
    //Find the distance to the plane early - this is the minimum value the distance ever can be
    var _rx = _sx - _vx;
    var _ry = _sy - _vy;
    var _rz = _sz - _vz;
    var _dist = sqrt( _rx*_rx + _ry*_ry + _rz*_rz );
    
    //Early out
    if ( _dist > _closest ) continue;
    
    // K = N x I
    var _kx = _ny*_iz - _nz*_iy;
    var _ky = _nz*_ix - _nx*_iz;
    var _kz = _nx*_iy - _ny*_ix;
    
    // S.K / J.K
    var _check_j = ( _sx*_kx + _sy*_ky + _sz*_kz ) / ( _jx*_kx + _jy*_ky + _jz*_kz );
    var _check_i = ( _sx - _check_j*_jx ) / _ix;
    
    /*
        |\
        | \
        |  \
        |   \
        L____\
    */
    if ( _check_i < 0 ) {
        
        if ( _check_j < 0 ) {
            //Bottom-left
            _dist = sqrt( _vx*_vx + _vy*_vy + _vz*_vz );
        } else {
            //Left
            var _j_inv_sqr_dist = 1 / ( _jx*_jx + _jy*_jy + _jz*_jz );
            var _t = clamp( (_sx*_jx + _sy*_jy + _sz*_jz) * _j_inv_sqr_dist, 0, 1 );
            _dist = point_distance_3d( _vx, _vy, _vz,   _t*_jx, _t*_jy, _t*_jz );
        }
        
    } else if ( _check_j < 0 ) {
        
        //Below
        var _i_inv_sqr_dist = 1 / ( _ix*_ix + _iy*_iy + _iz*_iz );
        var _t = clamp( (_sx*_ix + _sy*_iy + _sz*_iz) * _i_inv_sqr_dist, 0, 1 );
        _dist = point_distance_3d( _vx, _vy, _vz,   _t*_ix, _t*_iy, _t*_iz );
          
    } else if ( _check_i + _check_j > 1 ) {
        
        //Outside (remember that y=1-x defines the hypotenuese)
        //Shortest distance is always on the line y=x+c
        //Closest point satisfies both equations
        
        // L = J-I
        var _lx = _jx - _ix;
        var _ly = _jy - _iy;
        var _lz = _jz - _iz;
        var _l_sqr_dist = _lx*_lx + _ly*_ly + _lz*_lz;
        
        // (S-I).L
        var _t = clamp( dot_product_3d( _sx-_ix, _sy-_iy, _sz-_iz,   _lx, _ly, _lz ) / _l_sqr_dist, 0, 1 );
        _dist = point_distance_3d( _vx, _vy, _vz,   _t*_lx + _ix, _t*_ly + _iy, _t*_lz + _iz );
        
    }
    
    _closest = min( _closest, _dist );
    
}

return _closest;