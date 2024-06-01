var _id = string(async_load[? "id"]);
if (variable_struct_exists(__SnitchState().__HTTPRequests, _id))
{
    //Pass the response into the request's response handler
    __SnitchState().__HTTPRequests[$ _id].__HTTPResponse(async_load[? "http_status"], async_load[? "status"]);
    
    //Output extra details if there was a failure to submit a request
    if (SNITCH_OUTPUT_HTTP_FAILURE_DETAILS && (async_load[? "http_status"] != 200) && (async_load[? "http_status"] != 204))
    {
        var _result = async_load[? "result"];
        try
        {
            var _json = json_parse(_result);
            __SnitchTrace("Result was:\n", __SnitchSNAPtoJSON(_json, true, true));
        }
        catch(_error)
        {
            __SnitchTrace("Result was: \"", _result, "\"");
        }
    }
}