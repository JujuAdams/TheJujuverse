ds_priority_destroy( light_priority );

if ( deferred_composite_surface != undefined ) {
    tr_surface_set_protect( deferred_composite_surface, false );
    tr_surface_free( deferred_composite_surface );
}