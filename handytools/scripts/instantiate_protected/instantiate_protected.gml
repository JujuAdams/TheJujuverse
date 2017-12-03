if ( !instance_exists( argument0 ) ) {
	return tr_instance_create_depth( 0, 0, 0, argument0, "instantiate_protected(" + object_get_name( argument0 ) + ")", true );
}
return noone;