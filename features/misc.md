# Misc Features

- drag handle + modifier to duplicate a region, cubase uses alt.

- Use number keys for tool selection?

- Use same keybinding to maximize windows, not Ctrl + Shift + F for Mixer and Ctrl
  + Alt + F for Editor

- Use arrow keys should scroll canvas instead of moving the playhead. If shift
  is held it should move the selection by the grid setting. Moving the playhead
  should be performed using a modifier, or perhaps an option to change the
  default behaviour.

- Loop points should be Session length by default

- Loop points should adjust to tempo changes/time signature

- Shift click on a region gain control point should reset to 0dB

- shift + '+' could zoom to selection(in addition to 'z')

- shift + '+' or '-' could increase/decrease track heights, the existing
  shortcut for zoom to session could change to ctrl/alt + '-' or

- reversing region should/could also reverse fades?

- Adjust tempo using a key command while zoomed in to adjust the tempo to a
  beat, or have a checkbox to automatically apply updates on a change in dialog
  so that it is much faster

- If clicking in the timecode ruler engage zoom when moving the mouse up and
  down

- When importing number of files the session is saved after each import, it
  seems like it could just save the session file once at the end of import.

- Duplicate options to duplicate at beat/bar boundaries

- Quantize region/event selection

- The Trim handles are activated too far from the end of the region, It seems
  like it is about 10 pixels, should be about half of that. Should not have to
  zoom in so much to move small regions. This is on Windows, must test if it is
  the same on linux.

- shortcuts to step up/down the grid settings

- When plugins are rescanned the instrument combo should be refreshed in Add
  new track dialog

- Use G and H for zoom in/out

- Vertical Track zoom to display all midi notes in a region

- Copy midi notes by modifier and drag?

- Fit all tracks vertical key binding. Can be done with Ctrl+'t' then 'f'

- Constrain moving midi notes in x and y directions

- Automation points should be added while the mouse is pressed, not on release

- Global Mute indicator and disable button

- Different drawing modes for automation data, Cubase has: line, parabola,
  sine, triangle, square, paint

- Double click and drag in draw mode acts like a brush inserting notes at grid
  intervals

- Add key binding to loop region

- Add midi step editor to track context menu

- Midi draw cursor seems like it should be reversed and could use visual
  improvements

- A button in the editor to turn off follow playhead

- Add a Timebase property(Linear, Musical) to Track class that is used by
  region/playlist by default unless overridden.
