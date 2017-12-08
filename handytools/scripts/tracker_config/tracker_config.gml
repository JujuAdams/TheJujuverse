/*
	Note that Tracker surface functionality is only partially turned on/off by TRACKER_ON
*/
#macro TRACKER_ILLEGAL_THROW_ERROR (true && !RELEASE)
#macro TRACKER_BLANK_NOTE_THROW_ERROR true //This feature works in conjunction with TRACKER_DEBUG_*_CREATE
#macro TRACKER_PROTECTED_INSTANCE_CAN_DESTOY_SELF true

//formatting
#macro TRACKER_ID_SPACE_PADDING 3
#macro TRACKER_NOTE_SPACE_PADDING 25

#macro TRACKER_DEBUG_MAP_CREATE                  false //map flags
#macro TRACKER_DEBUG_MAP_DESTROY                 false
#macro TRACKER_DEBUG_MAP_PROTECT                 false
#macro TRACKER_DEBUG_LIST_CREATE                 false //list flags
#macro TRACKER_DEBUG_LIST_DESTROY                false
#macro TRACKER_DEBUG_LIST_PROTECT                false
#macro TRACKER_DEBUG_GRID_CREATE                 false //grid flags
#macro TRACKER_DEBUG_GRID_DESTROY                false
#macro TRACKER_DEBUG_GRID_PROTECT                false
#macro TRACKER_DEBUG_SURFACE_CREATE              false //surface flags
#macro TRACKER_DEBUG_SURFACE_DESTROY             false
#macro TRACKER_DEBUG_SURFACE_PROTECT             false
#macro TRACKER_DEBUG_SURFACE_CHECK               false
#macro TRACKER_DEBUG_VBUFF_CREATE                false //vertex buffer flags
#macro TRACKER_DEBUG_VBUFF_DESTROY               false
#macro TRACKER_DEBUG_VBUFF_PROTECT               false
#macro TRACKER_DEBUG_INSTANCE_CREATE             false //instance flags
#macro TRACKER_DEBUG_INSTANCE_DESTROY            false
#macro TRACKER_DEBUG_INSTANCE_PROTECT            false
#macro TRACKER_DEBUG_INSTANCE_UNEXPECTED_DESTROY false