if ( ( !GRIP_ON || ( grip_get_current() == "2d" ) ) && ( MOUSE_CURSOR_SPRITE != undefined ) ) {
    draw_sprite( MOUSE_CURSOR_SPRITE, control_get( 0, "state", "mouse" ) & CTRL_HELD,
                                      control_get( 0, "mouse", "point x" ),
                                      control_get( 0, "mouse", "point y" ) );
}