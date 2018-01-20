#### `sr_array`   
| | | 
| -------------- | ------------------------------------------------------- |   
**_rousr_array** | {Array} rousr_array to read / write   
**_index**       | {Real} index to read or write to   
**[_val]**       | {*} if passed, value to set element to, same as insert.   
**returns**:    | None   
```
sr_array(_rousr_array, _index, [_val])
```   
false

---

#### `sr_array_create`   
| | | 
| -------------- | -------------------------------------------- |   
**[_array]**     | {Array} array to wrap   
**[_arraySize]** | {Real} if `_array`s size is cached, pass it.   
**returns**:    | None   
```
sr_array_create([_array], [_arraySize])
```   
false

---

#### `sr_array_data`   
| | | 
| ---------- | ----------------------------------------------- |   
**-**        | _rousr_array `rousr_array` to get the data from   
**returns**: | {Array} data in the `rousr_array`   
```
sr_array_data(-)
```   
false

---

#### `sr_array_destroy`   
| | | 
| ---------- | -------------------------- |   
**_array**   | {Array} - array to destroy   
**returns**: | None   
```
sr_array_destroy(_array)
```   
false

---

#### `sr_array_find`   
| | | 
| ----------------- | -------------------------------------- |   
**_rousr_array**    | {Array} - rousr_array to search   
**_val**            | {*} - value to search for   
**[_startIndex=0]** | {Real} - index to start searching from   
**returns**:       | {Real} index or -1 if not found   
```
sr_array_find(_rousr_array, _val, [_startIndex=0])
```   
false

---

#### `sr_array_insert`   
| | | 
| -------------- | ---------------------------------------- |   
**_rousr_array** | {Array} rousr array to insert value into   
**_index**       | {Real} index to insert value at   
**_val**         | {*} value to insert   
**returns**:    | {Boolean} true on success   
```
sr_array_insert(_rousr_array, _index, _val)
```   
false

---

#### `sr_array_pop_back`   
| | | 
| -------------- | ------------------------------------------ |   
**_rousr_array** | {Array} - rousr array to pop last value of   
**returns**:    | {*} back, or undefined on failure   
```
sr_array_pop_back(_rousr_array)
```   
false

---

#### `sr_array_pop_front`   
| | | 
| -------------- | ------------------------------------------ |   
**_rousr_array** | {Array} - rousr array to pop last value of   
**returns**:    | {*} front or undefined   
```
sr_array_pop_front(_rousr_array)
```   
false

---

#### `sr_array_push_back`   
| | | 
| -------------- | -------------------------------------- |   
**_rousr_array** | {Array} - _rousr_array to push data to   
**_val**         | {*} - value to push onto the array   
**returns**:    | {Real} index pushed or -1 on error   
```
sr_array_push_back(_rousr_array, _val)
```   
false

---

#### `sr_array_push_front`   
| | | 
| ---------- | ------------------------------------- |   
**_array**   | {Array} - rousr_array to push data to   
**_val**     | {*} - value to push onto the array   
**returns**: | {Real} index pushed or -1 on error   
```
sr_array_push_front(_array, _val)
```   
false

---

#### `sr_array_push_unique`   
| | | 
| ------------------------------ | ------------------------------------------------------------------------------------------------------- |   
**_rousr_array**                 | {Array} - rousr_array to push data to   
**_val**                         | {*} - value to push onto the array   
**[_returnIndexOnExists=false]** | {Boolean} - if true returns index if it already exists, otherwise returns undefined (to signal failure)   
**returns**:                    | {Real} index pushed or -1 if it's not unique   
```
sr_array_push_unique(_rousr_array, _val, [_returnIndexOnExists=false])
```   
false

---

#### `sr_array_remove`   
| | | 
| -------------- | -------------------------------------------------------- |   
**_rousr_array** | {Array} - rousr_array to remove element at `_index` from   
**_index**       | {Real} - index to remove from _array   
**returns**:    | {*} element at removed index, or undefined   
```
sr_array_remove(_rousr_array, _index)
```   
false

---

#### `sr_array_remove_multi`   
| | | 
| --------------------- | ------------------------------------------------------------ |   
**_rousr_array**        | {Array} - rousr array to remove element at `_index` from   
**_index_array**        | {Real} - index to remove from _array (note: normal array)   
**[_index_array_size]** | {Real} - size of `_index_array` if you've already cached it.   
**returns**:           | {Array} removed values or undefined if error   
```
sr_array_remove_multi(_rousr_array, _index_array, [_index_array_size])
```   
false

---

