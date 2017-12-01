// (c) @babyjeans Nov 2017

///@i 
/*
![imguigml_banner](http://imgurlinkeroo)
# imguigml

Wow! What can I say guys? ImGui in GML? amiright? lets hear a round of applause. alright, alright. alright settle down now. alright. seriously, we got a whole read me to go here. settle down. SETTLE down. jesus. some people.

### Overview

GML Bindings for [dear imgui,]()

* [Usage](#usage)
* [ImGui and IDs](#imgui-and-ids)
* [Changelist](#changelist)
  * [Coming Soon](#coming-soon)
  * [Unsupported Features](#unsupported-features)


### Usage

*   drop the `imguigml` object into your game, and voila. it begins activated.
*   call `imgui_deactivate();` and `imgui_activate()` for hiding/showing, which also stops all updates. 
    *   _imgui is **inaccessible completely** when deactivated_

For most imgui functions, it's a straight wrap through. Call whatever you're looking for with 

`imguigml_<function>` as opposed to `ImGui::<function>` from the C++ analog.

### ImGui and IDs

_Copy and pasted from the ImGui Documentation from v1.53 of dear ImGui, edited for GML_


- Elements that are not clickable, such as Text() items don't need an ID.

- Interactive widgets require state to be carried over multiple frames (most typically Dear ImGui often needs to remember what is 
  the "active" widget). to do so they need a unique ID. unique ID are typically derived from a string label or an integer index.

    imguigml_button("OK");        // Label = "OK",     ID = hash of "OK"
    imguigml_button("Cancel");    // Label = "Cancel", ID = hash of "Cancel"

- ID are uniquely scoped within windows, tree nodes, etc. so no conflict can happen if you have two imguigml_buttons called "OK"
  in two different windows or in two different locations of a tree.

- If you have a same ID twice in the same location, you'll have a conflict:

    imguigml_button("OK");
    imguigml_button("OK");           // ID collision! Both imguigml_buttons will be treated as the same.

  Fear not! this is easy to solve and there are many ways to solve it!

- When passing a label you can optionally specify extra unique ID information within string itself. 
  This helps solving the simpler collision cases. Use "##" to pass a complement to the ID that won't be visible to the end-user:

    imguigml_button("Play");         // Label = "Play",   ID = hash of "Play"
    imguigml_button("Play##foo1");   // Label = "Play",   ID = hash of "Play##foo1" (different from above)
    imguigml_button("Play##foo2");   // Label = "Play",   ID = hash of "Play##foo2" (different from above)

- If you want to completely hide the label, but still need an ID:

    Checkbox("##On", &b);   // Label = "",       ID = hash of "##On" (no label!)

- Occasionally/rarely you might want change a label while preserving a constant ID. This allows you to animate labels.
  For example you may want to include varying information in a window title bar (and windows are uniquely identified by their ID.. obviously)
  Use "###" to pass a label that isn't part of ID:

    imguigml_button("Hello###ID";   // Label = "Hello",  ID = hash of "ID"
    imguigml_button("World###ID";   // Label = "World",  ID = hash of "ID" (same as above)

- Use imguigml_push_id() / imguigml_pop_id() to create scopes and avoid ID conflicts within the same Window.
  This is the most convenient way of distinguishing ID if you are iterating and creating many UI elements.
  You can push a string or an integer value. Remember that ID are formed from the concatenation of everything in the ID stack!

    for (int i = 0; i < 100; i++)
    {
      imguigml_push_id(i);
      imguigml_button("Click");   // Label = "Click",  ID = hash of integer + "label" (unique)
      imguigml_pop_id();
    }

    for (int i = 0; i < 100; i++)
    {
      var inst_id = Instancse[i];
      imguigml_push_id(inst_id);
      imguigml_button("Click");   // Label = "Click",  ID = hash of instance_id + "label" (unique)
      imguigml_pop_id();
    }

    for (int i = 0; i < 100; i++)
    {
      var inst = Instances[i];
      imguigml_push_id(instance.name);
      imguigml_button("Click");   // Label = "Click",  ID = hash of string + "label" (unique)
      imguigml_pop_id();
    }

- More example showing that you can stack multiple prefixes into the ID stack:

    imguigml_button("Click");     // Label = "Click",  ID = hash of "Click"
    imguigml_push_id("node");
    imguigml_button("Click");     // Label = "Click",  ID = hash of "node" + "Click"
      imguigml_push_id(my_ptr);
        imguigml_button("Click"); // Label = "Click",  ID = hash of "node" + ptr + "Click"
      imguigml_pop_id();
    imguigml_pop_id();

- Tree nodes implicitly creates a scope for you by calling imguigml_push_id().

    imguigml_button("Click");     // Label = "Click",  ID = hash of "Click"
    if (imguigml_tree_node("node"))
    {
      imguigml_button("Click");   // Label = "Click",  ID = hash of "node" + "Click"
      imguigml_tree_pop();
    }

- When working with trees, ID are used to preserve the open/close state of each tree node.
  Depending on your use cases you may want to use strings or indices as ID.
  e.g. when displaying a single object that may change over time (dynamic 1-1 relationship), using a static string as ID will preserve your
    node open/closed state when the targeted object change.
  e.g. when displaying a list of objects, using indices as ID will preserve the node open/closed state differently. 
    experiment and see what makes more sense!

### Reference

<list of functions>

### Changelist

*   **v0.2.0:** First "private" release
  *   **v0.2.1:** Hot Fix: fix _overlay in `imguigml_plot_histogram`
  *   **v0.2.2:** Hot Fix: BeginChild/EndChild weren't implemented
  *   **v0.2.3:** Hot Fix: BeginChild` :eye_roll:
      *   also, removed IM_ASSERT from the DLL, will need to add logging later.
      
#### Coming Soon

**WIP**
*   Keyboard Input Support
*   Mouse Wheel Support
*   Callbacks across the board need to be implemented
    *   `SetNextWindowSizeConstraints`
*   Widgets
    *   String manager
        *   Manage / Store buffers and strings for widget (general) use
    *   ListBox
        *   Add getter override version
        *   ImGuiListClipper Support
    *   InputText, InputTextMultiLine
        *   Add ImGuiTextEditCallback support
            *   Return `!= 0` on `CallbackCharFilter` to filter characters
            *   Watch other events?
    *   Combo
        *   Support getter callback
        *   Support `_items_separated_by_zeros`
    *   PlotLines
        *   Support getter callback
    *   PlotHistogram
        *   Support getter callbacks
*   SetStateStorage / UnsetStateStorage
    *   Not sure what these are for, may support?
*   Images
    *   Image / Texture Manager 
        *   Loading Textures for ImGui Use
*   Fonts
    *   Font manager
        *   Loading TTF fonts
    *   ImGui::PushFont()
    *   ImGui::PopFont()
    *   ImGui::GetFont()
*   ImDrawList
    *   Drawing Primitives

#### Unsupported functions

**Probably never coming:**

*   **Internal Context Access:** Since pointers are hard to work with in GML, currently this doesn't make much sense to support.
    *   Context Manager
        *   ImGui::CreateContext
        *   ImGui::DestroyContext
        *   ImGui::GetCurrentContext
        *   ImGui::SetCurrentContext
*   **IO functions:** Not sure what you're going to try to pull here..
    *   Memory Manager
        *   ImGui::MemAlloc
        *   ImGui::MemFree
*/