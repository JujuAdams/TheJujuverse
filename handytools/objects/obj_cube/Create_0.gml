event_inherited();

z = 0;
/*
var _mesh_array = vertex_buffer_triangle_array( dotobj_model( "cube" ) );

var _px = 0.5;
var _py = 0.5;
var _pz = 0.5;
var _pr = distance_from_point_to_mesh( _mesh_array,   _px, _py, _pz );

var _local_pri = ds_priority_create();
var _x_stack = ds_queue_create();
var _y_stack = ds_queue_create();
var _z_stack = ds_queue_create();
var _r_stack = ds_queue_create();
var _i_stack = ds_queue_create();
var _d_stack = ds_queue_create();
ds_queue_enqueue( _x_stack, _px );
ds_queue_enqueue( _y_stack, _py );
ds_queue_enqueue( _z_stack, _pz );
ds_queue_enqueue( _r_stack, _pr );
ds_queue_enqueue( _i_stack,   0 );
ds_queue_enqueue( _d_stack,   1 );

var _sphere_array_size = 4;
var _sphere_array;
_sphere_array[0] = _px;
_sphere_array[1] = _py;
_sphere_array[2] = _pz;
_sphere_array[3] = _pr;

while( !ds_queue_empty( _x_stack ) ) {
    
    var _sphere_x = ds_queue_dequeue( _x_stack );
    var _sphere_y = ds_queue_dequeue( _y_stack );
    var _sphere_z = ds_queue_dequeue( _z_stack );
    var _sphere_r = ds_queue_dequeue( _r_stack );
    var _sphere_i = ds_queue_dequeue( _i_stack );
    var _sphere_d = ds_queue_dequeue( _d_stack );
    
    if ( _sphere_d > 1 ) continue;
    
    var _local_sphere_size = 0;
    var _local_sphere = undefined;
    ds_priority_clear( _local_pri );
        
    var _repeat = true;
    repeat( 100 ) {
            
        var _point = random_point_on_sphere();
        var _dx = _point[0];
        var _dy = _point[1];
        var _dz = _point[2];
            
        var _radius_offset = 0.9*_sphere_r + _pr;
        var _px = _sphere_x + _dx*_radius_offset;
        var _py = _sphere_y + _dy*_radius_offset;
        var _pz = _sphere_z + _dz*_radius_offset;
        var _pr = _sphere_r;
        
        //if ( sphere_collides_with_sphere_array( _sphere_array,   _px, _py, _pz, _pr,   _sphere_i ) ) continue;
        
        do {
            var _new_r = distance_from_point_to_mesh( _mesh_array,   _px, _py, _pz );
            var _radius_offset = 0.9*_sphere_r + _new_r
            var _px = _sphere_x + _dx*_radius_offset;
            var _py = _sphere_y + _dy*_radius_offset;
            var _pz = _sphere_z + _dz*_radius_offset;
            var _pr = _new_r;
            
            var _percent = 100*abs( _new_r - _pr )/_pr;
        } until ( _percent < 1 ) || ( _new_r < 0.2 );
        if ( _new_r < 0.2 ) continue;
        
        ds_priority_add( _local_pri, _local_sphere_size, _pr );
        _local_sphere[ _local_sphere_size   ] = _px;
        _local_sphere[ _local_sphere_size+1 ] = _py;
        _local_sphere[ _local_sphere_size+2 ] = _pz;
        _local_sphere[ _local_sphere_size+3 ] = _pr;
        _local_sphere_size += 4;
        
    }
    
    var _try_count = 3;
    repeat( ds_priority_size( _local_pri ) ) {
        
        var _i = ds_priority_delete_max( _local_pri );
        _px = _local_sphere[ _i   ];
        _py = _local_sphere[ _i+1 ];
        _pz = _local_sphere[ _i+2 ];
        _pr = _local_sphere[ _i+3 ];
        
        if ( sphere_collides_with_sphere_array( _sphere_array,   _px, _py, _pz, _pr,   _sphere_i ) ) continue;
        
        ds_queue_enqueue( _x_stack, _px );
        ds_queue_enqueue( _y_stack, _py );
        ds_queue_enqueue( _z_stack, _pz );
        ds_queue_enqueue( _r_stack, _pr );
        ds_queue_enqueue( _i_stack, _sphere_array_size );
        ds_queue_enqueue( _d_stack, _sphere_d+1 );
    
        _sphere_array[ _sphere_array_size   ] = _px;
        _sphere_array[ _sphere_array_size+1 ] = _py;
        _sphere_array[ _sphere_array_size+2 ] = _pz;
        _sphere_array[ _sphere_array_size+3 ] = _pr;
        _sphere_array_size += 4;
        
        _try_count--;
        if ( _try_count <= 0 ) break;
    
    }
    
}
ds_queue_destroy( _x_stack );
ds_queue_destroy( _y_stack );
ds_queue_destroy( _z_stack );
ds_queue_destroy( _r_stack );
ds_queue_destroy( _i_stack );
ds_queue_destroy( _d_stack );



var _a = vertex_create_buffer();
for( var _i = 0; _i < _sphere_array_size; _i += 4 ) {
    var _b = vertex_buffer_add( _a, global.vbf_sphere,
                                _sphere_array[_i  ], _sphere_array[_i+1], _sphere_array[_i+2],
                                _sphere_array[_i+3] );
    vertex_delete_buffer( _a );
    _a = _b;
}
collision_model = _a;
vertex_freeze( collision_model );
*/