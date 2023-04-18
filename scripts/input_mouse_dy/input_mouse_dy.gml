/// @desc    Returns how far the mouse has moved on the y-axis between frames
///          The coordinate space should be a member of the INPUT_COORD_SPACE enum:
///              .ROOM      Room coordinates; should be the same as mouse_x and mouse_y. This is the default value
///              .GUI       GUI coordinates
///              .DEVICE    Raw device-space coordinates
/// 
/// @param [coordSpace]  Coordinate space to use. If not specified, the coordinate space set by input_mouse_coord_space_set() is used

function input_mouse_dy(_coord_space = global.__input_pointer_coord_space)
{
    return global.__input_pointer_dy[_coord_space];
}