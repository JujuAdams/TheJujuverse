#define sr_array
///@function sr_array(_rousr_array, _index, [_val]) 
///@description return an index, or set an index in a `_rousr_array`
///@param {Array} _rousr_array   rousr_array to read / write
///@param {Real}        _index   index to read or write to
///@param {*}           [_val]   if passed, value to set element to, same as insert.
var _rousr_array = argument[0],
          _index = argument[1];
          
#region Set

if (argument_count > 2) {
  var _set = argument[2];
  
  var _size = sr_array_size(_rousr_array);
  if (_index < _size ) {
    var _data = sr_array_data(_rousr_array);
    _data[@ _index] = _set;
  } else
    sr_array_insert(_rousr_array, _index, _set);
  return;
} 

#endregion
#region Get

var size = sr_array_size(_rousr_array);
if (_index < size) {
  var data = sr_array_data(_rousr_array);
  return data[_index];
}

#endregion

#define sr_array_create
///@function sr_array_create([_array], [_arraySize])
///@description create a `rousr style` array, with the size as the first element, and the actual array as second
///@param {Array}    [_array]   array to wrap
///@param {Real} [_arraySize]   if `_array`s size is cached, pass it.
var _array     = argument_count > 0 ? argument[0] : [ ];
var _arraySize = argument_count > 1 ? argument[1] : array_length_1d(_array);
return [ 
  _arraySize, // ERousrArray.Count
  _array      // ERousrArray.Array
];

#define sr_array_data
///@function sr_array_data(_rousr_array)
///@description return the data of the `rousr_array`
///@param _rousr_array - `rousr_array` to get the data from
///@returns {Array} data in the `rousr_array`
gml_pragma("forceinline");
var _rousr_array = argument0;
return _rousr_array[ERousrArray.Data]; 

#define sr_array_destroy
///@function sr_array_destroy(_array)
///@description destroy a `rousr style` array - currently does nothing, but future proofing by including.
///@param {Array} _array  - array to destroy
gml_pragma("forceinline");
var _array = argument0;
_array[@ ERousrArray.Size]  = 0;
_array[@ ERousrArray.Array] = [ ];

#define sr_array_find
///@function sr_array_find(_rousr_array, _val, [_startIndex=0])
///@description returns the first occurence of _val beginning at _startIndex
///@param {Array}   _rousr_array - rousr_array to search
///@param {*}               _val - value to search for
///@param {Real} [_startIndex=0] - index to start searching from
///@returns {Real} index or -1 if not found
gml_pragma("forceinline");

var _rousr_array =  argument[0],
            _val =  argument[1],
     _startIndex = (argument_count > 2 ? argument[2] : 0);

var _array = _rousr_array[ERousrArray.Array],
     _size = _rousr_array[ERousrArray.Size];

for (var i = _startIndex; i < _size; ++i)
  if (_array[i] == _val) return i;

return -1;

#define sr_array_insert
///@function sr_array_insert(_rousr_array, _index, _val)
///@description insert a value into a rousr array
///@param {Array} _rousr_array  rousr array to insert value into
///@param {Real}        _index  index to insert value at
///@param {*}             _val  value to insert
///@returns {Boolean} true on success
gml_pragma("forceinline");

var _rousr_array = argument[0],
          _index = argument[1],
            _val = argument[2];

var _array = _rousr_array[ERousrArray.Array],
     _size = _rousr_array[ERousrArray.Size];

if (_index == 0) {
  return sr_array_push_front(_rousr_array, _val) >= 0;
} else if (_index >= _size) {
  _array[@ _index] = _val;
  _rousr_array[@ ERousrArray.Size] = _index + 1;
  return true;
} else {
  var tmpArray = array_create(_size + 1);
  array_copy(tmpArray, 0, _array, 0, _index);
  array_copy(tmpArray, _index + 1, _array, _index, _size - _index)
  
  tmpArray[@ _index] = _val;
  
  _rousr_array[@ ERousrArray.Array] = tmpArray;
  _rousr_array[@ ERousrArray.Size]  = _size + 1;
  
  return true;
}

return false;


#define sr_array_pop_back
///@function sr_array_pop_back(_rousr_array)
///@description pop the back of a rousr array and return it
///@param {Array} _rousr_array - rousr array to pop last value of
///@returns {*} back, or undefined on failure
gml_pragma("forceinline");

var _rousr_array = argument[0];
var _array = _rousr_array[ERousrArray.Array],
     _size = _rousr_array[ERousrArray.Size];

if (_size == 0)
  return undefined;

return sr_array_remove(_array, _size - 1);

#define sr_array_pop_front
///@function sr_array_pop_front(_rousr_array)
///@description pop the front of an array and return it
///@param {Array} _rousr_array - rousr array to pop last value of
///@returns {*} front or undefined
gml_pragma("forceinline");

var _rousr_array = argument[0];
var _array = _rousr_array[ERousrArray.Array],
     _size = _rousr_array[ERousrArray.Size];

if (_size == 0)
  return undefined;
  
return sr_array_remove(_array, 0);

#define sr_array_push_back
///@function sr_array_push_back(_rousr_array, _val)
///@description push a value on the end of a rousr_array
///@param {Array} _rousr_array - _rousr_array to push data to
///@param {*}       _val       - value to push onto the array
///@returns {Real} index pushed or -1 on error
gml_pragma("forceinline");

var _rousr_array = argument[0],
            _val = argument[1]; 
var       _array = _rousr_array[ERousrArray.Array],
           _size = _rousr_array[ERousrArray.Size];

var  index = _size;

_array[@ index]                  = _val;
_rousr_array[@ ERousrArray.Size] = index + 1;

return index;


#define sr_array_push_front
///@function sr_array_push_front(_rousr_array, _val)
///@description push a value on the front of a rousr array
///@param {Array} _array      - rousr_array to push data to
///@param {*}       _val      - value to push onto the array
///@returns {Real} index pushed or -1 on error
gml_pragma("forceinline");

var _rousr_array = argument[0],
            _val = argument[1];
var _array = _rousr_array[ERousrArray.Array],
     _size = _rousr_array[ERousrArray.Size];

var index = 0;
var tmpArray = array_create(_size + 1);
tmpArray[@ index] = _val;
array_copy(tmpArray, 1, _array, 0, _size);

_rousr_array[@ ERousrArray.Array] = tmpArray;
_rousr_array[@ ERousrArray.Size] = _size + 1;

return index;

#define sr_array_push_unique
///@function sr_array_push_unique(_rousr_array, _val, [_returnIndexOnExists=false])
///@description push a value on the end of a rousr array, but only if value isn't in the array already
///@param {Array}                   _rousr_array - rousr_array to push data to
///@param {*}                               _val - value to push onto the array
///@param {Boolean} [_returnIndexOnExists=false] - if true returns index if it already exists, otherwise returns undefined (to signal failure)
///@returns {Real} index pushed or -1 if it's not unique
gml_pragma("forceinline");

var _rousr_array = argument[0],
            _val = argument[1];
