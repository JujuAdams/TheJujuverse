/// Reads in a data struct, setting asset/label/pattern/effect chain/knob definitions as required
/// This is useful for e.g. writing your own live mixing system
/// 
///   N.B. Loading a data struct will wipe any existing config data
/// 
/// @param configData

function VinylSystemReadConfig(_configData)
{
    static _globalData = __VinylGlobalData();
    
    //Effect chain and stack data structures are a bit special because they're never regenerated
    //We keep the old effect chains around so that we can dynamically update effects
    static _effectChainDict  = _globalData.__effectChainDict;
    static _effectChainArray = _globalData.__effectChainArray;
    static _stackDict        = _globalData.__stackDict;
    static _stackArray       = _globalData.__stackArray;
    static _animCurveArray   = _globalData.__animCurveArray;
    
    var _audioAssetArray = undefined;
    
    var _oldKnobDict  = _globalData.__knobDict;
    var _oldLabelDict = _globalData.__labelDict;
    
    //Update our global data structures
    _globalData.__patternDict  = {};
    _globalData.__patternArray = [];
    _globalData.__knobDict     = {};
    _globalData.__knobArray    = [];
    _globalData.__labelDict    = {};
    _globalData.__labelArray   = [];
    
    if (_configData == undefined)
    {
        __VinylTrace("Warning! Config data was <undefined>. No data has been loaded");
        
        var _pattern = new __VinylClassPatternFallback();
        _pattern.__Initialize(undefined);
        _pattern.__Store();
        
        return;
    }
    else if (!is_struct(_configData))
    {
        __VinylError("Config data must be a struct");
    }
    
    //Cache some values for a lil speed up
    var _newPatternDict = _globalData.__patternDict;
    var _newLabelArray  = _globalData.__labelArray;
    
    
    
    //Create new knobs and inherit values where possible
    var _inputKnobDict = _configData[$ "knobs"];
    if (is_undefined(_inputKnobDict))
    {
        __VinylTrace("Warning! \"knobs\" data missing");
    }
    else if (!is_struct(_inputKnobDict))
    {
        __VinylError("\"knobs\" data should be defined as an object (struct)");
    }
    else
    {
        var _knobNameArray = variable_struct_get_names(_inputKnobDict);
        var _i = 0;
        repeat(array_length(_knobNameArray))
        {
            var _knobName = _knobNameArray[_i];
            
            //Create a new knob
            var _newKnob = new __VinylClassKnob(_knobName);
            _newKnob.__Initialize(_inputKnobDict[$ _knobName]);
            _newKnob.__Store();
            _newKnob.__RestoreOldValue(_oldKnobDict);
            
            ++_i;
        }
    }
    
    
    
    //Set up stacks that we find in the incoming data
    var _inputStackDict = _configData[$ "stacks"];
    if (is_undefined(_inputStackDict))
    {
        __VinylTrace("Warning! \"stacks\" data missing");
    }
    else if (!is_struct(_inputStackDict))
    {
        __VinylError("\"stacks\" data should be defined as an object (struct)");
    }
    else
    {
        var _stackNameArray = variable_struct_get_names(_inputStackDict);
        var _i = 0;
        repeat(array_length(_stackNameArray))
        {
            var _stackName = _stackNameArray[_i];
            __VinylStackEnsure(_stackName).__Update(_inputStackDict[$ _stackName]);
            ++_i;
        }
    }
    
    //Clean up any stacks that exist in the old data but weren't in the incoming new data
    var _i = 0;
    repeat(array_length(_stackArray))
    {
        var _stack = _stackArray[_i];
        var _stackName = _stack.__name;
        
        if (!variable_struct_exists(_inputStackDict, _stackName))
        {
            _stack.__Destroy();
            
            variable_struct_remove(_stackDict, _stackName);
            array_delete(_stackArray, _i, 1);
        }
        else
        {
            ++_i;
        }
    }
    
    
    
    //Instantiate labels, creating a dictionary for lookup and an array that contains the order to update the labels to respect parenting
    static _loadLabelsFunc = function(_loadLabelsFunc, _inputLabelDict, _parent)
    {
        var _nameArray = variable_struct_get_names(_inputLabelDict);
        var _i = 0;
        repeat(array_length(_nameArray))
        {
            var _labelName = _nameArray[_i];
            
            if (string_count(" ", _labelName) > 0)
            {
                __VinylTrace("Warning! Label names cannot contain spaces. \"", _labelName, "\" will be ignored");
                ++_i;
                continue;
            }
            
            var _labelData = _inputLabelDict[$ _labelName];
            var _label = new __VinylClassLabel(_labelName, _parent, false);
            _label.__Initialize(_labelData);
            _label.__Store();
            
            if (is_struct(_labelData) && variable_struct_exists(_labelData, "children"))
            {
                var _childrenDict = _labelData[$ "children"];
                if (is_struct(_childrenDict))
                {
                    _loadLabelsFunc(_loadLabelsFunc, _childrenDict, _label);
                }
                else
                {
                    __VinylTrace("Warning! Label \"", _labelName, "\" has an invalid \"children\" dictionary");
                }
            }
            
            ++_i;
        }
    }
    
    var _inputLabelDict = _configData[$ "labels"];
    if (is_undefined(_inputLabelDict))
    {
        __VinylTrace("Warning! \"labels\" data missing");
    }
    else if (!is_struct(_inputLabelDict))
    {
        __VinylError("\"labels\" data should be defined as an object (struct)");
    }
    else
    {
        _loadLabelsFunc(_loadLabelsFunc, _inputLabelDict, undefined);
        
        //Copy state data from old labels to new labels
        var _i = 0;
        repeat(array_length(_newLabelArray))
        {
            var _newLabel = _newLabelArray[_i];
            var _oldLabel = _oldLabelDict[$ _newLabel.__name];
            if (is_struct(_oldLabel)) _newLabel.__CopyOldState(_oldLabel);
            ++_i;
        }
    }
    
    
    
    static _addAssetFunc = function(_newPatternDict, _key, _assetIndex, _patternData)
    {
        if (variable_struct_exists(_newPatternDict, _key))
        {
            __VinylTrace("Warning! Asset \"", _key, "\" has already been defined, skipping subsequent definitions");
        }
        else
        {
            var _pattern = new __VinylClassPatternAsset(_key, false, false, _assetIndex);
            _pattern.__Initialize(_patternData);
            _pattern.__StoreAsset();
            return _pattern;
        }
    }
    
    //Instantiate basic patterns for each asset in the config data
    var _inputAssetDict = _configData[$ "assets"];
    if (is_undefined(_inputAssetDict))
    {
        __VinylTrace("Warning! \"assets\" data missing");
    }
    else if (!is_struct(_inputAssetDict))
    {
        __VinylError("\"assets\" data should be defined as an object (struct)");
    }
    else
    {
        var _assetNameArray = variable_struct_get_names(_inputAssetDict);
        
        //Expand any wildcards
        var _i = 0;
        repeat(array_length(_assetNameArray))
        {
            var _assetName = _assetNameArray[_i];
            
            //If we have at least one wildcard in the asset name we'll need to make a search
            if (string_pos("*", _assetName) > 0)
            {
                var _assetData = _inputAssetDict[$ _assetName];
                
                //Remove this wildcard entry from our data structures
                variable_struct_remove(_inputAssetDict, _assetName);
                array_delete(_assetNameArray, _i, 1);
                
                //Build an array of all audio asset names on demand
                if (!is_array(_audioAssetArray))
                {
                    _audioAssetArray = [];
                    
                    var _j = 0;
                    repeat(1000000)
                    {
                        if (not audio_exists(_j)) break;
                        array_push(_audioAssetArray, audio_get_name(_j));
                        ++_j;
                    }
                }
                
                //Find all matching assets for the search string
                var _array = __VinylFindMatchingAudioAssets(_assetName, _audioAssetArray);
                
                if (array_length(_array) <= 0)
                {
                    __VinylTrace("Warning! Search string \"", _assetName, "\" matches no assets");
                }
                else
                {
                    //Iterate over all of the asset we found and merge asset data for them
                    var _j = 0;
                    repeat(array_length(_array))
                    {
                        var _assetName = audio_get_name(_array[_j]);
                        __VinylBufferReadConfigJSONStructMergeNoOverwrite(_inputAssetDict, _assetName, _assetData);
                        if (!array_contains(_assetNameArray, _assetName)) array_push(_assetNameArray, _assetName);
                        ++_j;
                    }
                }
            }
            else
            {
                ++_i;
            }
        }
        
        //Then iterate over the unpacked asset definitions and set up asset patterns
        var _i = 0;
        repeat(array_length(_assetNameArray))
        {
            var _assetName = _assetNameArray[_i];
            var _patternData = _inputAssetDict[$ _assetName];
            
            if (_assetName == "fallback")
            {
                var _pattern = new __VinylClassPatternFallback();
                _pattern.__Initialize(_patternData);
                _pattern.__Store();
            }
            else
            {
                var _assetIndex = asset_get_index(_assetName);
                if (_assetIndex < 0)
                {
                    __VinylTrace("Warning! Asset \"", _assetName, "\" doesn't exist");
                }
                else if (asset_get_type(_assetName) != asset_sound)
                {
                    __VinylTrace("Warning! Asset \"", _assetName, "\" isn't a sound");
                }
                else
                {
                    //Make a new pattern for this asset
                    _addAssetFunc(_newPatternDict, string(_assetIndex), _assetIndex, _patternData);
                }
            }
            
            ++_i;
        }
    }
    
    
    
    //Ensure we always have a fallback pattern
    if (!variable_struct_exists(_newPatternDict, "fallback"))
    {
        if (VINYL_DEBUG_READ_CONFIG) __VinylTrace("Fallback asset case doesn't exist, creating one");
        
        var _pattern = new __VinylClassPatternFallback();
        _pattern.__Initialize(undefined);
        _pattern.__Store();
    }
    
    
    
    //Iterate over every label and collect up sound assets with tags that match the label's definition
    var _i = 0;
    repeat(array_length(_newLabelArray))
    {
        var _labelData = _newLabelArray[_i];
        var _tagArray = _labelData.__tagArray;
        
        if (is_array(_tagArray))
        {
            var _j = 0;
            repeat(array_length(_tagArray))
            {
                var _tag = _tagArray[_j];
                var _assetArray = tag_get_asset_ids(_tag, asset_sound);
                if (is_array(_assetArray))
                {
                    var _k = 0;
                    repeat(array_length(_assetArray))
                    {
                        var _assetIndex = _assetArray[_k];
                        var _key = string(_assetIndex);
                        
                        var _pattern = _newPatternDict[$ _key] ?? _addAssetFunc(_newPatternDict, string(_assetIndex), _assetIndex, undefined);
                        _labelData.__LabelArrayAppend(_pattern.__labelArray);
                        
                        ++_k;
                    }
                }
                
                ++_j;
            }
        }
        
        ++_i;
    }
    
    
    
    //Iterate over every pattern in our input data and create a new pattern struct for each one
    var _inputPatternsDict = _configData[$ "patterns"];
    if (is_undefined(_inputAssetDict))
    {
        __VinylTrace("Warning! \"patterns\" data missing");
    }
    else if (!is_struct(_inputAssetDict))
    {
        __VinylError("\"patterns\" data should be defined as an object (struct)");
    }
    else
    {
        var _patternNameArray = variable_struct_get_names(_inputPatternsDict);
        var _i = 0;
        repeat(array_length(_patternNameArray))
        {
            var _patternName = _patternNameArray[_i];
            if (string_pos(">", _patternName)) __VinylError("Pattern names cannot contain the \">\" character (name=", _patternName, ")");
            
            __VInylPatternCreate(_patternName, _inputPatternsDict[$ _patternName], false, false);
            
            ++_i;
        }
    }
    
    
    
    //Set up effect chains that we find in the incoming data
    var _inputEffectChainDict = _configData[$ "effect chains"];
    if (is_undefined(_inputEffectChainDict))
    {
        __VinylTrace("Warning! \"effect chains\" data missing");
    }
    else if (!is_struct(_inputEffectChainDict))
    {
        __VinylError("\"effect chains\" data should be defined as an object (struct)");
    }
    else
    {
        var _effectChainNameArray = variable_struct_get_names(_inputEffectChainDict);
        var _i = 0;
        repeat(array_length(_effectChainNameArray))
        {
            var _effectChainName = _effectChainNameArray[_i];
            __VinylEffectChainEnsure(_effectChainName).__Update(_inputEffectChainDict[$ _effectChainName]);
            ++_i;
        }
    }
    
    //Clean up any effect chains that exist in the old data but weren't in the incoming new data
    var _i = 0;
    repeat(array_length(_effectChainArray))
    {
        var _effectChain = _effectChainArray[_i];
        var _effectChainName = _effectChain.__name;
        
        if ((_effectChainName != "main") && !variable_struct_exists(_inputEffectChainDict, _effectChainName))
        {
            _effectChain.__Destroy();
            
            variable_struct_remove(_effectChainDict, _effectChainName);
            array_delete(_effectChainArray, _i, 1);
        }
        else
        {
            ++_i;
        }
    }
    
    
    
    //Reload any animation curves that we're using
    //We don't want to reload animation curves if we're running outside of the IDE
    if (__VinylGetLiveUpdateEnabled())
    {
        var _i = 0;
        repeat(array_length(_animCurveArray))
        {
            _animCurveArray[_i].__Reload();
            ++_i;
        }
    }
    
    
    
    //Migrate all of our patterns to the new dataset
    array_foreach(_globalData.__patternArray, function(_pattern)
    {
        _pattern.__Migrate();
    });
    
    //Migrate all of our top-level voices to the new config data
    array_foreach(_globalData.__topLevelArray, function(_voice)
    {
        _voice.__Migrate();
    });
    
    //Update all values from knobs
    array_foreach(_globalData.__knobArray, function(_knob)
    {
        _knob.__OutputRefresh();
    });
    
    //Workaround for problems setting effects on the main audio effect bus in 2023.1
    gc_collect();
}