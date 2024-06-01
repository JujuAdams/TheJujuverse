var _snitchState = __SnitchState();

_snitchState.__Frames++;

if (!os_is_paused() && window_has_focus())
{
    _snitchState.__FocusFrames++;
    _snitchState.__FocusTime += delta_time/1000;
}

if (SNITCH_NETWORK_MODE == 2)
{
    if (_snitchState.__NetworkConnected)
    {
        //Churn through the pending messages and clear them out
        repeat(ceil(sqrt(array_length(_snitchState.__NetworkPendingMessages))))
        {
            __SnitchSendStringToNetwork(_snitchState.__NetworkPendingMessages[0]);
            array_delete(_snitchState.__NetworkPendingMessages, 0, 1);
        }
    }
}

if (_snitchState.__RequestBackupFailures < SNITCH_REQUEST_BACKUP_RESEND_MAX_FAILURES)
{
    if (current_time - _snitchState.__RequestBackupResendTime > SNITCH_REQUEST_BACKUP_RESEND_DELAY)
    {
        var _backupCount = array_length(_snitchState.__RequestBackupOrder);
        if (_backupCount > 0)
        {
            //Step round the request backup array
            _snitchState.__RequestBackupResendIndex = (_snitchState.__RequestBackupResendIndex + 1) mod _backupCount;
            
            //Pull out a backup...
            var _uuid = _snitchState.__RequestBackupOrder[_snitchState.__RequestBackupResendIndex];
            with(_snitchState.__RequestBackups[$ _uuid])
            {
                //...and if we're not waiting for a response for this particular request, resend it
                if (asyncID < 0)
                {
                    if (SNITCH_REQUEST_BACKUP_OUTPUT_ATTEMPT) __SnitchTrace("Trying to resend event ", _uuid);
                    
                    switch(SNITCH_SERVICE_MODE)
                    {
                        case 1: __SnitchSentryHTTPRequest(self);        break;
                        case 2: __SnitchGameAnalyticsHTTPRequest(self); break;
                        case 3: __SnitchBugsnagHTTPRequest(self);       break;
                        case 4: __SnitchGenericHTTPRequest(self);       break;
                    }
                    
                    _snitchState.__RequestBackupResendTime = current_time;
                }
            }
        }
    }
}
else
{
    if (current_time - _snitchState.__RequestBackupResendTime > SNITCH_REQUEST_BACKUP_RESEND_FAILURE_TIMEOUT)
    {
        _snitchState.__RequestBackupFailures = 0;
        __SnitchTrace("Retrying backup resending");
    }
}