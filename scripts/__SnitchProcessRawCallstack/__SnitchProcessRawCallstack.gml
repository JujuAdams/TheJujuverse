function __SnitchProcessRawCallstack(_rawCallstack, _serviceMode)
{
    var _callstack = [];
    
    var _i = array_length(_rawCallstack) - 1;
    repeat(array_length(_rawCallstack))
    {
        var _script = _rawCallstack[_i];
        if (is_real(_script))
        {
            --_i;
            continue;
        }
        
        var _lineText = "";
        var _linePos = string_pos(":", _script);
        if (_linePos > 0)
        {
            _lineText = string_copy(_script, _linePos + 1, string_length(_script) - _linePos);
        }
        else
        {
            _linePos = string_pos(" (line ", _script);
            if (_linePos > 0) _lineText = string_copy(_script, _linePos + 7, string_length(_script) - (_linePos + 7));
        }
        
        if (_linePos > 0)
        {
            var _func = string_copy(_script, 1, _linePos - 1);
            var _module = _func;
            
            try
            {
                var _lineNumber = real(_lineText);
            }
            catch(_)
            {
                var _lineNumber = 0;
            }
            
            
            if (string_pos("gml_Script_", _func) == 1)
            {
                var _isScript = true;
                
                _func = string_delete(_func, 1, 11);
                _module = _func
            }
            else if (string_pos("gml_Object_", _func) == 1)
            {
                var _isScript = false;
                
                _func = string_delete(_func, 1, 11);
                
                var _pos = string_last_pos("_", _func);
                _pos = string_last_pos_ext("_", _func, _pos - 1);
                
                _module = string_delete(_func, 1, _pos);
                _func = string_copy(_func, 1, _pos - 1);
            }
            
            switch(_serviceMode)
            {
                case 0: //No service
                    array_push(_callstack, _isScript? (_func + ":L" + _lineText) : (_func + ":" + _module + ":L" + _lineText));
                break;
                
                case 1: //sentry.io
                    var _frame = {};
                    _frame.module        = _module;
                    _frame[$ "function"] = _func;
                    _frame.lineno        = _lineNumber;
                    array_push(_callstack, _frame);
                break;
                
                case 2: //GameAnalytics
                    array_push(_callstack, _func + (_isScript? "" : (" " + _module)) + " L" + string(_lineNumber));
                break;
                
                case 3: //Bugsnag
                    var _frame = {};
                    _frame.file       = _module;
                    _frame.method     = _func;
                    _frame.lineNumber = _lineNumber;
                    array_push(_callstack, _frame);
                break;
            }
        }
        
        --_i;
    }
    
    return _callstack;
}