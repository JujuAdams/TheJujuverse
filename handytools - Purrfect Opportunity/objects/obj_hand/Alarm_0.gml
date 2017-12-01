ds_list_add( path        , x, y+10 );
ds_list_add( source_path , x, y+10 );
ds_list_add( scritch_path, x, y+10 );

if ( y > obj_barrier_line.y ) cross_index = ds_list_size( path )-2;
if ( hand_t < 1 ) alarm[0] = 3;