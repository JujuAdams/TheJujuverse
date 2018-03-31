event_inherited();

z = 0;

dotobj_animation_create( "test", "shard1", 100, "shard2", 100 );
dotobj_animation_create( "static", "shard1", 100 );
dotobj_animation_play( "main", "test", "static" );