// Feather disable all


function __SnitchServiceName()
{
    switch(SNITCH_SERVICE_MODE)
    {
        case 0: return "None";          break;
        case 1: return "sentry.io";     break;
        case 2: return "GameAnalytics"; break;
        case 3: return "Bugsnag";       break;
        case 4: return "Generic";       break;
        
        default:
            __SnitchError("SNITCH_SERVICE_MODE value ", SNITCH_SERVICE_MODE, " unsupported");
        break;
    }
}
