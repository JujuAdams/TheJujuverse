//Redirect exception_unhandled_handler() to our own internal function
//The bound exception handler will still be executed
#macro exception_unhandled_handler      __SnitchCrashSetGMHandler
#macro __exception_unhandled_handler__  exception_unhandled_handler



function __SnitchCrashSetGMHandler(_function)
{
    global.__snitchGMExceptionHandler = _function;
}