///mouse_active_step()

mouse_over = false;
mouse_clicked = false;

if ( global.click_instance_over == id ) {
    if ( mouse_glow == 0 ) mouse_glow_start = current_time;
    mouse_over = true;
}

if ( mouse_over ) {
    mouse_glow = 0.5 + 0.5*dsin( ( current_time - mouse_glow_start )/2 );
    if ( mouse_check_button_pressed( mb_left ) ) {
        mouse_down = true;
    } else if ( mouse_down && !mouse_check_button( mb_left ) ) {
        mouse_clicked = true;
        mouse_down = false;
    }
} else {
    mouse_glow = 0;
    mouse_down = false;
}

if ( !mouse_interactible ) mouse_clicked = false;
mouse_selected = false;