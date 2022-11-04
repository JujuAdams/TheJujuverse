#macro __DYNAMO_VERSION         "2.2.1"
#macro __DYNAMO_PARSER_VERSION  "2.0"
#macro __DYNAMO_DATE            "2022-10-28"
#macro __DYNAMO_DEV_MODE        (DYNAMO_ENABLED && global.__dynamoRunningFromIDE)

__DynamoTrace("Welcome to Dynamo by @jujuadams! This is version ", __DYNAMO_VERSION, ", ", __DYNAMO_DATE);
global.__dynamoRunningFromIDE = false;



__DynamoInitialize();

function __DynamoInitialize()
{
    //Don't initialize twice
    if (variable_global_exists("__dynamoProjectDirectory")) return;
    
    //Attempt to set up a time source for slick automatic input handling
    time_source_start(time_source_create(time_source_global, 1, time_source_units_frames, __DynamoAutoScan, [], -1));
    
    global.__dynamoRunningFromIDE   = (GM_build_type == "run");
    global.__dynamoProjectDirectory = filename_dir(GM_project_filename) + "\\";
    
    global.__dynamoScriptArray     = [];
    global.__dynamoScriptStruct    = {};
    global.__dynamoFileArray       = [];
    global.__dynamoFileStruct      = {};
    global.__dynamoNoteArray       = [];
    global.__dynamoNoteStruct      = {};
    global.__dynamoNoteAddedStruct = {};
    global.__dynamoTrackingArray   = [];
    global.__dynamoNoteDataExists  = false;
    
    global.__dynamoInFocus    = false;
    global.__dynamoCheckIndex = 0;
    
    //Verify the directory just in case
    if (__DYNAMO_DEV_MODE && !directory_exists(global.__dynamoProjectDirectory))
    {
        __DynamoError("Could not find project directory \"", global.__dynamoProjectDirectory, "\"\nYou may need to run the GameMaker IDE in administrator mode");
    }
    
    if (DYNAMO_VERBOSE) __DynamoTrace("Found project path \"", global.__dynamoProjectDirectory, "\"");
    
    __DynamoReadNoteData();
}



function __DynamoTrace()
{
    var _string = "";
    var _i = 0;
    repeat(argument_count)
    {
        _string += string(argument[_i]);
        ++_i;
    }
    
    show_debug_message("Dynamo: " + _string);
}



function __DynamoError()
{
    var _string = "";
    var _i = 0;
    repeat(argument_count)
    {
        _string += string(argument[_i]);
        ++_i;
    }
    
    show_error("Dynamo:\n\n" + _string + "\n ", true);
}