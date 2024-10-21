// Feather disable all
//Whether to allow Dynamo's live updating features to operate
//You should set this to <false> when releasing builds
#macro DYNAMO_ENABLED  true

//Whether to automatically scan for changes to files
//This is very convenient! But sometimes not what you want
//If you turn this off you'll need to call DynamoForceScan() to rescan files for changes and
//then reload as necessary
#macro DYNAMO_AUTO_SCAN  true

//Whether to progressively scan through tracked data looking for changes
//The alternative is for Dynamo to only scan for changes when the window regains focus
//This macro is forced to <true> on MacOS due to bugs in GameMaker
#macro DYNAMO_AUTO_SCAN_PROGRESSIVE  true

//Whether to show extended debug information in the debug log
//This can be useful to track down problems when using Dynamo
#macro DYNAMO_VERBOSE  true

//Values in CSV files cells are inherently strings
//This macro control whether Dynamo should try to convert values in CSV files into numbers
#macro DYNAMO_CSV_TRY_REAL  false
