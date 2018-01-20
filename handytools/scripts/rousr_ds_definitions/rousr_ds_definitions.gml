///@function rousr_ds_definitions()
///@description enums / macros for rousr buffer functions (no need to call)
///@extensionizer { "export": false, "docs": false }
#region rousr array definition

enum ERousrArray {
  Count = 0,
  Array,
  
  Last = ERousrArray.Array,
  
  // Synonyms
  Size = ERousrArray.Count, 
  Data = ERousrArray.Array,
  Num  = ERousrArray.Count  // special-case where I abuse `Num` 
};

#endregion



#region rousr stack array defintiions

enum ERousrStackArray {
  Stack = 0,
  Top,
  
  Num,
};

#endregion

#region buffer definitions
// The ordering of this is consistent with rousr based DLLs, 
// so DO NOT CHANGE.
enum ERousrData {
	Byte = 0,
	Bool,

	Int8,
	Int16,
	Int32,
	Int64,

	Uint8,
	Uint16,
	Uint32,
	Uint64,
		
	Float,
	Double,
	String,

	Num,
  Invalid = ERousrData.Num
}; 
  
#macro _RousrDefaultBufferSize (4096)
#endregion

#region rousr_pool definitions

enum ERousrPool {
  All = 0,
  Available,
  
  Alloc,
  Destroy,
  Reset,
  Constructor, 
  
  UserData, 
  
  Num
};

enum ERousrPool_Buffer_UserData {
  Size = 0,
  Type,
  Alignment,
  
  Num,
};

#endregion

#region rousr datastructure util defs

#macro _RousrDSContainer   global._rousr_ds_container
#macro _RousrDSFree        global._rousr_ds_free
#macro _RousrDSCount       global._rousr_ds_count

//DS Types
enum ERousrDS {
	RousrArray = 0,
	RousrStackArray,
	List,
	Queue,
	Priority,
	Stack,
	Map,
	Grid,
	
	Num
}

//Data structure - goes in DSContainer
enum ERousrDSData {
	Type = 0,
	Id, 
	Nested,
	
	Num
}

#endregion

#region rousr_json

#macro _RousrDSJSONDecodeSkipWhite   while (string_ord_at(_text, _index) == 32 || string_ord_at(_text, _index) == 10){ ++_index; } _ch = string_char_at(_text, _index)
#macro _RousrDSJsonDecodeNext        ++_index; _ch = string_char_at(_text, _index)
#macro _RousrDSJSONDecodeNextWhite   ++_index; _RousrDSJSONDecodeSkipWhite
#macro _RousrDSJSONDecodeTop         (sr_stack_array_empty(_stack)) ? undefined : _stack_data[sr_stack_array_top(_stack)]
#macro _RousrDSJSONDecodeResetValue  _current_value = ""; _current_value_is_real = false; _has_value = false

#endregion