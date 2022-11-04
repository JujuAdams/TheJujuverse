/// @func Pinocchio(rulesStruct)
/// @desc Constructor that creates a Pinocchio "puppet" struct, a generic animation handler
/// @param ruleset    The animation rules to use. See below for more information
/// 
/// Please see the included "Pinocchio Documentation" note for documentation
/// 
/// N.B. The .Update() method must be called every frame for puppets to update variables properly!



function Pinocchio(_ruleset) constructor
{
    if (!is_struct(_ruleset)) __Error("Ruleset provided is not a struct (was \"", typeof(_ruleset), "\")");
    __ruleset = _ruleset;
    
    __previousRealtime = current_time;
    
    __transitionTime        = 0;
    __transitionDuration    = 0;
    __transitionStartValues = undefined;
    __transitionEndValues   = undefined;
    __transitionCallback    = undefined;
    __transitionCurves      = undefined;
    
    __finalizingLock = false;
    __finalizeReset  = false;
    __finalized      = false;
    
    __currentStateTime = undefined;
    __currentStateName = undefined;
    __currentState     = undefined;
    
    __nextStateName = undefined;
    __nextState     = undefined;
    __nextDelay     = 0;
    
    __queuedStateName   = undefined;
    __queuedDelayOffset = 0;
    __queuedCallback    = undefined;
    
    __stateVariableNameDictionary = {};
    
    
    
    #region Initialization
    
    if (PINOCCHIO_SAFE_MODE)
    {
        var _variableUseCountMap = ds_map_create();
    }
    
    var _stateNames = variable_struct_get_names(__ruleset);
    var _i = 0;
    repeat(array_length(_stateNames))
    {
        var _stateName = _stateNames[_i];
        if (_stateName == PINOCCHIO_TRANSITION_WILDCARD_STATE) __Error("States cannot use \"", PINOCCHIO_TRANSITION_WILDCARD_STATE, "\" (PINOCCHIO_TRANSITION_WILDCARD_STATE) as a state name");
        
        var _state = __ruleset[$ _stateName];
        if (!is_struct(_state)) __Error("State/transition definition for \"", _stateName, "\" is not a struct (was \"", typeof(_state), "\")");
        
        if (PINOCCHIO_SAFE_MODE && (_state == PINOCCHIO_TRANSITION_WILDCARD_STATE))
        {
            __Error("State names cannot be the same as the transition wildcard (\"", PINOCCHIO_TRANSITION_WILDCARD_STATE, "\")");
        }
        
        var _variableNamesArray = variable_struct_get_names(_state);
        __stateVariableNameDictionary[$ _stateName] = _variableNamesArray;
        
        var _j = 0;
        repeat(array_length(_variableNamesArray))
        {
            var _variableName = _variableNamesArray[_j];
            
            if ((_variableName == "duration") || (_variableName == "delay"))
            {
                //Ignore variables called "duration" or "delay"
                if (PINOCCHIO_SAFE_MODE && (string_pos(PINOCCHIO_TRANSITION_SUBSTRING, _stateName) <= 0)) __Error("States cannot use \"", _variableName, "\" as a variable name");
            }
            else if (PINOCCHIO_SAFE_MODE && (string_copy(_variableName, 1, 2) == "__"))
            {
                //Ignore variables that start with __ as they might conflict with private Pinocchio variables/methods
                __Error("Variables cannot start with \"__\"");
            }
            else
            {
                if (PINOCCHIO_SAFE_MODE)
                {
                    //Final verbose check for method name collisions
                    switch(_variableName)
                    {
                        case "Update":       case "Goto":
                        case "Set":          case "Finalize":
                        case "Skip":         case "Cancel":
                        case "CancelQueued": case "GetProgress":
                        case "GetCurrent":   case "GetNext":
                        case "GetQueued":    case "GetFinalized":
                            __Error("Variable names (\"" + string(_variableName) + "\") cannot be the same as puppet methods");
                        break;
                    }
                }
                
                //We do *not* want to default to <undefined> here because we need to interpolate values
                self[$ _variableName] = 0;
                
                if (PINOCCHIO_SAFE_MODE)
                {
                    var _count = _variableUseCountMap[? _variableName];
                    _variableUseCountMap[? _variableName] = (_count == undefined)? 1 : (_count + 1);
                }
            }
            
            ++_j;
        }
        
        ++_i;
    }
    
    if (PINOCCHIO_SAFE_MODE)
    {
        var _keyArray   = ds_map_keys_to_array(  _variableUseCountMap);
        var _valueArray = ds_map_values_to_array(_variableUseCountMap);
        var _i = 0;
        repeat(array_length(_valueArray))
        {
            if (_valueArray[_i] <= 1) show_debug_message("Pinocchio: Warning! Variable \"" + string(_keyArray[_i]) + "\" was only used once. This could be due to a spelling error");
            ++_i;
        }
        
        ds_map_destroy(_variableUseCountMap);
        
        if (!variable_struct_exists(__ruleset, PINOCCHIO_INITIAL_STATE_NAME))
        {
            __Error("Initial state \"" + string(PINOCCHIO_INITIAL_STATE_NAME) + "\" was not found");
        }
    
        if (!variable_struct_exists(__ruleset, PINOCCHIO_FINAL_STATE_NAME))
        {
            show_debug_message("Pinocchio: Warning! Final state \"" + string(PINOCCHIO_FINAL_STATE_NAME) + "\" was not found");
        }
    }
    
    Set(PINOCCHIO_INITIAL_STATE_NAME);
    
    #endregion
    
    
    
    #region Methods
    
    static Set = function(_stateName)
    {
        if (__finalizingLock) return self;
        
        __finalized = false;
        
        if (!variable_struct_exists(__ruleset, _stateName)) __Error("State \"", _stateName, "\" doesn't exist in ruleset");
        
        __currentStateName = _stateName;
        __currentState     = __ruleset[$ __currentStateName];
    
        __transitionStartValues = undefined;
        __transitionEndValues   = undefined;
        
        __nextStateName = undefined;
        __nextState     = undefined;
        __nextDelay     = 0;
        __transitionCallback  = undefined;
        __transitionCurves    = undefined;
        
        __queuedStateName   = undefined;
        __queuedDelayOffset = 0;
        __queuedCallback    = undefined;
        
        var _variableNames = __stateVariableNameDictionary[$ __currentStateName];
        var _i = 0;
        repeat(array_length(_variableNames))
        {
            var _variableName = _variableNames[_i];
            self[$ _variableName] = __currentState[$ _variableName];
            ++_i;
        }
        
        return self;
    }
    
    static Goto = function(_stateName, _delayOffset = 0, _callback = undefined)
    {
        if (__finalizingLock) return self;
        
        __finalized = false;
        
        if (!variable_struct_exists(__ruleset, _stateName)) __Error("State \"", _stateName, "\" doesn't exist in ruleset");
        
        if ((__nextState == undefined) && (__currentStateName != _stateName))
        {
            __nextStateName = _stateName;
            __nextState     = __ruleset[$ __nextStateName];
            __nextDelay     = _delayOffset;
            __transitionCallback  = _callback;
            
            //Create a record of the current variable values
            __transitionStartValues = {};
            __CopyPartialState(self, __transitionStartValues, __stateVariableNameDictionary[$ __nextStateName]);
            
            //Create a set of target values to interpolate towards
            __transitionEndValues = {};
            __CopyPartialState(self, __transitionEndValues, __stateVariableNameDictionary[$ __nextStateName]);
            __EvaluateAllStateVariables(__transitionEndValues, __nextStateName, __nextState, 0);
            
            //Find the curves that control the transition from the current state to the next one
            __transitionCurves = __ruleset[$ __currentStateName + PINOCCHIO_TRANSITION_SUBSTRING + __nextStateName];
            if (__transitionCurves == undefined) __transitionCurves = __ruleset[$ PINOCCHIO_TRANSITION_WILDCARD_STATE + PINOCCHIO_TRANSITION_SUBSTRING + __nextStateName];
            if (__transitionCurves == undefined) __transitionCurves = __ruleset[$ __currentStateName + PINOCCHIO_TRANSITION_SUBSTRING + PINOCCHIO_TRANSITION_WILDCARD_STATE];
            if (__transitionCurves == undefined) __transitionCurves = __ruleset[$ PINOCCHIO_TRANSITION_WILDCARD_STATE + PINOCCHIO_TRANSITION_SUBSTRING + PINOCCHIO_TRANSITION_WILDCARD_STATE];
            
            __transitionTime = 0;
            __transitionDuration = (__transitionCurves == undefined)? undefined : __transitionCurves[$ "duration"];
            if (__transitionDuration == undefined) __transitionDuration = PINOCCHIO_DEFAULT_DURATION;
            
            var _delay = (__transitionCurves == undefined)? 0 : __transitionCurves[$ "delay"];
            if (_delay != undefined) __nextDelay += _delay;
        }
        else if ((__nextStateName != _stateName) && (__nextState != undefined))
        {
            __queuedStateName   = _stateName;
            __queuedDelayOffset = _delayOffset;
            __queuedCallback    = _callback;
        }
        
        return self;
    }
    
    static Update = function(_stepSize = 1)
    {
        if (PINOCCHIO_USE_MILLISECONDS)
        {
            var _increment = _stepSize*(current_time - __previousRealtime);
            __previousRealtime = current_time;
        }
        else
        {
            var _increment = _stepSize;
        }
        
        if (__nextState == undefined)
        {
            __currentStateTime += _increment;
            __EvaluateMethodStateVariables(self, __currentStateName, __currentState, __currentStateTime);
        }
        else
        {
            __transitionTime += _increment;
            
            var _t = GetProgress();
            if (_t < 1)
            {
                //Do some interpolation :D
                var _variableNames = __stateVariableNameDictionary[$ __nextStateName];
                var _i = 0;
                repeat(array_length(_variableNames))
                {
                    var _variableName = _variableNames[_i];
                    
                    var _curve = !is_struct(__transitionCurves)? undefined : __transitionCurves[$ _variableName];
                    switch(_curve)
                    {
                        case undefined:               var _q = _t;       break; //Default to linear
                        case PINOCCHIO_CURVE_NONE:    var _q = 0;        break;
                        case PINOCCHIO_CURVE_INSTANT: var _q = (_t > 0); break;
                        
                        default:
                            if (is_array(_curve))
                            {
                                var _q = __GetBezier(_curve, _t);
                            }
                            else if (is_method(_curve))
                            {
                                var _q = _curve(_t);
                            }
                            else if (is_numeric(_curve))
                            {
                                var _q = animcurve_channel_evaluate(animcurve_get_channel(_curve, 0), _t);
                            }
                            else
                            {
                                __Error("Curve type \"" + string(_curve) + "\" not recognised");
                            }
                        break;
                    }
                    
                    self[$ _variableName] = lerp(__transitionStartValues[$ _variableName], __transitionEndValues[$ _variableName], _q);
                    
                    ++_i;
                }
            }
            else //We've finished the animation!
            {
                __currentStateTime = 0;
                __currentStateName = __nextStateName;
                __currentState     = __nextState;
                
                __EvaluateAllStateVariables(self, __currentStateName, __currentState, __currentStateTime);
                
                if (__currentStateName == PINOCCHIO_FINAL_STATE_NAME)
                {
                    __finalized = true;
                    if (__finalizeReset) __finalizingLock = false;
                }
                
                if (is_method(__transitionCallback))
                {
                    __transitionCallback();
                }
                else if (is_numeric(__transitionCallback) && script_exists(__transitionCallback))
                {
                    script_execute(__transitionCallback);
                }
                
                __transitionStartValues = undefined;
                __transitionEndValues   = undefined;
                __transitionCallback    = undefined;
                __transitionCurves      = undefined;
                
                __nextStateName = undefined;
                __nextState     = undefined;
                __nextDelay     = 0;
                
                //If we have a queued animation
                if (__queuedStateName != undefined)
                {
                    var _wasLocked = false;
                    if (__finalizingLock)
                    {
                        _wasLocked = true;
                        __finalizingLock = false;
                    }
                    
                    Goto(__queuedStateName, __queuedDelayOffset, __queuedCallback);
                    CancelQueued();
                    
                    if (_wasLocked) __finalizingLock = true;
                }
                else if (__finalizeReset && (__currentStateName == PINOCCHIO_FINAL_STATE_NAME) && variable_struct_exists(__ruleset, PINOCCHIO_INITIAL_STATE_NAME))
                {
                    __finalizeReset = false;
                    Set(PINOCCHIO_INITIAL_STATE_NAME);
                }
            }
        }
    }
    
    static Cancel = function()
    {
        if (__finalizingLock) return self;
        if (__nextState == undefined) return self;
        
        //Reset variables
        __EvaluateAllStateVariables(__transitionStartValues, __currentStateName, __currentState, __currentStateTime);
        __CopyPartialState(__transitionStartValues, self, variable_struct_get_names(__transitionStartValues));
        
        __transitionStartValues = undefined;
        __transitionEndValues   = undefined;
        
        __nextState     = undefined;
        __nextDelay     = 0;
        __transitionCallback  = undefined;
        __transitionCurves    = undefined;
        
        return self;
    }
    
    static CancelQueued = function()
    {
        if (__finalizingLock) return self;
        
        __queuedStateName   = undefined;
        __queuedDelayOffset = undefined;
        __queuedCallback    = undefined;
        
        return self;
    }
    
    static Finalize = function(_reset = false)
    {
        CancelQueued();
        Goto(PINOCCHIO_FINAL_STATE_NAME);
        
        __finalizingLock = true;
        __finalizeReset  = _reset;
    }
    
    static Skip = function(_immediate = true)
    {
        __transitionTime = infinity;
        if (_immediate) Update();
        
        return self;
    }
    
    #endregion
    
    
    
    #region Getters
    
    static GetProgress = function()
    {
        if (__nextState == undefined) return 1.0;
        return clamp((__transitionTime - __nextDelay) / __transitionDuration, 0, 1);
    }
    
    static GetCurrent = function()
    {
        return __currentStateName;
    }
    
    static GetNext = function()
    {
        return __nextStateName;
    }
    
    static GetQueued = function()
    {
        return __queuedStateName;
    }
    
    static GetFinalized = function()
    {
        return __finalized;
    }
    
    #endregion
    
    
    
    #region Private
    
    static __CopyPartialState = function(_source, _destination, _variableNames)
    {
        var _i = 0;
        repeat(array_length(_variableNames))
        {
            var _variableName = _variableNames[_i];
            _destination[$ _variableName] = _source[$ _variableName];
            ++_i;
        }
    }
    
    //Only set all variables in a state
    static __EvaluateAllStateVariables = function(_destination, _stateName, _state, _stateTime)
    {
        var _variableNames = __stateVariableNameDictionary[$ _stateName];
        var _i = 0;
        repeat(array_length(_variableNames))
        {
            var _variableName = _variableNames[_i];
            
            var _value = _state[$ _variableName];
            if (is_method(_value))
            {
                var _value = _value(_stateTime);
                if (PINOCCHIO_SAFE_MODE && !is_numeric(_value)) __Error("Method returned non-numeric value");
            }
            
            _destination[$ _variableName] = _value;
            
            ++_i;
        }
    }
    
    //Only set variables in a state if they're associated with methods, and ignore non-dynamic values
    static __EvaluateMethodStateVariables = function(_destination, _stateName, _state, _stateTime)
    {
        var _variableNames = __stateVariableNameDictionary[$ _stateName];
        var _i = 0;
        repeat(array_length(_variableNames))
        {
            var _variableName = _variableNames[_i];
            
            var _value = _state[$ _variableName];
            if (is_method(_value))
            {
                _value = _value(_stateTime);
                if (PINOCCHIO_SAFE_MODE && !is_numeric(_value)) __Error("Method returned non-numeric value");
                _destination[$ _variableName] = _value;
            }
            
            ++_i;
        }
    }
    
    static __Error = function()
    {
        var _string = "Pinocchio:\n";
        var _i = 0;
        repeat(argument_count)
        {
            _string += string(argument[_i]);
            ++_i;
        }
        
        show_error(_string + "\n ", true);
    }
    
    static __GetBezier = function(_definitionArray, _position)
    {
    	if (_position <= 0) return 0;
    	if (_position >= 1) return 1;
        
        if (array_length(_definitionArray) != 4)
        {
            __Error("Bezier curve definitions should have 2 control points (array should have 4 elements)");
            return 0;
        }
        
        static _bezierCache = ds_map_create();
        var _bezierData = _bezierCache[? string(_definitionArray)];
        if (!is_array(_bezierData))
        {
            _bezierData = array_create(PINOCCHIO_BEZIER_CACHE_ACCURACY);
            _bezierCache[? string(_definitionArray)] = _bezierData;
	        _bezierData[@ PINOCCHIO_BEZIER_CACHE_ACCURACY-1] = 1.0;
            
        	var _x1 = _definitionArray[0];
        	var _y1 = _definitionArray[1];
        	var _x2 = _definitionArray[2];
        	var _y2 = _definitionArray[3];
            
        	var _i = 1;
        	repeat(PINOCCHIO_BEZIER_CACHE_ACCURACY-2)
        	{
        	    var _pos = _i / PINOCCHIO_BEZIER_CACHE_ACCURACY;
                
        	    var _p1 = clamp(_x1, 0, 1);
        	    var _p2 = clamp(_x2, 0, 1);
        	    var _t = __BezierSolveCubic(3*_p1 - 3*_p2 + 1, -6*_p1 + 3*_p2, 3*_p1, -_pos);
                
        	    var _inv_t = 1 - _t;
        	    var _t2 = _t*_t;
        	    _bezierData[@ _i] = 3*_t*_inv_t*_inv_t*_y1 + 3*_t2*_inv_t*_y2 + _t2*_t;
                
        	    ++_i;
        	}
        }
        
    	_position *= PINOCCHIO_BEZIER_CACHE_ACCURACY-1;
    	return lerp(_bezierData[floor(_position)], _bezierData[floor(_position)+1], frac(_position));
    }
    
    static __BezierSolveCubic = function(a, b, c, d)
    {
    	if (a == 0)
        {
        	var det = sqrt(c*c - 4*b*d);

        	var result = (-c + det) / (2*b);
        	if ((result >= 0) && (result <= 1)) return result;

        	result = (-c - det) / (2*b);
        	if ((result >= 0) && (result <= 1)) return result;

        	return undefined;
        }
        
    	if (d == 0) return 0;
        
    	b /= a;
    	c /= a;
    	d /= a;
        
    	var q = (3.0 * c - (b*b)) / 9.0;
    	var r = (-27.0 * d + b * (9.0 * c - 2.0 * (b * b))) / 54.0;
    	var disc = q*q*q + r*r;
    	var term1 = b / 3.0;
        
    	if (disc > 0) 
    	{
    	    var s = r + sqrt(disc);
    	    if (s < 0)
    	    {
    	        s = -power(-s, 1/3);
    	    }
    	    else
    	    {
    	        s = power(s, 1/3);
    	    }
            
    	    var t = r - sqrt(disc);
    	    if (t < 0)
    	    {
    	        t = -power(-t, 1/3);
    	    }
    	    else
    	    {
    	        t = power(t, 1/3);
    	    }
            
    	    var result = -term1 + s + t;
    	    if ((result >= 0) && (result <= 1))return result;
    	} 
    	else if (disc == 0) 
    	{
    	    if(r < 0)
    	    {
    	        var r13 = -power(-r, 1/3);
    	    }
    	    else
    	    {
    	        var r13 = power(r, 1/3);
    	    }
            
    	    var result = -term1 + 2.0 * r13;
    	    if ((result >= 0) && (result <= 1)) return result;
            
    	    result = -(r13 + term1);
    	    if ((result >= 0) && (result <= 1)) return result;
    	} 
    	else 
    	{
    	    q = -q;
    	    var dum1 = q*q*q;
    	    dum1 = arccos(r / sqrt(dum1));
    	    var r13 = 2.0 * sqrt(q);
            
    	    var result = -term1 + r13 * cos(dum1 / 3.0);
    	    if ((result >= 0) && (result <= 1)) return result;
            
    	    result = -term1 + r13 *cos((dum1 + 2.0*pi) / 3.0);
    	    if ((result >= 0) && (result <= 1)) return result;
            
    	    result = -term1 + r13 * cos((dum1 + 4.0*pi) / 3.0);
    	    if ((result >= 0) && (result <= 1)) return result;
    	}
        
    	return undefined;
    }
    
    #endregion
}



#macro __PINOCCHIO_VERSION  "1.0.0"
#macro __PINOCCHIO_DATE     "2022-03-07"

show_debug_message("Pinocchio: Welcome to Pinocchio by @jujuadams! This is version " + __PINOCCHIO_VERSION + ", " + __PINOCCHIO_DATE);