#### `sr_array_size`   
| | | 
| ------------- | --------------------------------------------------------------- |   
**-**           | _rousr_array `rousr_array` to get the size of   
**[_new_size]** | {Real} - if passed, sets the size of the array to this new size   
**returns**:   | {Real} size of `rousr_array` (before it was set new, if `_new_size` is passed)   
```
sr_array_size(-, [_new_size])
```   
false

---

#### `sr_array_clear`   
| | | 
| -------------------- | -------------------------------------------------------------------------- |   
**_rousr_array**       | {Real} array to clear, sets size=0   
**[_flush_mem=false]** | {Boolean} if true, we will replace the data array with a new, empty array.   
**returns**:          | {Array} _ra   
```
sr_array_clear(_rousr_array, [_flush_mem=false])
```   
false

---

#### `sr_stack_array_create`   
**returns**: | {Array} rousr_stack_array   
```
sr_stack_array_create()
```   
false

---

#### `sr_stack_array_destroy`   
| | | 
| -------------------- | ---------------------------------------- |   
**_rousr_stack_array** | {Array} - `rousr_stack_array` to destroy   
**returns**:          | None   
```
sr_stack_array_destroy(_rousr_stack_array)
```   
false

---

#### `sr_stack_array_empty`   
| | | 
| -------------------- | -------------------------------------- |   
**_rousr_stack_array** | {Array} - `rousr_stack_array` to check   
**returns**:          | {Boolean} true if `_rousr_stack_array` is empty   
```
sr_stack_array_empty(_rousr_stack_array)
```   
false

---

#### `sr_stack_array_pop`   
| | | 
| -------------------- | ------------------------------------------------- |   
**_rousr_stack_array** | {Array} - `rousr_stack_array` array object to pop   
**returns**:          | {*} the end of the stack, or undefined if empty   
```
sr_stack_array_pop(_rousr_stack_array)
```   
false

---

#### `sr_stack_array_push`   
| | | 
| -------------------- | -------------------------------------------------- |   
**_rousr_stack_array** | {Array} - `rousr_stack_array` to push `_val` on to   
**_val**               | {*} - value to push on stack   
**returns**:          | {Real} new top index   
```
sr_stack_array_push(_rousr_stack_array, _val)
```   
false

---

#### `sr_stack_array_top`   
| | | 
| -------------------- | ------------------------------------------------- |   
**_rousr_stack_array** | {Array} - `rousr_stack_array` to get top index of   
**returns**:          | {Real} index of top, or -1 if empty   
```
sr_stack_array_top(_rousr_stack_array)
```   
false

---

#### `sr_buffer_read_val`   
| | | 
| ---------- | --------------------------------------------------------- |   
**_buffer**  | {Real} - id of buffer we're reading the _next_ value from   
**returns**: | {Real|String} return of the buffer read   
```
sr_buffer_read_val(_buffer)
```   
false

---

#### `sr_buffer_write_val`   
| | | 
| --------------------------- | -------------------------------------------------------------------- |   
**_buffer**                   | {Real} - buffer id to write to   
**_val**                      | {Real|String} - val to write to the buffer   
**[type=ERousrData.Invalid]** | {Real|String} - the forced type to use, can be string, or ERousrData   
**returns**:                 | {Boolean} true on success   
```
sr_buffer_write_val(_buffer, _val, [type=ERousrData.Invalid])
```   
false

---

#### `sr_buffer_rousr_type_to_buffer_type`   
| | | 
| ---------- | ------------------------------------------- |   
**_type**    | {Real} - The ERousrData to get buffer_xx of   
**returns**: | {Real} buffer_xx to use for this type when writing to a buffer   
```
sr_buffer_rousr_type_to_buffer_type(_type)
```   
false

---

