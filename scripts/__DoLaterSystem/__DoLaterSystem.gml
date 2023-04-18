#macro __DO_LATER_VERSION  "4.0.0"
#macro __DO_LATER_DATE     "2022-10-15"

global.__doLaterArray = [];
global.__doLaterParent = DO_LATER_DEFAULT_PARENT;

show_debug_message("DoLater: Welcome to DoLater by @jujuadams! This is version " + string(__DO_LATER_VERSION) + ", " + string(__DO_LATER_DATE));

try
{
    time_source_start(time_source_create(time_source_global, 1, time_source_units_frames, function()
    {
        var _i = 0;
        repeat(array_length(global.__doLaterArray))
        {
            var _ts = global.__doLaterArray[_i];
            
            if (!time_source_exists(_ts))
            {
                array_delete(global.__doLaterArray, _i, 1);
            }
            else if (time_source_get_state(_ts) == time_source_state_stopped)
            {
                time_source_destroy(_ts, true);
                array_delete(global.__doLaterArray, _i, 1);
            }
            else
            {
                ++_i;
            }
        }
    }, [], -1));
}
catch(_error)
{
    show_error("DoLater is only supported on GMS2022.5 and later\n ", true);
}