var _array = _rousr_array[ERousrArray.Array],
     _size = _rousr_array[ERousrArray.Size];
var _returnIndexOnExists = argument_count > 3 ? argument[3] : false;

var index = sr_array_find(_array, _val, 0);
if (index < 0)
  return (_returnIndexOnExists ? index : -1);

index = _size;    

_array[@ index]                  = _val;
_rousr_array[@ ERousrArray.Size] = _size + 1;

return index;


#define sr_array_remove
///@function sr_array_remove(_rousr_array, _index)
///@description generate a new array with _index removed from the `_rousr_array`
///@param {Array} _rousr_array - rousr_array to remove element at `_index` from
///@param {Real}        _index - index to remove from _array
///@returns {*} element at removed index, or undefined
gml_pragma("forceinline");
var _rousr_array = argument0,
          _index = argument1;
var  _size = _rousr_array[ERousrArray.Size],
    _array = _rousr_array[ERousrArray.Array];

if (_size == 0 || _index >= _size)
  return undefined;
  
var newSize = _size - 1;
var newArray = array_create(newSize);
var dstIndex = 0,
    srcIndex = 0;

if (_index != 0) {
  var cpySize = (_index - srcIndex); 
  array_copy(newArray, dstIndex, _array, srcIndex, cpySize);
  dstIndex += cpySize;
} 

srcIndex = _index + 1;
if (srcIndex < _size)
  array_copy(newArray, dstIndex, _array, srcIndex, _size - srcIndex);

_rousr_array[@ ERousrArray.Array] = newArray;
_rousr_array[@ ERousrArray.Size]  = newSize;

return _array[_index];

#define sr_array_remove_multi
///@function sr_array_remove_multi(_array, _index_array, [_index_array_size])
///@description generate a new array with _index removed from the `_rousr_array`
///@param {Array}       _rousr_array  - rousr array to remove element at `_index` from
///@param {Real}        _index_array  - index to remove from _array (note: normal array)
///@param {Real}  [_index_array_size] - size of `_index_array` if you've already cached it.
///@returns {Array} removed values or undefined if error
gml_pragma("forceinline");
var _rousr_array = argument[0],
    _indices     = argument[1];
var _indexCount  = argument_count > 3 ? argument[3] : array_length_1d(_indices);
var  _size = _rousr_array[ERousrArray.Size],
    _array = _rousr_array[ERousrArray.Array];


if (_indexCount == 0 || _size == 0)
  return undefined;
  
var newSize = _size - _indexCount;
var removed = array_create(_indexCount);
var newArray = array_create(newSize);
var dstIndex = 0,
    srcIndex = 0;

for (var i = 0; i < _indexCount; ++i) {
  var index = _indices[i];
  removed[i] = _array[index];
  
  if (index != 0) {
    var cpySize = (index - srcIndex); 
    array_copy(newArray, dstIndex, _array, srcIndex, cpySize);
    dstIndex += cpySize;
  } 

  srcIndex = index + 1;
}

if (srcIndex < _size)
  array_copy(newArray, dstIndex, _array, srcIndex, _size - srcIndex);

_rousr_array[@ ERousrArray.Size] = newSize;
_rousr_array[@ ERousrArray.Data] = newArray;

return removed;

#define sr_array_size
///@function sr_array_size(_rousr_array, [_new_size])
///@description return the size of the `rousr_array`
///@param _rousr_array       - `rousr_array` to get the size of
///@param {Real} [_new_size] - if passed, sets the size of the array to this new size
///@returns {Real} size of `rousr_array` (before it was set new, if `_new_size` is passed)
gml_pragma("forceinline");
var _rousr_array = argument[0];
var size = _rousr_array[ERousrArray.Size];

if (argument_count > 1) _rousr_array[@ ERousrArray.Size] = argument[1];

return size;

#define sr_array_clear
///@functiontion sr_array_clear(_rousr_array, [_flush_mem=false])
///@description emtpy a rousr_array
///@param {Real}     _rousr_array        array to clear, sets size=0
///@param {Boolean} [_flush_mem=false]   if true, we will replace the data array with a new, empty array.
///@returns {Array} _ra
var _ra    = argument[0],
    _flush = argument_count > 1 ? argument[1] : false;
		
_ra[@ ERousrArray.Size] = 0;
if (_flush)
	_ra[@ ERousrArray.Data] = [ ];
	
return _ra;

#define sr_stack_array_create
///@function sr_stack_array_create()
///@description create a `rousr_stack_array` - a stack purely made of arrays
///@returns {Array} rousr_stack_array
///@see ERousrStackArray
var rousr_stack_array = array_create(ERousrStackArray.Num);
rousr_stack_array[@ ERousrStackArray.Stack] = [ ];
rousr_stack_array[@ ERousrStackArray.Top]   = -1;

return rousr_stack_array;

#define sr_stack_array_destroy
///@function sr_stack_array_destroy(_rousr_stack_array)
///@description destroy a `rousr_stack_array` - since they're made up of arrays, this is unnecessary to call, but provided future API use or re-using stack arrays.
///@param {Array} _rousr_stack_array - `rousr_stack_array` to destroy
///@see ERousrStackArray
gml_pragma("forceinline");
var _rousr_stack_array = argument0;

_rousr_stack_array[@ ERousrStackArray.Stack] = [ ];
_rousr_stack_array[@ ERousrStackArray.Top]   = -1;

#define sr_stack_array_empty
///@function sr_stack_array_empty(_rousr_stack_array)
///@description check if a stack is empty
///@param {Array} _rousr_stack_array - `rousr_stack_array` to check
///@returns {Boolean} true if `_rousr_stack_array` is empty
gml_pragma("forceinline");
var top = sr_stack_array_top(argument0);
return top < 0;

#define sr_stack_array_pop
///@function sr_stack_array_pop(_rousr_stack_array)
///@description pop the last `val`  from a `_rousr_stack_array`
///@param {Array} _rousr_stack_array - `rousr_stack_array` array object to pop
///@returns {*} the end of the stack, or undefined if empty
gml_pragma("forceinline");
var _rousr_stack_array = argument[0];

var top   = _rousr_stack_array[ERousrStackArray.Top];
var stack = _rousr_stack_array[ERousrStackArray.Stack];

if (top < 0) 
  return undefined;
  
var _val = stack[top--];
_rousr_stack_array[@ ERousrStackArray.Top] = top;

//todo: garbage collection pass
// flush the array if we've cleaned the stack out
//if (top < 0) _rousr_stack_array[@ ERousrStackArray.Stack] = [ ];

return _val;

#define sr_stack_array_push
///@function sr_stack_array_push(_rousr_stack_array, _val)
///@description push a `_val` onto the stack of a `_rousr_stack_array`
///@param {Array} _rousr_stack_array - `rousr_stack_array` to push `_val` on to
///@param {*} _val                   - value to push on stack
///@returns {Real} new top index
var _rousr_stack_array = argument[0],
                  _val = argument[1];

