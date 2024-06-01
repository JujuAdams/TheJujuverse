// Feather disable all
/// Adds a custom breadcrumb struct to an array of breadcrumbs which will be send to Sentry whenever the game crashes
/// Read the sentry event payload documentation to find out more about what kind of data this struct can contain
/// 
/// https://develop.sentry.dev/sdk/event-payloads/breadcrumbs
///
/// @param struct  Custom breadcrumb struct

function SnitchSentryBreadcrumbExt(_struct)
{
    if (SNITCH_BREADCRUMBS_MAX <= 0) return;
    
    static _array = __SnitchState().__sentryBreadcrumbArray;
    
    array_push(_array, _struct);
    
    //Automatically add timestamp if struct doesn't have this member
    if (not variable_struct_exists(_struct, "timestamp"))
    {
        _struct.timestamp = SnitchFormatTimestamp(date_current_datetime());
    }
    
    //Prunes oldest breadcrumb if too many exist
    if (array_length(_array) > SNITCH_BREADCRUMBS_MAX)
    {
        array_delete(_array, 0, 1);
    }
}
