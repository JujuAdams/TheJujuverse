///@function rousr_callstack_defines()
///@desc (do not call) rousr callstack definitions and enums
///@extensionizer { "export": false, "docs": false }
enum ERousrCallStatus {
  Invalid = -2,
  Error   = -1,
   
  Done = 0,
  Init,
  Ready,
  Working,

  Num
};


enum ERousrCall {
  Id = 0,
  Buffer,
  BufferSize,
  BufferIndex,
  
  Num,
}

enum ERousrCallstack {
  Calls = 0,
  Free,  
  Buffers,
  QueueCleanUp,
  LastId,
  
  Num,
};