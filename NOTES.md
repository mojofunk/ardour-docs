These are just some notes relating to usage of Ardour. There are may be some
ideas related to changing existing functionality, missing functionality or just
usage of existing functionality that I don't understand yet.

# Questions

- drag handle + modifier to duplicate a region, cubase uses alt.

- how to Replace selected regions with another region?

- Alt + s toggles solo for selected tracks, Alt + m should toggle mutes,
  although that is currently bound to toggling the mixer.

- Are there key bindings for deactivate all mutes/solos?

- Deactivate all mutes button/action

- Are there existing actions are bound to shift/ctrl/alt middle click. Some
  possible options for actions:
  - middle click for paste X style
  - middle click and drag to scroll
  - middle click + modifier for zoom to session?

- Is portaudio output latency correctly reported considering buffering

- Does Midi -> Reverse doesn't work?

- How to copy MIDI notes?

- Regions/Events should adjust on Tempo changes/BBT based track option

- Is there an action to adjust/align region end with grid alignment

- Why are there `load_session` and `load-session` executables in the
	libs/ardour build dir? profiling related?


# Ideas for changes to existing functionality or new functionality

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
