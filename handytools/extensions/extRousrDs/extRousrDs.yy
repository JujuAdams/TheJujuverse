{
    "id": "53dc0120-24ca-4982-875b-b61a29b8e918",
    "modelName": "GMExtension",
    "mvc": "1.0",
    "name": "extRousrDs",
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
    "date": "2017-27-29 11:12:18",
    "description": "",
    "extensionName": "",
    "files": [
        {
            "id": "3ae7c6c2-f6e3-42f0-af35-c5ef7550694c",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 194,
            "filename": "extRousrDs.gml",
            "final": "",
            "functions": [
                {
                    "id": "4207d1ed-185f-4d29-86fb-31481a8abc14",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_array",
                    "help": "return an index, or set an index in a `_rousr_array` (_rousr_array, _index, [_val])",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_array",
                    "returnType": 2
                },
                {
                    "id": "8c048012-23b6-40d1-b6cf-71bbddca60ae",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_array_create",
                    "help": "create a `rousr style` array, with the size as the first element, and the actual array as second ([_array], [_arraySize])",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_array_create",
                    "returnType": 2
                },
                {
                    "id": "a0492f1d-d4b0-4496-92e5-386ee2e99d44",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_array_data",
                    "help": "return the data of the `rousr_array` (_rousr_array)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_array_data",
                    "returnType": 2
                },
                {
                    "id": "122d69c2-2e16-4638-b1bc-50b9747a3e2a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_array_destroy",
                    "help": "destroy a `rousr style` array - currently does nothing, but future proofing by including. (_array)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_array_destroy",
                    "returnType": 2
                },
                {
                    "id": "3a885111-29cc-491d-9924-028386294a41",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_array_find",
                    "help": "returns the first occurence of _val beginning at _startIndex (_rousr_array, _val, [_startIndex=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_array_find",
                    "returnType": 2
                },
                {
                    "id": "ba557421-306d-46fd-83a8-3cb33988386c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_array_insert",
                    "help": "insert a value into a rousr array (_rousr_array, _index, _val)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_array_insert",
                    "returnType": 2
                },
                {
                    "id": "01e875be-f142-487e-a346-26073f9054c2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_array_pop_back",
                    "help": "pop the back of a rousr array and return it (_rousr_array)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_array_pop_back",
                    "returnType": 2
                },
                {
                    "id": "3a2dc115-e5ff-4bd6-9748-0720cd06ae31",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_array_pop_front",
                    "help": "pop the front of an array and return it (_rousr_array)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_array_pop_front",
                    "returnType": 2
                },
                {
                    "id": "44b21ad3-aafb-4e5a-b520-0e7885c781db",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_array_push_back",
                    "help": "push a value on the end of a `rousr_array` (_rousr_array, _val)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_array_push_back",
                    "returnType": 2
                },
                {
                    "id": "aaae5860-276e-4c85-965a-075443309d3f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_array_push_front",
                    "help": "push a value on the front of a rousr array (_array, _val)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_array_push_front",
                    "returnType": 2
                },
                {
                    "id": "e988c54b-c763-413b-83c7-e8822a42e717",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_array_push_unique",
                    "help": "push a value on the end of a rousr array, but only if value isn't in the array already (_rousr_array, _val, [_returnIndexOnExists=false])",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_array_push_unique",
                    "returnType": 2
                },
                {
                    "id": "53199d3a-40bd-432d-8a1f-d7b3a65499fc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_array_remove",
                    "help": "generate a new array with _index removed from the `_rousr_array` (_rousr_array, _index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_array_remove",
                    "returnType": 2
                },
                {
                    "id": "3de92501-7955-40e9-87a4-a119998ee3c9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_array_remove_multi",
                    "help": "generate a new array with _index removed from the `_rousr_array` (_rousr_array, _index_array, [_index_array_size])",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_array_remove_multi",
                    "returnType": 2
                },
                {
                    "id": "9e58fce7-61cd-4a31-93b1-fc2c73d34e88",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_array_size",
                    "help": "return the size of the `rousr_array` (`rousr_array`, [_new_size])",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_array_size",
                    "returnType": 2
                },
                {
                    "id": "1a35b88f-be6b-432a-90b2-7ef9773f24fb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_array_clear",
                    "help": "emtpy a rousr_array (_rousr_array, [_flush_mem=false])",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_array_clear",
                    "returnType": 2
                },
                {
                    "id": "79965d1d-299a-409b-9abb-ef5de8d65db5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_stack_array_create",
                    "help": "create a `rousr_stack_array` - a stack purely made of arrays ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_stack_array_create",
                    "returnType": 2
                },
                {
                    "id": "90873bf2-9982-4a09-98a1-4ca287e26768",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_stack_array_destroy",
                    "help": "destroy a `rousr_stack_array` - since they're made up of arrays, this is unnecessary to call, but provided future API use or re-using stack arrays. (_rousr_stack_array)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_stack_array_destroy",
                    "returnType": 2
                },
                {
                    "id": "83e9cb8e-6f52-4c54-8cf0-5275c3bf1002",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_stack_array_empty",
                    "help": "check if a stack is empty (_rousr_stack_array)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_stack_array_empty",
                    "returnType": 2
                },
                {
                    "id": "a74b7b4a-42bb-462b-b66e-08eb179177bc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_stack_array_pop",
                    "help": "pop the last `val`  from a `_rousr_stack_array` (_rousr_stack_array)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_stack_array_pop",
                    "returnType": 2
                },
                {
                    "id": "045513ad-5895-4774-b69f-007f0deef232",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_stack_array_push",
                    "help": "push a `_val` onto the stack of a `_rousr_stack_array` (_rousr_stack_array, _val)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_stack_array_push",
                    "returnType": 2
                },
                {
                    "id": "f713264d-12fb-406b-81f8-a66dd5d76249",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_stack_array_top",
                    "help": "return the top index of a `rousr_stack_array` (_rousr_stack_array)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_stack_array_top",
                    "returnType": 2
                },
                {
                    "id": "7cf9466c-6c77-4b38-9130-fca2422fab7e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_buffer_read_val",
                    "help": "Reads a value from a packed buffer, first reading data type to expect. (_buffer)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_buffer_read_val",
                    "returnType": 2
                },
                {
                    "id": "6463b868-39c6-48e4-aff4-d579df8eef7a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_buffer_write_val",
                    "help": "writes a value to the buffer, but first writes the type (_buffer, _val, [type=ERousrData.Invalid])",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_buffer_write_val",
                    "returnType": 2
                },
                {
                    "id": "dfbf77ae-8775-41c8-9c29-94e0163324b0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_buffer_rousr_type_to_buffer_type",
                    "help": "return a buffer type from a luarousr data type (_type)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_buffer_rousr_type_to_buffer_type",
                    "returnType": 2
                },
                {
                    "id": "a2860417-8881-4864-bc2a-57347cd2391d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_pool_create_pool",
                    "help": "create a `rousr_pool`, using the `_alloc_script` to create them. use `_destroy_script` to remove datastructures that are pooled. `rousr_pools` allow you to create generic pools of similiar objects for pooling resources, rather than allocating brand new ones at run-time. (_alloc_script, [_destroy_script], [_reset_script], [_constructor])",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_pool_create_pool",
                    "returnType": 2
                },
                {
                    "id": "3c621290-dc5c-48f2-83db-9c8721d9d6b8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_pool_destroy_pool",
                    "help": "destroy a `rousr_pool` and free its memory use [data structures] (_rousr_pool)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_pool_destroy_pool",
                    "returnType": 2
                },
                {
                    "id": "0fe7cd58-6b63-4e2c-b1fd-52fae89adf30",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_pool_create",
                    "help": "get a fresh item, optionally call the passed constructor on the object. (_rousr_pool, [_countructor])",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_pool_create",
                    "returnType": 2
                },
                {
                    "id": "f9aa9a5c-484a-416b-aeb0-8982aff75b76",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_pool_release",
                    "help": "returns element to the pool to be stored and reused (_rousr_pool, _element)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_pool_release",
                    "returnType": 2
                },
                {
                    "id": "af016396-3de7-4ca2-8cc8-915b4c1172b3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_buffer_pool",
                    "help": "helper function to create a `rousr_pool` of buffers (_buffer_size, _buffer_type, _buffer_alignment)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_buffer_pool",
                    "returnType": 2
                },
                {
                    "id": "8a971147-68ee-4dae-a036-2e35e5e99c6a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sr_buffer_pool_alloc",
                    "help": "create a new buffer (_rousr_pool)",
                    "hidden": false,
                    "kind": 1,
                    "name": "__sr_buffer_pool_alloc",
                    "returnType": 2
                },
                {
                    "id": "9fe974e3-c39f-4591-8ccd-50bf637ff47d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sr_buffer_pool_destroy",
                    "help": "destroy a pooled buffer (_rousr_pool, _buffer)",
                    "hidden": false,
                    "kind": 1,
                    "name": "__sr_buffer_pool_destroy",
                    "returnType": 2
                },
                {
                    "id": "49b45f5f-cebe-48f4-b2ee-678f5d9e9bf2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sr_buffer_pool_reset",
                    "help": "reset a buffer, after being returned to the pool (_rousr_pool, _buffer)",
                    "hidden": false,
                    "kind": 1,
                    "name": "__sr_buffer_pool_reset",
                    "returnType": 2
                },
                {
                    "id": "27cb9083-70eb-45ea-8ee5-2f080fbb65a6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_json_decode",
                    "help": "(_json)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_json_decode",
                    "returnType": 2
                },
                {
                    "id": "56cfee1b-bfed-4c38-bc10-c9c892d13f88",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_json_encode",
                    "help": "(_sr_serializable, [_pretty_print=false], Pretty)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_json_encode",
                    "returnType": 2
                },
                {
                    "id": "50d34a58-483e-487a-b804-2daab87fb18a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sr_json_encode_type",
                    "help": "(_sr_ds, _type, [_pretty_print=false], [_indent_length=0])",
                    "hidden": false,
                    "kind": 1,
                    "name": "__sr_json_encode_type",
                    "returnType": 2
                },
                {
                    "id": "6d3c4e81-1e31-4656-8508-7e697c3f5d62",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_sort_quick",
                    "help": "implement a quicksort you can pass a predicate to port from http:\/\/www.algolist.net\/Algorithms\/Sorting\/Quicksort (list, comparison)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_sort_quick",
                    "returnType": 2
                },
                {
                    "id": "fa7abfcc-5779-41d4-94d7-c2a9ca4e2520",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_sort_insert",
                    "help": "an insertion sort with a predicateported from http:\/\/www.algolist.net\/Algorithms\/Sorting\/Insertion_sortcause why not? (list, predicate)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_sort_insert",
                    "returnType": 2
                },
                {
                    "id": "8559ea63-fb59-4ce7-8584-87f16bd1b80b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_ds_safe_destroy",
                    "help": "check if `_ds_id` is a valid `_type` and destroy it if it is, returning the new id to use for _ds_id [undefined in most cases] (_type, _ds_id)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_ds_safe_destroy",
                    "returnType": 2
                },
                {
                    "id": "60e67ca1-fce0-4052-8419-67864384dbce",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_ds_destroy",
                    "help": "destroys a ds that has been created using a sr_*_create ds function. (_sr_ds)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_ds_destroy",
                    "returnType": 2
                },
                {
                    "id": "78775be9-1a9f-465f-9f1c-3cdf87e83617",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_ds_get_type",
                    "help": "Returns the sr_ds type (_sr_ds)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_ds_get_type",
                    "returnType": 2
                },
                {
                    "id": "8754b997-3bd3-45cf-8451-e938bc4109c7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_ds_get_count",
                    "help": "returns the total count of this ds type currently in the game (_sr_ds_type)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_ds_get_count",
                    "returnType": 2
                },
                {
                    "id": "a6b83bd8-2cba-47c7-99c5-946e8a9b4cb4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "_sr_ds_register",
                    "help": "(_type, _value)",
                    "hidden": false,
                    "kind": 1,
                    "name": "_sr_ds_register",
                    "returnType": 2
                },
                {
                    "id": "9a3f6b34-3dce-4956-8189-6adf2ff3fb18",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_list_create",
                    "help": "Creates a new `sr_list` ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_list_create",
                    "returnType": 2
                },
                {
                    "id": "d03a6813-ca65-4fa9-8b33-170b0f563fba",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_array_to_list",
                    "help": "converts an array to a `sr_list` (_array)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_array_to_list",
                    "returnType": 2
                },
                {
                    "id": "649cdf5a-2650-48ef-a2e8-0602066ce978",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_list_to_array",
                    "help": "Converts a `sr_list` to an array (_list)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_list_to_array",
                    "returnType": 2
                },
                {
                    "id": "775f6807-9060-4368-8203-e2c96f12bb49",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_list_mark_as",
                    "help": "Creates a nested association at given index (_sr_list, _index, _type)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_list_mark_as",
                    "returnType": 2
                },
                {
                    "id": "18520d85-3d35-4ee0-a435-7ab5bc67f4b1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_list_add_list",
                    "help": "Adds a new list to the list and creates an association (_sr_list, _child_list)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_list_add_list",
                    "returnType": 2
                },
                {
                    "id": "eb1e7118-3a55-4dc3-8016-a97119fd0db6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_list_add_map",
                    "help": "Adds a new map to the list and creates an association (_sr_list, _sr_map)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_list_add_map",
                    "returnType": 2
                },
                {
                    "id": "1c9c3326-7a3b-4fee-bee1-4b618a22f086",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_map_create",
                    "help": "Creates a new `sr_map` ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_map_create",
                    "returnType": 2
                },
                {
                    "id": "f970469b-90a3-4375-b1da-c20fc6cd7fb7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_map_mark_as",
                    "help": "Creates a nested association at given key (_sr_map, _key, _type)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_map_mark_as",
                    "returnType": 2
                },
                {
                    "id": "bece1d9e-b6a0-4802-b234-f53071945208",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_map_add_list",
                    "help": "Sets the list to a key in the map and creates an association (_sr_map, _key, _sr_list)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_map_add_list",
                    "returnType": 2
                },
                {
                    "id": "4a7ef532-1b9c-4139-afea-c2fa3038ee0b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_map_add_map",
                    "help": "Sets the child map to a key in the map and creates an association (_sr_map, _key, _child)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_map_add_map",
                    "returnType": 2
                },
                {
                    "id": "bccab3a2-c24c-44a8-840a-709c81682247",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_grid_create",
                    "help": "Creates a new `sr_grid` (_cols, _rows, [_default_value=undefined])",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_grid_create",
                    "returnType": 2
                },
                {
                    "id": "3ff7d7dc-bf45-44d5-a6ab-f77e887d26da",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_grid_mark_as",
                    "help": "Creates a nested association at given x\/y coord (_sr_grid, _x, _y, _type)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_grid_mark_as",
                    "returnType": 2
                },
                {
                    "id": "d6355b71-53f7-47e0-9629-8c99d3e72335",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_queue_create",
                    "help": "Creates a new `sr_queue` ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_queue_create",
                    "returnType": 2
                },
                {
                    "id": "b9c7c0ff-4d5a-48e3-8951-159f62fe9ff5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_priority_create",
                    "help": "Creates a new `sr_priority` ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_priority_create",
                    "returnType": 2
                },
                {
                    "id": "ea86abd3-22b0-410d-8b68-2974281d3d1f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_stack_create",
                    "help": "Creates a new `sr_stack` ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_stack_create",
                    "returnType": 2
                },
                {
                    "id": "0818fd24-4ac8-4f83-b8e7-d99606487d65",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__sr_ds_init",
                    "help": "create internal data structures ()",
                    "hidden": false,
                    "kind": 1,
                    "name": "__sr_ds_init",
                    "returnType": 2
                },
                {
                    "id": "519726d7-9fee-42f9-9bd3-18e7e6fef935",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__extrousrds_script_index",
                    "help": "Returns the actual runtime script index because YYG doesn't know how to do that apparently (ext_script_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "__extrousrds_script_index",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 2,
            "order": [
                "4207d1ed-185f-4d29-86fb-31481a8abc14",
                "8c048012-23b6-40d1-b6cf-71bbddca60ae",
                "a0492f1d-d4b0-4496-92e5-386ee2e99d44",
                "122d69c2-2e16-4638-b1bc-50b9747a3e2a",
                "3a885111-29cc-491d-9924-028386294a41",
                "ba557421-306d-46fd-83a8-3cb33988386c",
                "01e875be-f142-487e-a346-26073f9054c2",
                "3a2dc115-e5ff-4bd6-9748-0720cd06ae31",
                "44b21ad3-aafb-4e5a-b520-0e7885c781db",
                "aaae5860-276e-4c85-965a-075443309d3f",
                "e988c54b-c763-413b-83c7-e8822a42e717",
                "53199d3a-40bd-432d-8a1f-d7b3a65499fc",
                "3de92501-7955-40e9-87a4-a119998ee3c9",
                "9e58fce7-61cd-4a31-93b1-fc2c73d34e88",
                "1a35b88f-be6b-432a-90b2-7ef9773f24fb",
                "79965d1d-299a-409b-9abb-ef5de8d65db5",
                "90873bf2-9982-4a09-98a1-4ca287e26768",
                "83e9cb8e-6f52-4c54-8cf0-5275c3bf1002",
                "a74b7b4a-42bb-462b-b66e-08eb179177bc",
                "045513ad-5895-4774-b69f-007f0deef232",
                "f713264d-12fb-406b-81f8-a66dd5d76249",
                "7cf9466c-6c77-4b38-9130-fca2422fab7e",
                "6463b868-39c6-48e4-aff4-d579df8eef7a",
                "dfbf77ae-8775-41c8-9c29-94e0163324b0",
                "a2860417-8881-4864-bc2a-57347cd2391d",
                "3c621290-dc5c-48f2-83db-9c8721d9d6b8",
                "0fe7cd58-6b63-4e2c-b1fd-52fae89adf30",
                "f9aa9a5c-484a-416b-aeb0-8982aff75b76",
                "af016396-3de7-4ca2-8cc8-915b4c1172b3",
                "8a971147-68ee-4dae-a036-2e35e5e99c6a",
                "9fe974e3-c39f-4591-8ccd-50bf637ff47d",
                "49b45f5f-cebe-48f4-b2ee-678f5d9e9bf2",
                "27cb9083-70eb-45ea-8ee5-2f080fbb65a6",
                "56cfee1b-bfed-4c38-bc10-c9c892d13f88",
                "50d34a58-483e-487a-b804-2daab87fb18a",
                "6d3c4e81-1e31-4656-8508-7e697c3f5d62",
                "fa7abfcc-5779-41d4-94d7-c2a9ca4e2520",
                "8559ea63-fb59-4ce7-8584-87f16bd1b80b",
                "60e67ca1-fce0-4052-8419-67864384dbce",
                "78775be9-1a9f-465f-9f1c-3cdf87e83617",
                "8754b997-3bd3-45cf-8451-e938bc4109c7",
                "a6b83bd8-2cba-47c7-99c5-946e8a9b4cb4",
                "9a3f6b34-3dce-4956-8189-6adf2ff3fb18",
                "d03a6813-ca65-4fa9-8b33-170b0f563fba",
                "649cdf5a-2650-48ef-a2e8-0602066ce978",
                "775f6807-9060-4368-8203-e2c96f12bb49",
                "18520d85-3d35-4ee0-a435-7ab5bc67f4b1",
                "eb1e7118-3a55-4dc3-8016-a97119fd0db6",
                "1c9c3326-7a3b-4fee-bee1-4b618a22f086",
                "f970469b-90a3-4375-b1da-c20fc6cd7fb7",
                "bece1d9e-b6a0-4802-b234-f53071945208",
                "4a7ef532-1b9c-4139-afea-c2fa3038ee0b",
                "bccab3a2-c24c-44a8-840a-709c81682247",
                "3ff7d7dc-bf45-44d5-a6ab-f77e887d26da",
                "d6355b71-53f7-47e0-9629-8c99d3e72335",
                "b9c7c0ff-4d5a-48e3-8951-159f62fe9ff5",
                "ea86abd3-22b0-410d-8b68-2974281d3d1f",
                "0818fd24-4ac8-4f83-b8e7-d99606487d65",
                "519726d7-9fee-42f9-9bd3-18e7e6fef935"
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
    "version": "0.7.1"
}