var top   = _rousr_stack_array[ERousrStackArray.Top];
var stack = _rousr_stack_array[ERousrStackArray.Stack];

top++;
stack[@ top] = _val;
_rousr_stack_array[@ ERousrStackArray.Top] = top;

return top;

#define sr_stack_array_top
///@function sr_stack_array_top(_rousr_stack_array)
///@description return the top index of a `rousr_stack_array`
///@param {Array} _rousr_stack_array - `rousr_stack_array` to get top index of
///@returns {Real} index of top, or -1 if empty
gml_pragma("forceinline");

var _rousr_stack_array = argument0;
var top = _rousr_stack_array[ERousrStackArray.Top];

return top;	

#define sr_buffer_read_val
///@function sr_buffer_read_val(_buffer)
///@description Reads a value from a packed buffer, first reading data type to expect.
///@param {Real} _buffer - id of buffer we're reading the _next_ value from
///@returns {Real|String} return of the buffer read
var _buffer = argument0;

var dataType = buffer_read(_buffer, buffer_s8);
var bdt = sr_buffer_rousr_type_to_buffer_type(dataType);
if (bdt == undefined)
  return undefined;
  
return buffer_read(_buffer, bdt);


#define sr_buffer_write_val
///@function sr_buffer_write_val(_buffer, _val, [_type=ERousrData.Invald])
///@description writes a value to the buffer, but first writes the type
///@param {Real}                               _buffer - buffer id to write to
///@param {Real|String}                        _val    - val to write to the buffer
///@param {Real|String} [type=ERousrData.Invalid] - the forced type to use, can be string, or ERousrData
///@returns {Boolean} true on success
var _buffer = argument[0];
var _val    = argument[1];
var _type   = argument_count > 2 ? argument[2] : ERousrData.Invalid;

if (_type == undefined || _type == ERousrData.Invalid) {
  if (is_real(_val))        _type = ERousrData.Double;
  else if (is_string(_val)) _type = ERousrData.String;
  else if (is_bool(_val))   _type = ERousrData.Bool;
  else if (is_int32(_val) || is_int64(_val))  _type = ERousrData.Int32;
//else if (is_int64(_val))  _type = ERousrData.Int64; // int64 is unsupported
  else return false; // invalid type
} else if (!is_real(_val) && !is_bool(_val) && !is_string(_val) && !is_int32(_val) && !is_int64(_val)) {
  return false; // invalid type
}

if (_type != ERousrData.String && is_string(_val)) _type = ERousrData.String;
if (_type == ERousrData.Bool) _val = _val ? 1 : 0;

var bdt = sr_buffer_rousr_type_to_buffer_type(_type);
if (bdt == undefined) 
  return false;

buffer_write(_buffer, buffer_s8, _type);
buffer_write(_buffer, bdt, _val);

// cap with a -1
var bend = buffer_tell(_buffer);
buffer_write(_buffer, buffer_s8, -1);
buffer_seek(_buffer, buffer_seek_start, bend);

return true;


#define sr_buffer_rousr_type_to_buffer_type
///@function sr_buffer_rousr_type_to_buffer_type(_type)
///@description return a buffer type from a luarousr data type
///@param {Real} _type - The ERousrData to get buffer_xx of
///@returns {Real} buffer_xx to use for this type when writing to a buffer
var _type = argument0;
var bdt = buffer_f64;
switch (_type) {
  case ERousrData.Bool:   bdt = buffer_s8; break;
  case ERousrData.Byte:   bdt = buffer_s8; break;
                                   
  case ERousrData.Int8:   bdt = buffer_s8; break;
  case ERousrData.Int16:  bdt = buffer_s16; break;
  case ERousrData.Int32:  bdt = buffer_s32; break;
  //case ERousrData.Int64:  bdt = buffer_s64; break; // Unsupported
                                   
  case ERousrData.Uint8:  bdt = buffer_u8; break;
  case ERousrData.Uint16: bdt = buffer_u16; break;
  case ERousrData.Uint32: bdt = buffer_u32; break;
  case ERousrData.Uint64: bdt = buffer_u64; break;
       
  //case __ELuaRousrDataTypeFloat16: bdt = buffer_f16; break; // Also unsupported (though buffer_f16 exists)
  case ERousrData.Float:  bdt = buffer_f32; break;
  case ERousrData.Double: bdt = buffer_f64; break;
  
  case ERousrData.String: bdt = buffer_string; break;

  default: bdt = undefined;
}

return bdt;


#define sr_pool_create_pool
///@function sr_pool_create_pool(_alloc_script, [_destroy_script], [_reset_script], [_constructor_script])
///@description create a `rousr_pool`, using the `_alloc_script` to create them. use `_destroy_script` to remove datastructures that are pooled. `rousr_pools` allow you to create generic pools of similiar objects for pooling resources, rather than allocating brand new ones at run-time.
///@param {Real} _alloc_script     - script to call for a new element of this `rousr_pool`  **Format:** `function(_rousr_pool) -> returns {*} newly created object` (the way you'd create a new one without a pool)
///@param {Real} [_destroy_script] - script to call to destroy / free the element **Format:** `function(_rousr_pool, _elem) -> No Return`
///@param {Real} [_reset_script]   - script to call to reset an element after its returned to the pool **Format:** ``function(_rousr_pool, _elem) -> No Return`
///@param {Real} [_constructor]    - script to call on returning a new element from the pool **Format:** `function(_rousr_pool, _elem) -> No Return`
///@returns {Array} undefined or new `rousr_pool`
gml_pragma("forceinline");

var _alloc       = argument[0];
var _destroy     = argument_count > 1 ? argument[1] : noone;
var _reset       = argument_count > 2 ? argument[2] : noone;
var _constructor = argument_count > 3 ? argument[3] : noone;

var pool = array_create(ERousrPool.Num);

pool[@ ERousrPool.All]       = sr_array_create();
pool[@ ERousrPool.Available] = sr_stack_array_create();

pool[@ ERousrPool.Alloc]       = _alloc;
pool[@ ERousrPool.Destroy]     = _destroy;
pool[@ ERousrPool.Reset]       = _reset;
pool[@ ERousrPool.Constructor] = _constructor;
  
return pool; 

#define sr_pool_destroy_pool
///@function sr__pool_destroy_pool(_rousr_pool)
///@description destroy a `rousr_pool` and free its memory use (data structures)
///@param {Array} _rousr_pool - `rousr_array_pool` to destroy
gml_pragma("forceinline");
var _rousr_pool = argument0;
if (!is_array(_rousr_pool))
  return;
 
var array   = _rousr_pool[@ ERousrPool.All];
var destroy = _rousr_pool[@ ERousrPool.Destroy];

var data = sr_array_data(array);
var size = sr_array_size(array);

for (var i = 0; i < size && destroy != noone; ++i)
  script_execute(destroy, _rousr_pool, array[i]);  

sr_array_destroy(array); 
sr_stack_array_destroy(_rousr_pool[ERousrPool.Available]);

