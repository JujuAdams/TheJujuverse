#macro TEXAN_TEXTURE_GROUPS  ["Default"] //Array of texture groups in the game. I'd love for this to be automatic but GameMaker doesn't give us that data at runtime...?!
#macro TEXAN_ALWAYS_FETCH    []          //Array of texture groups for Texan to always keep loaded. Always-fetch texture groups cannot be flushed by Texan as a result
#macro TEXAN_COMMIT_ON_BOOT  true        //Whether to call texan_commit() on boot to load in always-fetch texture groups (defined above)

#macro TEXAN_DEBUG_LEVEL     2  //0 = No debug message, 1 = Limited debug messages, 2 = Verbose debug messages
#macro TEXAN_GM_DEBUG_LEVEL  2  //0 = No debug message, 1 = Limited debug messages, 2 = Verbose debug messages






















#region Internal System Stuff

#macro __TEXAN_VERSION  "2.0.1"
#macro __TEXAN_DATE     "2021-03-31"

__TexanTrace("Welcome to Texan by @jujuadams! This is version ", __TEXAN_VERSION, ", ", __TEXAN_DATE);

texture_debug_messages(TEXAN_GM_DEBUG_LEVEL);

global.__texanFlush                = ds_list_create();
global.__texanFetch                = ds_list_create();
global.__texanAlwaysFetch          = ds_list_create();
global.__texanTextureGroups        = ds_list_create();
global.__texanSpriteToTextureGroup = ds_map_create();

//Add texture groups to our internal list
var _array = TEXAN_TEXTURE_GROUPS;
var _i = 0;
repeat(array_length(_array))
{
    var _texture_group = _array[_i];
    
    if (ds_list_find_index(global.__texanTextureGroups, _texture_group) < 0)
    {
        if (TEXAN_DEBUG_LEVEL >= 1) __TexanTrace("Adding texture group \"", _texture_group, "\"");
        ds_list_add(global.__texanTextureGroups, _texture_group);
        
        var _sprites = texturegroup_get_sprites(_texture_group);
        var _s = 0;
        repeat(array_length(_sprites))
        {
            var _sprite = _sprites[_s];
            if (TEXAN_DEBUG_LEVEL >= 2) __TexanTrace("\"", _texture_group, "\" has sprite ", sprite_get_name(_sprite), " (", _sprite, ")");
            global.__texanSpriteToTextureGroup[? _sprite] = _texture_group;
            ++_s;
        }
    }
    
    ++_i;
}

//Add always-fetch textures to our internal list
var _array = TEXAN_ALWAYS_FETCH;
var _i = 0;
repeat(array_length(_array))
{
    var _texture_group = _array[_i];
    
    if (ds_list_find_index(global.__texanAlwaysFetch, _texture_group) < 0)
    {
        if (TEXAN_DEBUG_LEVEL >= 2) __TexanTrace("Texan: Always fetching \"", _texture_group, "\"");
        ds_list_add(global.__texanAlwaysFetch, _texture_group);
        TexanFetch(_texture_group);
    }
    
    ++_i;
}

if (TEXAN_COMMIT_ON_BOOT) TexanYeehaw();

function __TexanTrace()
{
    var _string = "";
    var _i = 0;
    repeat(argument_count)
    {
        _string += string(argument[_i]);
        ++_i;
    }
    
    show_debug_message("Texan: " + _string);
    return _string;
}

#endregion