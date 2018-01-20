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
                    "id": "abb10840-6763-41d1-98bf-e15a4320c057",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_ensure_singleton",
                    "help": "called `with` object to be singleton - ensure the name passed is a singleton, will call instance destroy on a different id (_singleton_name)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_ensure_singleton",
                    "returnType": 2
                },
                {
                    "id": "ccdc3598-e3a2-4c62-a0aa-e4d02e417876",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_ensure_font",
                    "help": "cache the current font (font)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_ensure_font",
                    "returnType": 2
                },
                {
                    "id": "e8ed3b94-ddf4-4773-974d-81b5b1bafc70",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_ensure_color",
                    "help": "cache the current color (_color)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_ensure_color",
                    "returnType": 2
                },
                {
                    "id": "48de5b70-85d6-4ace-98c1-697b49c8fb1e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_color_hex",
                    "help": "[Convert the RGB to BGR][https:\/\/forum.yoyogames.com\/index.php?threads\/why-are-hex-colours-bbggrr-instead-of-rrggbb.16325\/#post-105309] (color)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_color_hex",
                    "returnType": 2
                },
                {
                    "id": "d60ce244-3133-4085-94e1-ff73344889b7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_color_glsl",
                    "help": "convert a color to an array float values [0.0 - 1.0] (_color, [_out_array])",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_color_glsl",
                    "returnType": 2
                },
                {
                    "id": "0a9d7f4b-19dd-426c-b74f-92dd123f6642",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_next_pot",
                    "help": "return the nearest power of 2 for a given number [integer] (_va)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_next_pot",
                    "returnType": 2
                },
                {
                    "id": "1bf4b2a6-17b6-40ca-a044-ff0085be4712",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_shadow_text",
                    "help": "Draw text with a shadow (_x, _y, _text, _fg, _bg, [_xoff=1], [_yoff=1])",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_shadow_text",
                    "returnType": 2
                },
                {
                    "id": "ae863920-5d86-456a-b5dd-6ea9ab9638ce",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_outline_text",
                    "help": "draw text with an oultine (_x, _y, _text, _fg, _bg)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_outline_text",
                    "returnType": 2
                },
                {
                    "id": "57f582ed-d3e6-4582-ab50-31ea0ebe8120",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_error",
                    "help": "Error wrapper [eventual logging system] ([_system], _text)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_error",
                    "returnType": 2
                },
                {
                    "id": "f88a0eab-5e30-41af-b325-d075633827bf",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_log",
                    "help": "Log wrapper [eventual logging system] ([_system], _text)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_log",
                    "returnType": 2
                },
                {
                    "id": "10bcdaa6-e5bc-41b9-9d1d-c77f14966853",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_execute",
                    "help": "rousr_execute - call a function with variadic argument support (_script_index, _params, [paramCount])",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_execute",
                    "returnType": 2
                },
                {
                    "id": "16d6d758-51d1-4100-aa1a-a25bf0b5d50a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_aabb_contains_line",
                    "help": "courtesy of https:\/\/stackoverflow.com\/questions\/1585525\/how-to-find-the-intersection-point-between-a-line-and-a-rectangle (_line_x1, _line_y1, _line_x2, _line_y2, _rect_min_x, _rect_min_y, _rect_max_x, _rect_max_y)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_aabb_contains_line",
                    "returnType": 2
                },
                {
                    "id": "f905547b-16f0-413e-bfd4-b6a55547f0dc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__extrousrcore_script_index",
                    "help": "Returns the actual runtime script index because YYG doesn't know how to do that apparently (ext_script_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "__extrousrcore_script_index",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 2,
            "order": [
                "abb10840-6763-41d1-98bf-e15a4320c057",
                "ccdc3598-e3a2-4c62-a0aa-e4d02e417876",
                "e8ed3b94-ddf4-4773-974d-81b5b1bafc70",
                "48de5b70-85d6-4ace-98c1-697b49c8fb1e",
                "d60ce244-3133-4085-94e1-ff73344889b7",
                "0a9d7f4b-19dd-426c-b74f-92dd123f6642",
                "1bf4b2a6-17b6-40ca-a044-ff0085be4712",
                "ae863920-5d86-456a-b5dd-6ea9ab9638ce",
                "57f582ed-d3e6-4582-ab50-31ea0ebe8120",
                "f88a0eab-5e30-41af-b325-d075633827bf",
                "10bcdaa6-e5bc-41b9-9d1d-c77f14966853",
                "16d6d758-51d1-4100-aa1a-a25bf0b5d50a",
                "f905547b-16f0-413e-bfd4-b6a55547f0dc"
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
    "version": "0.12.0"
}