_rousr_pool[ERousrPool.All]         = noone;
_rousr_pool[ERousrPool.Destroy]     = noone;
_rousr_pool[ERousrPool.Reset]       = noone;
_rousr_pool[ERousrPool.Constructor] = noone; 

#define sr_pool_create
///@function sr_pool_create(_rousr_pool, [_constructor])
///@description get a fresh item, optionally call the passed constructor on the object. 
///@param {Array} _rousr_pool   - the `rousr_pool` object to allocate new element from
///@param {Real} [_countructor] - called on the new object. if a constructor was defined for the pool, this *OVERRIDES* it. **Format:** `function(_rousr_pool, _elem) -> No Return`
///@returns {*} a new element from the `rousr_pool`
var _rousr_pool  = argument[0],
    _constructor = argument_count > 1 ? argument[1] : _rousr_pool[ERousrPool.Constructor];

var avail = _rousr_pool[@ERousrPool.Available];
var elem  = undefined;

if (sr_stack_array_empty(avail)) {
  var alloc = _rousr_pool[ERousrPool.Alloc];
  var array = _rousr_pool[ERousrPool.All];
  
  elem = script_execute(alloc, _rousr_pool);
  sr_array_push_back(array, elem); // track it to free memory with pool
} else {
  elem = sr_stack_array_pop(avail);
}

if (elem != undefined && _constructor != noone)
  script_execute(_constructor, _rousr_pool, elem);

return elem; 

#define sr_pool_release
///@function sr_pool_release(_rousr_pool, _element)
///@description returns element to the pool to be stored and reused
///@param {Array} _rousr_pool - `rousr_pool` to put `_element` in.
///@param {*} _element        - an `_element` compatible with `rousr_pool`
var _rousr_pool = argument0;
var _element = argument1;

var avail = _rousr_pool[ERousrPool.Available];
var reset = _rousr_pool[ERousrPool.Reset];

if (reset != noone)
  script_execute(reset, _rousr_pool, _element);

sr_stack_array_push(avail, _element);

#define sr_buffer_pool
///@function sr_pool_buffer(_buffer_size, _buffer_type, _buffer_alignment)
///@description helper function to create a `rousr_pool` of buffers
///@param {Real} _buffer_size      - size of the buffers to generate
///@param {Real} _buffer_type      - buffer type to pass through to `buffer_create` i.e., `buffer_u8`
///@param {Real} _buffer_alignment - alignment, in bytes, of buffer
///@returns {Array} `rousr_pool` setup to manage bufferses
gml_pragma("forceinline");
var buffer_args = array_create(ERousrPool_Buffer_UserData.Num);

buffer_args[@ ERousrPool_Buffer_UserData.Size]      = argument0;
buffer_args[@ ERousrPool_Buffer_UserData.Type]      = argument1;
buffer_args[@ ERousrPool_Buffer_UserData.Alignment] = argument2;

var buffer_pool = sr_pool_create_pool(__extrousrds_script_index(__sr_buffer_pool_alloc), __extrousrds_script_index(__sr_buffer_pool_destroy), __extrousrds_script_index(__sr_buffer_pool_reset));
buffer_pool[@ ERousrPool.UserData] = buffer_args;

return buffer_pool;

#define __sr_buffer_pool_alloc
///@function _rousr_pool_buffer_create(_rousr_pool)
///@description create a new buffer
///@param {Array} _rousr_pool - `rousr_pool` that owns the created buffer
///@returns {Real} buffer id for created buffer
var _rousr_pool = argument0;
var user_data = _rousr_pool[@ ERousrPool.UserData];

var size      = user_data[ERousrPool_Buffer_UserData.Size];
var type      = user_data[ERousrPool_Buffer_UserData.Type];
var alignment = user_data[ERousrPool_Buffer_UserData.Alignment];

return buffer_create(size, type, alignment);

#define __sr_buffer_pool_destroy
///@function _rousr_pool_buffer_destroy(_rousr_pool, _buffer)
///@description destroy a pooled buffer
///@param {Array} _rousr_pool - `rousr_pool` that contains the buffer
///@param {Real}  _buffer - id of a buffer
var _rousr_pool = argument0;
var _buffer = argument1;

buffer_delete(_buffer);

#define __sr_buffer_pool_reset
///@function _rousr_pool_buffer_reset(_rousr_pool, _buffer)
///@description reset a buffer, after being returned to the pool
///@param {Array} _rousr_pool - pool being returned to
///@param {Real} _buffer      - buffer id of buffer being returned
var _rousr_pool = argument0;
var _buffer = argument1;

buffer_seek(_buffer, buffer_seek_start, 0);

#define sr_json_decode
///@function sr_json_decode(_json)
///@param {String} _json
gml_pragma("forceinline");

var _text = argument0,
	_index = 0,
	_stack = sr_stack_array_create(),
	_key_stack = sr_stack_array_create(),
	_stack_data = _stack[ERousrStackArray.Stack],
	_has_value = false,
	_current_value = "",
	_current_value_is_real = false,
	_string = undefined,
	_ch = undefined,
	_expect = undefined,
	_length = string_length(_text);

