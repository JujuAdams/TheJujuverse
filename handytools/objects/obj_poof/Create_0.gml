event_inherited();

z = 0;

dotobj_animation_create( "destroy", "poof 0", 17,
                                    "poof 1", 17,
                                    "poof 2", 17,
                                    "poof 3", 17,
                                    "poof 4", 33,
                                    "poof 5", 33 );
dotobj_animation_play( "main", "destroy", 0.25 );