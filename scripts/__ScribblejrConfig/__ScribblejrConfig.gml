//Scaling values passed to Scribblejr*Ext functions will scale up and down text. However, you may
//not want to scale sprites that have been inserted into the string in the same way. Setting this
//macro to <false> will keep sprites unscaled (scaling factor = 1) relative to the specified text
//scale.
//
// N.B. If ScribblejrShrinkExt() or ScribblejrFitExt() require the string to be scaled down then
//      sprites will be scaled down regardless of this macro's value.
#macro SCRIBBLEJR_SCALE_SPRITES  true

//Whether to reset draw state after Scribblejr calls. This slighly impacts performance for the
//worse but it is very convenient.
#macro SCRIBBLEJR_AUTO_RESET_DRAW_STATE  true

//How many iterations to perform when fitting text inside the bounding box. This only applies to
//ScribblejrFit() and ScribblejrFitExt(). Higher numbers are more accurate but slower. Values lower
//than 4 tend to break!
#macro SCRIBBLEJR_FIT_ITERATIONS  6

//Whether to give in-line sprites drop shadows in approximately the same fashion as SDF drop
//shadows. Sprite drop shadows will not respect the "softness" setting that is available for SDF
//drop shadows. Additionally, turning this feature on will incur a performance penalty.
#macro SCRIBBLEJR_SHADOW_SPRITES  false

//Amount of time per frame that Scribble Junior is allowed to bake vertex buffers. This limit is
//approximate. You can adjust the budget time at runtime by calling ScribblejrSetBudget(). If this
//macro is set to zero or a negative number then all vertex buffer baking will be disabled until
//ScribblejrSetBudget() is called with a positive number.
#macro SCRIBBLEJR_BUDGET  200 //microseconds

//How many glyphs to write per text element per frame during progressive baking. Higher values
//will bake vertex buffers faster but may cause Scribble Junior to exceed the time budget.
#macro SCRIBBLEJR_BAKE_GLYPH_COUNT  20

//Whether to automatically bake vertex buffers for text drawn with Scribble Jr.  Setting this macro
//to <false> will prevent Scribble Jr. from optimising text drawing in the background.
#macro SCRIBBLEJR_AUTO_BAKE  true

//Scaling factor applied to every font.
#macro SCRIBBLEJR_GLOBAL_FONT_SCALE  1

//Whether to force bilinear filter for baked SDF rendering. Set this to <true> for convenience,
//set this to <false> for a slight speed boost.
#macro SCRIBBLEJR_FORCE_BILINEAR_FOR_SDF  true

//Whether to emit lots of additional debug messages to help track Scribble Junior's behaviour.
#macro SCRIBBLEJR_VERBOSE  false

//Functions to call when Scribblejr emits messages. Change these if you want to redirect Scribblejr
//messages to something other than the console / native error handler.
#macro SCRIBBLEJR_SHOW_DEBUG_MESSAGE  show_debug_message //Warnings and general information
#macro SCRIBBLEJR_SHOW_ERROR          show_error         //Fatal errors