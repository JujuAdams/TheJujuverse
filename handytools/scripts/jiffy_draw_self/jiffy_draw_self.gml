/// @description JIFFY-compatible Draw code

if ( sprite_exists( sprite_index ) ) {
    draw_sprite_ext( sprite_index, image_index,
                     lerp( xprevious, x, global.jiffy_render_alpha ),
                     lerp( yprevious, y, global.jiffy_render_alpha ),
                     image_xscale, image_yscale, image_angle,
                     image_blend, image_alpha );
}