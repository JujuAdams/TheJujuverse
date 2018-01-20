{
    "id": "41aa7af4-8ff0-4c74-b128-a0ebf7e056c1",
    "modelName": "GMExtension",
    "mvc": "1.0",
    "name": "extRousrCore",
    "IncludedResources": [
        
    ],
    "androidPermissions": [
        
    ],
    "androidProps": false,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": 194,
    "date": "2017-33-29 08:12:44",
    "description": "",
    "extensionName": "",
    "files": [
        {
            "id": "32df1491-b20f-4ad6-8ac8-a825b3536e2d",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 194,
            "filename": "extRousrCore.gml",
            "final": "",
            "functions": [
                {
                    "id": "1d33084b-39ef-47a3-b42a-a7a868303801",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_ensure_singleton",
                    "help": "called `with` object to be singleton - ensure the name passed is a singleton, will call instance destroy on a different id ( _singleton_name )",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_ensure_singleton",
                    "returnType": 2
                },
                {
                    "id": "fd3e0ca4-1b22-41e4-bf84-03ff85fc42ce",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_ensure_font",
                    "help": "cache the current font ( font )",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_ensure_font",
                    "returnType": 2
                },
                {
                    "id": "a07cfd31-8cca-4b21-bba0-2780ca3f481e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_ensure_color",
                    "help": "cache the current color ( _color )",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_ensure_color",
                    "returnType": 2
                },
                {
                    "id": "cf2fccd7-b287-4ed7-b2da-f5dc389049b0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_color_hex",
                    "help": "[Convert the RGB to BGR][https:\/\/forum.yoyogames.com\/index.php?threads\/why-are-hex-colours-bbggrr-instead-of-rrggbb.16325\/#post-105309] ( color )",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_color_hex",
                    "returnType": 2
                },
                {
                    "id": "bbbf94d9-81d8-49e1-acac-8d3eae034f07",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_color_glsl",
                    "help": "convert a color to an array float values [0.0 - 1.0] ( _color , [_out_array] )",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_color_glsl",
                    "returnType": 2
                },
                {
                    "id": "014cb4f2-7cd4-490a-9e53-730938565346",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_next_pot",
                    "help": "return the nearest power of 2 for a given number [integer] ( _va )",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_next_pot",
                    "returnType": 2
                },
                {
                    "id": "083bb15b-6c88-45fc-9a90-4b9531019201",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_shadow_text",
                    "help": "Draw text with a shadow ( _x , _y , _text , _fg , _bg , [_xoff=1] , [_yoff=1] )",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_shadow_text",
                    "returnType": 2
                },
                {
                    "id": "d3c12648-3884-410c-85b8-5943b69c6432",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_outline_text",
                    "help": "draw text with an oultine ( _x , _y , _text , _fg , _bg )",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_outline_text",
                    "returnType": 2
                },
                {
                    "id": "390428a4-6307-44f6-9923-7f4ff7a7ea35",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_error",
                    "help": "Error wrapper [eventual logging system] ( [_system] , _text )",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_error",
                    "returnType": 2
                },
                {
                    "id": "c1fad878-3f6c-4d2b-84ca-716a5a28a314",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_log",
                    "help": "Log wrapper [eventual logging system] ( [_system] , _text )",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_log",
                    "returnType": 2
                },
                {
                    "id": "63e716af-c36d-4dfe-bc27-4ff39d29bfe4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_game_quit",
                    "help": "generic callback to use for quits [button callbacks mainly] (  )",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_game_quit",
                    "returnType": 2
                },
                {
                    "id": "acd96d11-e9ad-45a9-8d3b-5d766f088e64",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_execute",
                    "help": "rousr_execute - call a function with variadic argument support ( _script_index , _params , [paramCount] )",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_execute",
                    "returnType": 2
                },
                {
                    "id": "4adfc61d-d61b-49db-822d-ea4019728298",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_ds_safe_destroy",
                    "help": "check if `_ds_id` is a valid `_type` and destroy it if it is, returning the new id to use for _ds_id [undefined in most cases] ( _type , _ds_id )",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_ds_safe_destroy",
                    "returnType": 2
                },
                {
                    "id": "f633a89d-ec7e-4898-b054-aeb1434b988d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_dummy",
                    "help": "it does nothing - used for placeholders in callback systems ( [_any] )",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_dummy",
                    "returnType": 2
                },
                {
                    "id": "f60715d7-7da6-4c04-90ab-171d5a8506a8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_aabb_contains_line",
                    "help": "courtesy of https:\/\/stackoverflow.com\/questions\/1585525\/how-to-find-the-intersection-point-between-a-line-and-a-rectangle ( _line_x1 , _line_y1 , _line_x2 , _line_y2 , _rect_min_x , _rect_min_y , _rect_max_x , _rect_max_y )",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_aabb_contains_line",
                    "returnType": 2
                },
                {
                    "id": "18064c16-ae19-4466-88bf-371e8d4db08b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_sort_quick",
                    "help": "implement a quicksort you can pass a predicate to port from http:\/\/www.algolist.net\/Algorithms\/Sorting\/Quicksort ( list , comparison )",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_sort_quick",
                    "returnType": 2
                },
                {
                    "id": "21e0be4d-cb44-4a61-89b5-86b9819d3de0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_sort_insert",
                    "help": "an insertion sort with a predicateported from http:\/\/www.algolist.net\/Algorithms\/Sorting\/Insertion_sortcause why not? ( list , predicate )",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_sort_insert",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 2,
            "order": [
                "1d33084b-39ef-47a3-b42a-a7a868303801",
                "fd3e0ca4-1b22-41e4-bf84-03ff85fc42ce",
                "a07cfd31-8cca-4b21-bba0-2780ca3f481e",
                "cf2fccd7-b287-4ed7-b2da-f5dc389049b0",
                "bbbf94d9-81d8-49e1-acac-8d3eae034f07",
                "014cb4f2-7cd4-490a-9e53-730938565346",
                "083bb15b-6c88-45fc-9a90-4b9531019201",
                "d3c12648-3884-410c-85b8-5943b69c6432",
                "390428a4-6307-44f6-9923-7f4ff7a7ea35",
                "c1fad878-3f6c-4d2b-84ca-716a5a28a314",
                "63e716af-c36d-4dfe-bc27-4ff39d29bfe4",
                "acd96d11-e9ad-45a9-8d3b-5d766f088e64",
                "4adfc61d-d61b-49db-822d-ea4019728298",
                "f633a89d-ec7e-4898-b054-aeb1434b988d",
                "f60715d7-7da6-4c04-90ab-171d5a8506a8",
                "18064c16-ae19-4466-88bf-371e8d4db08b",
                "21e0be4d-cb44-4a61-89b5-86b9819d3de0"
            ],
            "origname": "",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": false,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosplistinject": "",
    "license": "",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "packageID": "",
    "productID": "",
    "sourcedir": "",
    "version": "0.11.0"
}