// Feather disable all

#macro __SCRIBBLEJR_VERSION  "1.3.0 beta"
#macro __SCRIBBLEJR_DATE     "2024-05-11"

#macro __SCRIBBLEJR_SHADER_SET    shader_set
#macro __SCRIBBLEJR_SHADER_RESET  shader_reset

#macro __SCRIBBLEJR_TIMEOUT  1000 //microseconds

function __ScribblejrSystem()
{
    static _system = undefined;
    if (is_struct(_system)) return _system;
    
    __ScribblejrTrace("Welcome to Scribblejr by Juju Adams! This is version ", __SCRIBBLEJR_VERSION, ", ", __SCRIBBLEJR_DATE);
    
    _system = {};
    if (GM_build_type == "run") global.scribblejrSystem = _system;
    
    with(_system)
    {
        __nullWrapper = new __ScribblejrClassNullWrapper();
        
        __wrappersCache     = {};
        __elementsArray     = [];
        __elementSweepIndex = 0;
        
        __cacheFontInfo    = {};
        __cacheSpaceWidth  = {};
        __cacheSpaceHeight = {};
        
        __spriteFontData = {};
        
        __budget         = SCRIBBLEJR_BUDGET;
        __budgetUsed     = 0;
        __budgetUsedPrev = 0;
        
        __defaultFont = ScribblejrDefaultFont;
        
        __perCharacterWrap = false;
        
        __colourDict = {};
        __colourDict[$ "c_aqua"   ] = c_aqua;
        __colourDict[$ "c_black"  ] = c_black;
        __colourDict[$ "c_blue"   ] = c_blue;
        __colourDict[$ "c_dkgray" ] = c_dkgray;
        __colourDict[$ "c_dkgrey" ] = c_dkgrey;
        __colourDict[$ "c_fuchsia"] = c_fuchsia
        __colourDict[$ "c_gray"   ] = c_gray;
        __colourDict[$ "c_green"  ] = c_green;
        __colourDict[$ "c_gray"   ] = c_gray;
        __colourDict[$ "c_grey"   ] = c_grey;
        __colourDict[$ "c_lime"   ] = c_lime;
        __colourDict[$ "c_ltgray" ] = c_ltgray;
        __colourDict[$ "c_ltgrey" ] = c_ltgrey;
        __colourDict[$ "c_maroon" ] = c_maroon;
        __colourDict[$ "c_navy"   ] = c_navy;
        __colourDict[$ "c_olive"  ] = c_olive;
        __colourDict[$ "c_orange" ] = c_orange;
        __colourDict[$ "c_purple" ] = c_purple;
        __colourDict[$ "c_red"    ] = c_red;
        __colourDict[$ "c_silver" ] = c_silver;
        __colourDict[$ "c_teal"   ] = c_teal;
        __colourDict[$ "c_white"  ] = c_white;
        __colourDict[$ "c_yellow" ] = c_yellow;
        __colourDict[$ "/c"       ] = -1;
        __colourDict[$ "/color"   ] = -1;
        __colourDict[$ "/colour"  ] = -1;
        
        vertex_format_begin();
        vertex_format_add_custom(vertex_type_float2, vertex_usage_position);
        vertex_format_add_texcoord();
        __vertexFormat = vertex_format_end();
        
        vertex_format_begin();
        vertex_format_add_custom(vertex_type_float2, vertex_usage_position);
        vertex_format_add_color();
        vertex_format_add_texcoord();
        __vertexFormatColor = vertex_format_end();
    }
    
    time_source_start(time_source_create(time_source_global, 1, time_source_units_frames, function()
    {
        static _system = __ScribblejrSystem();
        static _cache  = _system.__wrappersCache;
        static _array  = _system.__elementsArray;
        
        with(_system)
        {
            __budgetUsedPrev = __budgetUsed;
            __budgetUsed = 0;
            
            var _index = __elementSweepIndex;
            repeat(sqrt(array_length(_array)))
            {
                _index = (_index + 1) mod array_length(_array);
                
                var _element = _array[_index];
                if ((not weak_ref_alive(_element.__wrapper)) && (current_time > _element.__lastDraw + __SCRIBBLEJR_TIMEOUT))
                {
                    if (SCRIBBLEJR_VERBOSE) __ScribblejrTrace("Freeing ", _element.__key);
                    
                    array_delete(_array, _index, 1);
                    variable_struct_remove(_cache, _element.__key);
                    
                    _element.__Destroy();
                }
            }
            
            __elementSweepIndex = _index;
        }
    },
    [], -1));
    
    return _system;
}