while(_index < _length){
	if(_has_value){
		//Skip to next character
		_RousrDSJsonDecodeNext;	
	}else{
		//Skip to the next character ignoring all whitespace
		_RousrDSJSONDecodeNextWhite;	
	}
	
	//Unexpected characters
	if(!is_undefined(_expect)){
		var _match = false;
		
		if(is_string(_expect)){
			//Must match string
			if(_ch == _expect) _match = true;
		}
		
		if(is_array(_expect)){
			//Must match one of these strings
			var _i=0;
			repeat(array_length_1d(_expect)){
				if(_expect[_i++] == _ch){ _match = true; break; }
			}
		}
		
		if(!_match){
			if(_ch != _expect) show_error("Invalid JSON! expected ` " + string(_expect) + " ' got ' " + string(_ch) +" '", true);
		}
		_expect = undefined;
	}
	
	if(_has_value && (_ch == "]" || _ch == "}")){
		//Force a comma - which will end the current_value parsing
		_ch = ",";
		_index--;
	}
	
	switch(_ch){
		case "{":
			//start a map
			var _map = sr_map_create(),
				_parent = _RousrDSJSONDecodeTop;
			//Push to stack 
			sr_stack_array_push(_stack, _map);
			
			//Nesting
			if(!is_undefined(_parent)){
				switch(sr_ds_get_type(_parent)){
					case ERousrDS.List:  sr_list_add_map(_parent, _map);                                   break;
					case ERousrDS.Map:   sr_map_add_map(_parent, sr_stack_array_pop(_key_stack), _map);    break;
				}
			}
			//Expect a quote or end of object
			_expect = ["\"", "}"];
		break;
		case ":":
			//Mark previous item as map key
			sr_stack_array_push(_key_stack, string(_current_value));
			_RousrDSJSONDecodeResetValue;
		break;
		case "[":
			//Start a list
			var _list = sr_list_create(),
				_parent = _RousrDSJSONDecodeTop;
			//Push to stack
			sr_stack_array_push(_stack, _list);
			
			//Nesting
			if(!is_undefined(_parent)){
				switch(sr_ds_get_type(_parent)){
					case ERousrDS.List:  sr_list_add_list(_parent, _list);                                 break;
					case ERousrDS.Map:   sr_map_add_list(_parent, sr_stack_array_pop(_key_stack), _list);  break;
				}
			}			
		break;
		case "}":
		case "]":
			//Finish DS
			if(sr_stack_array_top(_stack) != 0){
				sr_stack_array_pop(_stack);	
				_RousrDSJSONDecodeResetValue;
				//Expect another item or end of parent
				_expect = [","];
				var _parent = _RousrDSJSONDecodeTop;
				_expect[@ 1] = (sr_ds_get_type(_parent) == ERousrDS.List) ? "]" : "}";
			}
		break;
		case ",":
			if(!_has_value) break;
			var _parent = _RousrDSJSONDecodeTop;
			//Finish current item ( non-ds)
			if(!is_undefined(_current_value)){
				_current_value = (_current_value_is_real) ? real(_current_value) : string(_current_value);
			}
			
			switch(sr_ds_get_type(_parent)){
				case ERousrDS.List: ds_list_add(_parent, _current_value); break;
				case ERousrDS.Map: _parent[?  sr_stack_array_pop(_key_stack)] = _current_value; break; 
			}
			_RousrDSJSONDecodeResetValue;
		break;
		default:
			if(!_has_value){
				//Start parsing value 
				_has_value = true;
				if(_ch == "f"){
					var _values = ["f", "a", "l", "s", "e"],
						_result = false,
						_i=0;
					while(true){
						if(_i >= array_length_1d(_values)){
							_current_value = _result;
							_current_value_is_real = true;
							break;
						}
						if(_ch != _values[_i]){
							show_error("Inavlid JSON! Was expecting ` false `", true);
							break;
						}
						_RousrDSJsonDecodeNext;
						++_i;
					}
					break;
				}
				
				if(_ch == "t"){
					var _values = ["t", "r", "u", "e"],
						_result = true,
						_i=0;
					while(true){
						if(_i >= array_length_1d(_values)){
							_current_value = _result;
							_current_value_is_real = true;
							break;
						}
						if(_ch != _values[_i]){
							show_error("Inavlid JSON! Was expecting ` true `", true);
							break;
						}
						_RousrDSJsonDecodeNext;
						++_i;
					}
					break;
				}
				
				if(_ch == "n"){
					var _values = ["n", "u", "l", "l"],
						_result = undefined,
						_i=0;
					while(true){
						if(_i >= array_length_1d(_values)){
							_current_value = _result;
							_current_value_is_real = true;
							break;
						}
						if(_ch != _values[_i]){
							show_error("Inavlid JSON! Was expecting ` null `", true);
							break;
						}
						_RousrDSJsonDecodeNext;
						++_i;
					}
					break;
				}
				
				if(_ch == "\""){
					//Don't record first quote of string
					break;
				}
				_current_value_is_real = true;
			}
			
			if(_current_value_is_real && _ch == " "){
				break;
			}else if(!_current_value_is_real && _ch == "\"") { 
				_RousrDSJSONDecodeNextWhite;
				--_index;
				break; 
			} 
			
			_current_value += _ch;
		break;
	}
}

if(sr_stack_array_top(_stack)){
	show_error("Invalid JSON! JSON object was not properly closed", true);
}

return sr_stack_array_pop(_stack);


#define sr_json_encode
///@function sr_json_encode(_sr_serializable, [_pretty_print]
///@param {Real} _sr_serializable
///@param {Boolean} [_pretty_print=false]
///@param TODO: Pretty print
var _value = argument[0],
	_type = sr_ds_get_type(_value),
	_pretty_print = (argument_count > 1) ? argument[1] : false;

if(_type != ERousrDS.List && _type != ERousrDS.Map && _type != ERousrDS.Grid){
	show_error("Invalid ERousrDS type ` " + string(_type) + " ` given. This type is not serializable", true);
	exit;
}

return __sr_json_encode_type(_value, _type, _pretty_print, 0); 

#define __sr_json_encode_type
///@function __sr_json_encode_type(_sr_ds, _type, [_pretty_print=false], [_indent_length=0])
///@param {Real} _sr_ds
///@param {Real} _type 
///@param {Boolean} [_pretty_print=false]
///@param {Real} [_indent_length=0]
///@extensionizer { "docs": "false" }
var _id = argument[0],
	_type = argument[1],
	_pretty_print = (argument_count > 2) ? argument[2] : false,
	_indent_length = (argument_count > 3) ? argument[3] : 0,
	_newline = (_pretty_print) ? "\n" : "",
	_indent = "";

repeat(_indent_length){
	_indent+=" ";	
}

switch(_type){
	case ERousrDS.List:
		var _list = _id,
		    _data = sr_array(_RousrDSContainer, frac(_id)*100),
		    _nested = _data[ERousrDSData.Nested],
		    _nested_indices = array_create(ds_list_size(_list), undefined),
		    _output = _indent + "[ " + _newline;
		
		repeat(4) _indent += " ";

		//Build nested index list 
		var _i=0;
		repeat (sr_array_size(_nested)) {
			var _nested_data = sr_array(_nested, _i++),
				_index = _nested_data[0],
				_type = _nested_data[1];
			_nested_indices[@ _index] = _type;
		}

		var _i = 0;
		repeat(ds_list_size(_list)){
			var _nested_type = _nested_indices[_i];
			if (is_real(_nested_type)) {
				_output += __sr_json_encode_type(_list[| _i], _nested_type, _pretty_print, _indent_length+4);
			} else {
				var _value = _list[| _i];

				if(is_undefined(_value)){
					_value = "null";	
				}else if(is_string(_value)){
					_value = "\""+_value+"\"";	
				}else if(is_real(_value)){
					_value = string(_value);
				}
				
				_output += _indent + _value;
			}
			if(_i < ds_list_size(_list)-1){
				_output += ", ";
			}
			_output+=_newline;
			++_i;
		}
		
		_indent = "";
		repeat(_indent_length){
			_indent+=" ";	
		}
		
		_output += _indent + " ]";

		return _output;	
	break;
	case ERousrDS.Map:
		var _map = _id,
			_data = sr_array(_RousrDSContainer, frac(_id) * 100),
			_nested = _data[ERousrDSData.Nested],
			_nested_keys = ds_map_create(),
			_output = _indent + "{ " + _newline,
			_key = ds_map_find_first(_map);
		
		repeat(4) _indent += " ";
		
		//Build nested index list 
		var _i=0;
		repeat(sr_array_size(_nested)){
			var _nested_data = sr_array(_nested, _i++),
				_key = _nested_data[0],
				_type = _nested_data[1];
			_nested_keys[? _key] = _type;
		}
		
		var _i=0;
		repeat(ds_map_size(_map)){
			var _nested_type = _nested_keys[? _key];
			if(is_real(_nested_type)){
				_output += __sr_json_encode_type(_map[? _key], _nested_type, _pretty_print, _indent_length + 4);
			}else{
				var _value = _map[? _key];

				if(is_undefined(_value)){
					_value = "null";	
				}else if(is_string(_value)){
					_value = "\""+_value+"\"";	
				}else if(is_real(_value)){
					_value = string(_value);
				}
				_output += _indent+"\"" + string(_key) + "\"" + " : " + _value;
			}
			if(_i < ds_map_size(_map)-1){
				_output += ", ";
			}
			_key = ds_map_find_next(_map, _key);
			_output+=_newline;
			++_i;
		}
		
		
		_indent = "";
		repeat(_indent_length){
			_indent+=" ";	
		}
		
		_output+= _indent + "}";
		
		ds_map_destroy(_nested_keys);
		return _output;
	break;
}


