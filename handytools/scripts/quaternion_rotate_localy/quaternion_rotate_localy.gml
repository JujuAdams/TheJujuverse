/// @description Rotates around the model's local y-axis
/// @param quaternion
/// @param angle

return quaternion_multiply( argument0, [ dcos(argument1/2), 0, 0, dsin(argument1/2) ] );