#### `sr_pool_create_pool`   
| | | 
| ------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |   
**_alloc_script**     | {Real} - script to call for a new element of this `rousr_pool` **Format:** `function(_rousr_pool) -> returns {*} newly created object` (the way you'd create a new one without a pool)   
**[_destroy_script]** | {Real} - script to call to destroy / free the element **Format:** `function(_rousr_pool, _elem) -> No Return`   
**[_reset_script]**   | {Real} - script to call to reset an element after its returned to the pool **Format:** ``function(_rousr_pool, _elem) -> No Return`   
**[_constructor]**    | {Real} - script to call on returning a new element from the pool **Format:** `function(_rousr_pool, _elem) -> No Return`   
**returns**:         | {Array} undefined or new `rousr_pool`   
```
sr_pool_create_pool(_alloc_script, [_destroy_script], [_reset_script], [_constructor])
```   
false

---

#### `sr_pool_destroy_pool`   
| | | 
| ------------- | --------------------------------------- |   
**_rousr_pool** | {Array} - `rousr_array_pool` to destroy   
**returns**:   | None   
```
sr_pool_destroy_pool(_rousr_pool)
```   
false

---

#### `sr_pool_create`   
| | | 
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |   
**_rousr_pool**    | {Array} - the `rousr_pool` object to allocate new element from   
**[_countructor]** | {Real} - called on the new object. if a constructor was defined for the pool, this *OVERRIDES* it. **Format:** `function(_rousr_pool, _elem) -> No Return`   
**returns**:      | {*} a new element from the `rousr_pool`   
```
sr_pool_create(_rousr_pool, [_countructor])
```   
false

---

#### `sr_pool_release`   
| | | 
| ------------- | ------------------------------------------------ |   
**_rousr_pool** | {Array} - `rousr_pool` to put `_element` in.   
**_element**    | {*} - an `_element` compatible with `rousr_pool`   
**returns**:   | None   
```
sr_pool_release(_rousr_pool, _element)
```   
false

---

#### `sr_buffer_pool`   
| | | 
| ------------------- | ------------------------------------------------------------------------- |   
**_buffer_size**      | {Real} - size of the buffers to generate   
**_buffer_type**      | {Real} - buffer type to pass through to `buffer_create` i.e., `buffer_u8`   
**_buffer_alignment** | {Real} - alignment, in bytes, of buffer   
**returns**:         | {Array} `rousr_pool` setup to manage bufferses   
```
sr_buffer_pool(_buffer_size, _buffer_type, _buffer_alignment)
```   
false

---

#### `__sr_buffer_pool_alloc`   
| | | 
| ------------- | --------------------------------------------------- |   
**_rousr_pool** | {Array} - `rousr_pool` that owns the created buffer   
**returns**:   | {Real} buffer id for created buffer   
```
__sr_buffer_pool_alloc(_rousr_pool)
```   
false

---

#### `__sr_buffer_pool_destroy`   
| | | 
| ------------- | ----------------------------------------------- |   
**_rousr_pool** | {Array} - `rousr_pool` that contains the buffer   
**_buffer**     | {Real} - id of a buffer   
**returns**:   | None   
```
__sr_buffer_pool_destroy(_rousr_pool, _buffer)
```   
false

---

#### `__sr_buffer_pool_reset`   
| | | 
| ------------- | ------------------------------------------- |   
**_rousr_pool** | {Array} - pool being returned to   
**_buffer**     | {Real} - buffer id of buffer being returned   
**returns**:   | None   
```
__sr_buffer_pool_reset(_rousr_pool, _buffer)
```   
false

---

#### `sr_json_decode`   
| | | 
| ---------- | --------- |   
**_json**    | {String}    
**returns**: | None   
```
sr_json_decode(_json)
```   
false

---

#### `sr_json_encode`   
| | | 
| ----------------------- | ----------- |   
**_sr_serializable**      | {Real}    
**[_pretty_print=false]** | {Boolean}    
**Pretty**                | TODO: print   
**returns**:             | None   
```
sr_json_encode(_sr_serializable, [_pretty_print=false], Pretty)
```   
false

---

#### `__sr_json_encode_type`   
| | | 
| ----------------------- | ---------- |   
**_sr_ds**                | {Real}    
**_type**                 | {Real}    
**[_pretty_print=false]** | {Boolean}    
**[_indent_length=0]**    | {Real}    
**returns**:             | None   
```
__sr_json_encode_type(_sr_ds, _type, [_pretty_print=false], [_indent_length=0])
```   
false

---

#### `sr_sort_quick`   
| | | 
| ------------ | ---- |   
**list**       | false    
**comparison** | false    
**returns**:  | None   
```
sr_sort_quick(list, comparison)
```   
false

---

#### `sr_sort_insert`   
| | | 
| ----------- | ---- |   
**list**      | false    
**predicate** | false    
**returns**: | None   
```
sr_sort_insert(list, predicate)
```   
false

---

#### `sr_ds_safe_destroy`   
| | | 
| ---------- | -------------------------------------------------------------------- |   
**_type**    | {Real} - type of data structure, i.e., `ds_type_map`, `ds_type_list`   
**_ds_id**   | {Real} - id for the datastructure   
**returns**: | {Real} undefined on success, otherwise the same id. useful for chaining calls - `ds = rousr_ds_safe_destroy(type, ds);`   
```
sr_ds_safe_destroy(_type, _ds_id)
```   
false

---

#### `sr_ds_destroy`   
| | | 
| ---------- | ------- |   
**_sr_ds**   | {Real}    
**returns**: | None   
```
sr_ds_destroy(_sr_ds)
```   
destroys a ds that has been created using a sr_*_create ds function.

---

#### `sr_ds_get_type`   
| | | 
| ---------- | ------- |   
**_sr_ds**   | {Real}    
**returns**: | {Real:ERousrDS}   
```
sr_ds_get_type(_sr_ds)
```   
Returns the sr_ds type

---

#### `sr_ds_get_count`   
| | | 
| ------------- | ---------------- |   
**_sr_ds_type** | {Real:ERousrDS}    
**returns**:   | None   
```
sr_ds_get_count(_sr_ds_type)
```   
returns the total count of this ds type currently in the game

---

#### `sr_list_create`   
**returns**: | {Real}   
```
sr_list_create()
```   
Creates a new `sr_list`

---

#### `sr_array_to_list`   
| | | 
| ---------- | -------- |   
**_array**   | {Array}    
**returns**: | {Array}   
```
sr_array_to_list(_array)
```   
converts an array to a `sr_list`

---

#### `sr_list_to_array`   
| | | 
| ---------- | ------- |   
**_list**    | {Real}    
**returns**: | {Array}   
```
sr_list_to_array(_list)
```   
Converts a `sr_list` to an array

---

#### `sr_list_mark_as`   
| | | 
| ---------- | ----------- |   
**_sr_list** | {Real}    
**_index**   | {Real}    
**_type**    | {ERousrDS}    
**returns**: | None   
```
sr_list_mark_as(_sr_list, _index, _type)
```   
Creates a nested association at given index

---

#### `sr_list_add_list`   
| | | 
| ------------- | ------- |   
**_sr_list**    | {Real}    
**_child_list** | {Real}    
**returns**:   | None   
```
sr_list_add_list(_sr_list, _child_list)
```   
Adds a new list to the list and creates an association

---

#### `sr_list_add_map`   
| | | 
| ---------- | ------- |   
**_sr_list** | {Real}    
**_sr_map**  | {Real}    
**returns**: | None   
```
sr_list_add_map(_sr_list, _sr_map)
```   
Adds a new map to the list and creates an association

---

#### `sr_map_create`   
**returns**: | {Real}   
```
sr_map_create()
```   
Creates a new `sr_map`

---

#### `sr_map_mark_as`   
| | | 
| ---------- | ----------- |   
**_sr_map**  | {Real}    
**_key**     | {Real}    
**_type**    | {ERousrDS}    
**returns**: | None   
```
sr_map_mark_as(_sr_map, _key, _type)
```   
Creates a nested association at given key

---

#### `sr_map_add_list`   
| | | 
| ---------- | ------- |   
**_sr_map**  | {Real}    
**_key**     | {*}    
**_sr_list** | {Real}    
**returns**: | None   
```
sr_map_add_list(_sr_map, _key, _sr_list)
```   
Sets the list to a key in the map and creates an association

---

#### `sr_map_add_map`   
| | | 
| ---------- | ------- |   
**_sr_map**  | {Real}    
**_key**     | {*}    
**_child**   | {Real}    
**returns**: | None   
```
sr_map_add_map(_sr_map, _key, _child)
```   
Sets the child map to a key in the map and creates an association

---

#### `sr_grid_create`   
| | | 
| ---------------------------- | ------- |   
**_cols**                      | {Real}    
**_rows**                      | {Real}    
**[_default_value=undefined]** | {Real}    
**returns**:                  | {Real}   
```
sr_grid_create(_cols, _rows, [_default_value=undefined])
```   
Creates a new `sr_grid`

---

#### `sr_grid_mark_as`   
| | | 
| ---------- | ---------------- |   
**_sr_grid** | {Real}    
**_x**       | {Real}    
**_y**       | {Real}    
**_type**    | {Real:ERousrDS}    
**returns**: | None   
```
sr_grid_mark_as(_sr_grid, _x, _y, _type)
```   
Creates a nested association at given x/y coord

---

#### `sr_queue_create`   
**returns**: | {Real}   
```
sr_queue_create()
```   
Creates a new `sr_queue`

---

#### `sr_priority_create`   
**returns**: | {Real}   
```
sr_priority_create()
```   
Creates a new `sr_priority`

---

#### `sr_stack_create`   
**returns**: | {Real}   
```
sr_stack_create()
```   
Creates a new `sr_stack`

---

#### `__sr_ds_init`   
**returns**: | None   
```
__sr_ds_init()
```   
create internal data structures

---

