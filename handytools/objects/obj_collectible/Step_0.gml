image_xscale = lerp( 1, 1.1, dsin_norm( time_offset + current_time*0.3 ) );
image_yscale = image_xscale;
y += 0.1*dsin( current_time*0.2 );