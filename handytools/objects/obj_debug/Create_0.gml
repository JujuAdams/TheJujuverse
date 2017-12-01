if ( !DEVELOPMENT ) {
    instance_destroy();
    exit;
}

persistent = true;

zoom_2d = 2;

enum e_tool { select, move, rotate, delete, place, light, size }
global.debug_tool = e_tool.select;