#define sr_sort_quick
///@description implement a quicksort you can pass a predicate to
/// port from http://www.algolist.net/Algorithms/Sorting/Quicksort
///@param list
///@param comparison
var _list    = argument0;
var _compare = argument1;

var size = ds_list_size(_list);
var sortStack = array_create(size); //floor(j/4)); // guesstimate
var stackHeight = 0;
sortStack[0] = 0;
sortStack[1] = size - 1;
stackHeight = 2;

while (stackHeight > 0) {
  var i = sortStack[stackHeight - 2];
  var j = sortStack[stackHeight - 1];
  var left = i, right = j;
  var pivot = _list[| floor((left + right) / 2)];
  stackHeight -= 2;
  
  // i do believe we can swap a BST in here
  while (i <= j) {
    while (script_execute(_compare, _list[| i], pivot) < 0) // if (_list[|i] < pivot)
      i++;
    while (script_execute(_compare, _list[| j], pivot) > 0) // if (_list[|j] > pivot)
      j--;
    if (i <= j) {
      var tmp = _list[|i];
      _list[|i] = _list[|j];
      _list[|j] = tmp;
      i++;
      j--; 
    }
  }

  /* "recursion" */
  if (i < right) {
    sortStack[stackHeight] = i;
    sortStack[stackHeight + 1] = right;
    stackHeight+=2;
  }

  if (left < j) {
    sortStack[stackHeight] = left;
    sortStack[stackHeight + 1] = j;
    stackHeight+=2;
  }   
}

#define sr_sort_insert
///@description an insertion sort with a predicate
///ported from http://www.algolist.net/Algorithms/Sorting/Insertion_sort
///cause why not?
///@param list
///@param predicate
var _list = argument0, _compare = argument1;

var len = ds_list_size(_list);
for (var i = 1;  i < len; ++i) {
  var j = i;
  while (j > 0 && script_execute(_compare, _list[| j - 1], _list[| j]) > 0) {
    var tmp = _list[| j];
    _list[| j] = _list[|j - 1];
    _list[| j - 1] = tmp;
    j--;
  }
}

#define sr_ds_safe_destroy
///@function sr_ds_safe_destroy(_type, _ds_id)
///@description check if `_ds_id` is a valid `_type` and destroy it if it is, returning the new id to use for _ds_id (undefined in most cases)
///@param {Real} _type - type of data structure, i.e., `ds_type_map`, `ds_type_list`
///@param {Real} _ds_id - id for the datastructure
///@returns {Real} undefined on success, otherwise the same id. useful for chaining calls - `ds = rousr_ds_safe_destroy(type, ds);`
gml_pragma("forceinline");

var _type  = argument0;
var _ds_id = argument1;

if (is_real(_ds_id)) {
  switch(_type) {
    case ds_type_grid:     ds_grid_destroy(_ds_id);     break;
    case ds_type_list:     ds_list_destroy(_ds_id);     break;
    case ds_type_map:      ds_map_destroy(_ds_id);      break;
    case ds_type_priority: ds_priority_destroy(_ds_id); break;
    case ds_type_queue:    ds_queue_destroy(_ds_id);    break;
    case ds_type_stack:    ds_stack_destroy(_ds_id);    break;
    default: return _ds_id;
  }
  return undefined;
}

return _ds_id;

#define sr_ds_destroy
///@function sr_ds_destroy(_sr_ds)
///@desc destroys a ds that has been created using a sr_*_create ds function.
///@param {Real} _sr_ds 
var _id       = argument0,
    _rousr_id = frac(argument0)*100,
    _data     = sr_array(_RousrDSContainer, _rousr_id);

if(!is_array(_data)) {
	show_debug_message("Warning! Cannot destroy sr_ds. " + string(_id) + " does not exist");	
	exit;
}

