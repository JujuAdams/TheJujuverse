/// If no duration is specified for a transition, this value is used instead
#macro PINOCCHIO_DEFAULT_DURATION  500

/// Setting this macro to <false> will set the units for durations throughout to frames rather than
/// milliseconds. You will need to adjust all your durations (including PINOCCHIO_DEFAULT_DURATION
/// above) accordingly
#macro PINOCCHIO_USE_MILLISECONDS  true

/// This macro defines the substring that's used to join two state names together to make the name
/// of a transition e.g. If we want to define a transition that links the "initial" and the "create"
/// states, we would use "initial_to_create". You may have a particular preference for what substing
/// should be used, you're welcome to change this macro to suit that preference
#macro PINOCCHIO_TRANSITION_SUBSTRING  "_to_"

/// For a complex set of animation states, it might be a lot of work to define every single transition.
/// Instead, you can use a wildcard to reduce the workload. For example, if you have a "left" and a
/// "right" state and you want to define their transition to the "final" state then you'd create a single
/// "any_to_final" transition. Similarly you can use a wildcard to define a transition *away* from a
/// state to many other states too (which would look like "state_to_any". Finally, you can define an
/// "any_to_any" transition and it'll apply to every single transition!
#macro PINOCCHIO_TRANSITION_WILDCARD_STATE  "any"

/// Use this value when defining the animation curve for a variable to indicate that you  don't want a
/// variable to interpolate at all. It will instead snap to its final value at the end of the transition
#macro PINOCCHIO_CURVE_NONE  "none"

/// Similar to the above, only the value will snap to its final value at the very start of the transition
#macro PINOCCHIO_CURVE_INSTANT  "instant"

/// Safe mode performs lots of extra checks to ensure that the puppet is being set up correctly. This
/// involves a lot of string processing which is, unfortunately, rather slow. In order to get a little
/// performance boost you may want to set this macro to <false> to turn off those checks
#macro PINOCCHIO_SAFE_MODE  true

/// How many Bezier curve points should be generated when creating a new Bezier curve.
/// A higher number is more accurate but makes it slower to create new Bezier curves
#macro PINOCCHIO_BEZIER_CACHE_ACCURACY  30

/// Name of the standard initial state. Every rule struct must contain an initial state
#macro PINOCCHIO_INITIAL_STATE_NAME  "initial"

/// Name of the standard final state. It is recommend that most, if not every, rules
/// struct contains a final state
#macro PINOCCHIO_FINAL_STATE_NAME  "final"