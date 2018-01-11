ds_priority_destroy( light_priority );

if ( deferred_composite_surface_a != undefined ) {
    tr_surface_set_protect( deferred_composite_surface_a, false );
    tr_surface_free( deferred_composite_surface_a );
}

if ( deferred_composite_surface_b != undefined ) {
    tr_surface_set_protect( deferred_composite_surface_b, false );
    tr_surface_free( deferred_composite_surface_b );
}