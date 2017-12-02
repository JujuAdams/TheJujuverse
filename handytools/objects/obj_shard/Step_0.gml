rotation += rotation_speed;

velocity_x *= 0.82;
velocity_y *= 0.82;
velocity_z *= 0.82;

x += velocity_x;
y += velocity_y;
z += velocity_z;

if ( place_meeting( x, y, obj_wall ) ) {
    x = xprevious;
    y = yprevious;
}