function __db_class() constructor
{
    __metadata  = undefined;
    __data      = undefined;
    __changed   = false;
    __timestamp = date_current_datetime();
    
    static toString = function()
    {
        return "<database " + string(ptr(self)) + ">";
    }
}

show_debug_message("Welcome to db by @jujuadams! This is version 1.0.0, 2023-04-17");