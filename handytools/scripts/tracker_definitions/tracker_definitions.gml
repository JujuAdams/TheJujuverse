//--------------------
// Configuration
//--------------------
/*
	Note that surface functionality is only partially turned on/off by TRACKER_ON
*/
#macro TRACKER_ON !RELEASE
#macro TRACKER_ILLEGAL_THROW_ERROR !RELEASE
#macro TRACKER_BLANK_NOTE_THROW_ERROR false //This feature works in conjunction with TRACKER_DEBUG_*_CREATE

//formatting
#macro TRACKER_ID_SPACE_PADDING 3
#macro TRACKER_NOTE_SPACE_PADDING 25

#macro TRACKER_DEBUG_MAP_CREATE      false //map flags
#macro TRACKER_DEBUG_MAP_DESTROY     false
#macro TRACKER_DEBUG_MAP_PROTECT     false
#macro TRACKER_DEBUG_LIST_CREATE     false //list flags
#macro TRACKER_DEBUG_LIST_DESTROY    false
#macro TRACKER_DEBUG_LIST_PROTECT    false
#macro TRACKER_DEBUG_GRID_CREATE     false //grid flags
#macro TRACKER_DEBUG_GRID_DESTROY    false
#macro TRACKER_DEBUG_GRID_PROTECT    false
#macro TRACKER_DEBUG_SURFACE_CREATE  false //surface flags
#macro TRACKER_DEBUG_SURFACE_DESTROY false
#macro TRACKER_DEBUG_SURFACE_PROTECT false
#macro TRACKER_DEBUG_SURFACE_CHECK   false
#macro TRACKER_DEBUG_VBUFF_CREATE    true //vertex buffer flags
#macro TRACKER_DEBUG_VBUFF_DESTROY   true
#macro TRACKER_DEBUG_VBUFF_PROTECT   true

//--------------------
// Internal
//--------------------
#macro TRACKER_PROTECTED_LABEL "P"
#macro TRACKER_VOLATILE_LABEL "_"