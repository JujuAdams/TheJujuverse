///@function rousr_bin_pack_defintiions()
///@desc definitions and enums for rousr bin packer
///@extensionizer { "export": false, "docs": false }
#region General Definitions
enum ERousrBinRect {
	Min = 0,
	Max,
	
	Num
};
#macro __h_RLBP_RectInBin  (rectangle_in_rectangle(x1, y2, x2, y2, 0, 0, bin_width, bin_height))
#endregion

#region Lazy Bin Packing defs
enum ERousrLazyBin {
	Rects = 0,
	Width,
	Height,
	
	Num
};

#endregion