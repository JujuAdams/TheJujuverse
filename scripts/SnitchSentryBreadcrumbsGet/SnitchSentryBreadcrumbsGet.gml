// Feather disable all
/// Returns all currently collected breadcrumbs
/// This array will be empty if SNITCH_BREADCRUMBS_MAX is less than, or equal to 0
/// 
/// https://develop.sentry.dev/sdk/event-payloads/breadcrumbs

function SnitchSentryBreadcrumbsGet()
{
    return __SnitchState().__sentryBreadcrumbArray;
}
