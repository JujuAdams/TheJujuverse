/// @description Toggles fullscreen mode using the RESOLUTION service

with( obj_resolution ) {
    if ( operation == E_RESOLUTION_OPERATION.NONE ) {
        operation = E_RESOLUTION_OPERATION.FULLSCREEN_TOGGLE;
        return true;
    }
}
return false;