var _type = _data[0];
switch(_type){
	case ERousrDS.List:     
		var _nested = _data[ERousrDSData.Nested],
			  _i = 0;
		repeat (sr_array_size(_nested)) {
			var _nested_data = sr_array(_nested, _i++);
			sr_ds_destroy(_id[| _nested_data[0]]);	
		}
		ds_list_destroy(_id);     
	break;
	
	case ERousrDS.Map:      
		var _nested = _data[ERousrDSData.Nested],
			  _i = 0;
		repeat (sr_array_size(_nested)) {
			var _nested_data = sr_array(_nested, _i++);
			sr_ds_destroy(_id[? _nested_data[0]]);	
		}
		ds_map_destroy(_id);       
	break;
	
	case ERousrDS.Grid:     
		var _nested = _data[ERousrDSData.Nested],
			  _i = 0;
		
		repeat (sr_array_size(_nested)) {
			var _nested_data = sr_array(_nested, _i++);
			sr_ds_destroy(_id[# _nested_data[0], _nested_data[1]]);	
		}
		ds_grid_destroy(_id);     
	break;
	
	//Does not contain associations
	case ERousrDS.Queue:    ds_queue_destroy(_id);    break;
	case ERousrDS.Priority: ds_priority_destroy(_id); break;
	case ERousrDS.Stack:    ds_stack_destroy(_id);    break;
}

_RousrDSCount[@ _type] = _RousrDSCount[_type] - 1;
sr_array(_RousrDSContainer, _rousr_id, undefined);
sr_stack_array_push(_RousrDSFree, _rousr_id);

#define sr_ds_get_type
///@function sr_ds_get_type(_sr_ds)
///@desc Returns the sr_ds type
///@param {Real} _sr_ds
///@returns {Real:ERousrDS} 
var _id = argument0,
	_rousr_id = frac(argument0)*100,
	_data = sr_array(_RousrDSContainer, _rousr_id);

return _data[0];

#define sr_ds_get_count
///@function sr_ds_get_count(_sr_ds_type)
///@param {Real:ERousrDS} _sr_ds_type
///@desc returns the total count of this ds type currently in the game 
return _RousrDSCount[argument0];

#define _sr_ds_register
///@function _sr_ds_register(_type, _value)
///@param {Real} _type
///@param {*} _value 
///@returns {Real} original_id.sr_id
///@extensionizer { "docs": false } 
var _type = argument0,
	_value = argument1,
	_sr_id = sr_stack_array_empty(_RousrDSFree) ? sr_array_size(_RousrDSContainer) : sr_stack_array_pop(_RousrDSFree),
	_id = _value + _sr_id / 100,
	_data = array_create(ERousrDSData.Num);

_data[@ ERousrDSData.Id] = _id;
_data[@ ERousrDSData.Type] = _type;
_data[@ ERousrDSData.Nested] = sr_array_create();
sr_array(_RousrDSContainer, _sr_id, _data);

_RousrDSCount[@ _type] = _RousrDSCount[_type] + 1;

return _id;


#define sr_list_create
///@function sr_list_create()
///@desc Creates a new `sr_list`
///@returns {Real}
return _sr_ds_register(ERousrDS.List, ds_list_create());

#define sr_array_to_list
///@function sr_array_to_list(_array)
///@desc converts an array to a `sr_list`
///@param {Array} _array
///@returns {Array}
var _array = argument0,
	_list = sr_list_create(),
	_i=0;
repeat(array_length_1d(_array)){
	ds_list_add(_list, _array[_i++]);
}

return _list;


#define sr_list_to_array
///@function sr_list_to_array(_list)
///@desc Converts a `sr_list` to an array
///@param {Real} _list
///@returns {Array}
var _list = argument0,
	_array = array_create(ds_list_size(_list)),
	_i=0;
repeat(array_length_1d(_array)){
	_array[@ _i] = _list[| _i];
	++_i;
}

return _array;


#define sr_list_mark_as
///@function sr_list_mark_as(_sr_list, _index, _type)
///@desc Creates a nested association at given index 
///@param {Real} _sr_list
///@param {Real} _index
///@param {ERousrDS} _type
var _list = argument0,
	_index = argument1,
	_type = argument2,
	_data = sr_array(_RousrDSContainer, frac(_list)*100);
	
sr_array_push_back(_data[ERousrDSData.Nested], [_index, _type]); 

#define sr_list_add_list
///@function sr_list_add_list(_sr_list, _child_list)
///@desc Adds a new list to the list and creates an association 
///@param {Real} _sr_list
///@param {Real} _child_list
var _list = argument0,
	_child = argument1;

ds_list_add(_list, _child);
sr_list_mark_as(_list, ds_list_size(_list)-1, ERousrDS.List);

#define sr_list_add_map
///@function sr_list_add_map(_sr_list, _sr_map)
///@desc Adds a new map to the list and creates an association 
///@param {Real} _sr_list
///@param {Real} _sr_map
var _list = argument0,
	_map = argument1;

ds_list_add(_list, _map);
sr_list_mark_as(_list, ds_list_size(_list)-1, ERousrDS.Map);

#define sr_map_create
///@function sr_map_create()
///@desc Creates a new `sr_map`
///@returns {Real}
return _sr_ds_register(ERousrDS.Map, ds_map_create());

#define sr_map_mark_as
///@function sr_map_mark_as(_sr_map, _key, _type)
///@desc Creates a nested association at given key
///@param {Real} _sr_map
///@param {Real} _key
///@param {ERousrDS} _type
var _list = argument0,
	_key = argument1,
	_type = argument2,
	_data = sr_array(_RousrDSContainer, frac(_list)*100);



sr_array_push_back(_data[ERousrDSData.Nested], [_key, _type]); 

#define sr_map_add_list
///@function sr_map_add_list(_sr_map, _key, _sr_list)
///@desc Sets the list to a key in the map and creates an association
///@param {Real} _sr_map
///@param {*} _key
///@param {Real} _sr_list
var _map = argument0,
	_key = argument1,
	_list = argument2;
_map[? _key] = _list;

sr_map_mark_as(_map, _key, ERousrDS.List);

#define sr_map_add_map
///@function sr_map_add_list(_sr_map, _key, _child_map)
///@desc Sets the child map to a key in the map and creates an association
///@param {Real} _sr_map
///@param {*} _key
///@param {Real} _child
var _map = argument0,
	_key = argument1,
	_child = argument2;
_map[? _key] = _child;

sr_map_mark_as(_map, _key, ERousrDS.Map);

#define sr_grid_create
///@function sr_grid_create(_cols, _rows, [_default_value=undefined])
///@desc Creates a new `sr_grid`
///@param {Real} _cols
///@param {Real} _rows
///@param {Real} [_default_value=undefined]
///@returns {Real}
var _cols = argument[0],
	_rows = argument[1],
	_default = (argument_count > 2 ) ? argument[2] : undefined,
	_value = _sr_ds_register(ERousrDS.Grid, ds_grid_create(_cols, _rows));

if(_default != undefined){
	ds_grid_set_region(_value, 0, 0, _cols-1, _rows-1, _default);
}
              
return _value;

#define sr_grid_mark_as
///@function sr_grid_mark_as(_sr_grid, _x, _y, _type)
///@desc Creates a nested association at given x/y coord
///@param {Real} _sr_grid
///@param {Real} _x
///@param {Real} _y
///@param {Real:ERousrDS} _type
var _list = argument0,
	_x = argument1,
	_y = argument2,
	_type = argument3,
	_data = sr_array(_RousrDSContainer, frac(_list)*100);

sr_array_push_back(_data[ERousrDSData.Nested], [_x, _y, _type]); 

#define sr_queue_create
///@function sr_queue_create()
///@desc Creates a new `sr_queue`
///@returns {Real}
return _sr_ds_register(ERousrDS.Queue, ds_queue_create());

#define sr_priority_create
///@function sr_priority_create()
///@desc Creates a new `sr_priority`
///@returns {Real}
return _sr_ds_register(ERousrDS.Priority, ds_priority_create());

#define sr_stack_create
///@function sr_stack_create()
///@desc Creates a new `sr_stack`
///@returns {Real}
return _sr_ds_register(ERousrDS.Stack, ds_stack_create());

#define __sr_ds_init
///@function __sr_ds_init()
///@desc create internal data structures

//Internal DS
_RousrDSContainer = sr_array_create();
_RousrDSFree = sr_stack_array_create();
_RousrDSCount = array_create(ERousrDS.Num);

//Call this script
gml_pragma("global", "__sr_ds_init()");

#define __extrousrds_script_index
///@function __extrousrds_script_index(ext_script_index)
///@desc Returns the actual runtime script index because YYG doesn't know how to do that apparently
///@param {Real} ext_script_index
///@extensionizer { "docs": false, "export": true} 
///@returns {Real} script_index
gml_pragma("forceinline")
gml_pragma("global", "global.__extrousrds_script_index_lookup = array_create(0);global.__extrousrds_script_index_lookup[@ sr_array] = asset_get_index(\"sr_array\");global.__extrousrds_script_index_lookup[@ sr_array_create] = asset_get_index(\"sr_array_create\");global.__extrousrds_script_index_lookup[@ sr_array_data] = asset_get_index(\"sr_array_data\");global.__extrousrds_script_index_lookup[@ sr_array_destroy] = asset_get_index(\"sr_array_destroy\");global.__extrousrds_script_index_lookup[@ sr_array_find] = asset_get_index(\"sr_array_find\");global.__extrousrds_script_index_lookup[@ sr_array_insert] = asset_get_index(\"sr_array_insert\");global.__extrousrds_script_index_lookup[@ sr_array_pop_back] = asset_get_index(\"sr_array_pop_back\");global.__extrousrds_script_index_lookup[@ sr_array_pop_front] = asset_get_index(\"sr_array_pop_front\");global.__extrousrds_script_index_lookup[@ sr_array_push_back] = asset_get_index(\"sr_array_push_back\");global.__extrousrds_script_index_lookup[@ sr_array_push_front] = asset_get_index(\"sr_array_push_front\");global.__extrousrds_script_index_lookup[@ sr_array_push_unique] = asset_get_index(\"sr_array_push_unique\");global.__extrousrds_script_index_lookup[@ sr_array_remove] = asset_get_index(\"sr_array_remove\");global.__extrousrds_script_index_lookup[@ sr_array_remove_multi] = asset_get_index(\"sr_array_remove_multi\");global.__extrousrds_script_index_lookup[@ sr_array_size] = asset_get_index(\"sr_array_size\");global.__extrousrds_script_index_lookup[@ sr_array_clear] = asset_get_index(\"sr_array_clear\");global.__extrousrds_script_index_lookup[@ sr_stack_array_create] = asset_get_index(\"sr_stack_array_create\");global.__extrousrds_script_index_lookup[@ sr_stack_array_destroy] = asset_get_index(\"sr_stack_array_destroy\");global.__extrousrds_script_index_lookup[@ sr_stack_array_empty] = asset_get_index(\"sr_stack_array_empty\");global.__extrousrds_script_index_lookup[@ sr_stack_array_pop] = asset_get_index(\"sr_stack_array_pop\");global.__extrousrds_script_index_lookup[@ sr_stack_array_push] = asset_get_index(\"sr_stack_array_push\");global.__extrousrds_script_index_lookup[@ sr_stack_array_top] = asset_get_index(\"sr_stack_array_top\");global.__extrousrds_script_index_lookup[@ sr_buffer_read_val] = asset_get_index(\"sr_buffer_read_val\");global.__extrousrds_script_index_lookup[@ sr_buffer_write_val] = asset_get_index(\"sr_buffer_write_val\");global.__extrousrds_script_index_lookup[@ sr_buffer_rousr_type_to_buffer_type] = asset_get_index(\"sr_buffer_rousr_type_to_buffer_type\");global.__extrousrds_script_index_lookup[@ sr_pool_create_pool] = asset_get_index(\"sr_pool_create_pool\");global.__extrousrds_script_index_lookup[@ sr_pool_destroy_pool] = asset_get_index(\"sr_pool_destroy_pool\");global.__extrousrds_script_index_lookup[@ sr_pool_create] = asset_get_index(\"sr_pool_create\");global.__extrousrds_script_index_lookup[@ sr_pool_release] = asset_get_index(\"sr_pool_release\");global.__extrousrds_script_index_lookup[@ sr_buffer_pool] = asset_get_index(\"sr_buffer_pool\");global.__extrousrds_script_index_lookup[@ __sr_buffer_pool_alloc] = asset_get_index(\"__sr_buffer_pool_alloc\");global.__extrousrds_script_index_lookup[@ __sr_buffer_pool_destroy] = asset_get_index(\"__sr_buffer_pool_destroy\");global.__extrousrds_script_index_lookup[@ __sr_buffer_pool_reset] = asset_get_index(\"__sr_buffer_pool_reset\");global.__extrousrds_script_index_lookup[@ sr_json_decode] = asset_get_index(\"sr_json_decode\");global.__extrousrds_script_index_lookup[@ sr_json_encode] = asset_get_index(\"sr_json_encode\");global.__extrousrds_script_index_lookup[@ __sr_json_encode_type] = asset_get_index(\"__sr_json_encode_type\");global.__extrousrds_script_index_lookup[@ sr_sort_quick] = asset_get_index(\"sr_sort_quick\");global.__extrousrds_script_index_lookup[@ sr_sort_insert] = asset_get_index(\"sr_sort_insert\");global.__extrousrds_script_index_lookup[@ sr_ds_safe_destroy] = asset_get_index(\"sr_ds_safe_destroy\");global.__extrousrds_script_index_lookup[@ sr_ds_destroy] = asset_get_index(\"sr_ds_destroy\");global.__extrousrds_script_index_lookup[@ sr_ds_get_type] = asset_get_index(\"sr_ds_get_type\");global.__extrousrds_script_index_lookup[@ sr_ds_get_count] = asset_get_index(\"sr_ds_get_count\");global.__extrousrds_script_index_lookup[@ _sr_ds_register] = asset_get_index(\"_sr_ds_register\");global.__extrousrds_script_index_lookup[@ sr_list_create] = asset_get_index(\"sr_list_create\");global.__extrousrds_script_index_lookup[@ sr_array_to_list] = asset_get_index(\"sr_array_to_list\");global.__extrousrds_script_index_lookup[@ sr_list_to_array] = asset_get_index(\"sr_list_to_array\");global.__extrousrds_script_index_lookup[@ sr_list_mark_as] = asset_get_index(\"sr_list_mark_as\");global.__extrousrds_script_index_lookup[@ sr_list_add_list] = asset_get_index(\"sr_list_add_list\");global.__extrousrds_script_index_lookup[@ sr_list_add_map] = asset_get_index(\"sr_list_add_map\");global.__extrousrds_script_index_lookup[@ sr_map_create] = asset_get_index(\"sr_map_create\");global.__extrousrds_script_index_lookup[@ sr_map_mark_as] = asset_get_index(\"sr_map_mark_as\");global.__extrousrds_script_index_lookup[@ sr_map_add_list] = asset_get_index(\"sr_map_add_list\");global.__extrousrds_script_index_lookup[@ sr_map_add_map] = asset_get_index(\"sr_map_add_map\");global.__extrousrds_script_index_lookup[@ sr_grid_create] = asset_get_index(\"sr_grid_create\");global.__extrousrds_script_index_lookup[@ sr_grid_mark_as] = asset_get_index(\"sr_grid_mark_as\");global.__extrousrds_script_index_lookup[@ sr_queue_create] = asset_get_index(\"sr_queue_create\");global.__extrousrds_script_index_lookup[@ sr_priority_create] = asset_get_index(\"sr_priority_create\");global.__extrousrds_script_index_lookup[@ sr_stack_create] = asset_get_index(\"sr_stack_create\");global.__extrousrds_script_index_lookup[@ __sr_ds_init] = asset_get_index(\"__sr_ds_init\");global.__extrousrds_script_index_lookup[@ rousr_ds_definitions] = asset_get_index(\"rousr_ds_definitions\");");

var _index = argument0;return global.__extrousrds_script_index_lookup[@ _index];
