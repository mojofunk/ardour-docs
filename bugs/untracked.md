# Untracked

A Place for bugs that are not yet in the tracker either because I'm offline, or I
haven't had enough time to look for existing bugs in the tracker or enter it as
a new bug.

- Ctrl+Middle click to bind controls should bring up a warning/info box if
  there is no controller active, perhaps with a don't show this again checkbox.

- Middle click to bind controller should have a timeout when no input is
  recieved with a suggestion as to how to get it to work. It could suggest
  going to midi tracer window and checking midi control input and could have an
  option to go there etc.

- Binding GUI controls should be more intuitive, possibly use a learn button
  and change colours of the GUI controls that can be bound, similar to Ableton
  Live.

- Support for VST3 plugins

- Cut a region before peak but peak shows in waveform of cut region before
  peak, can't reproduce this with 5.4.320

- Setting a sync point with 'v' key quickly fills up the undo history if you
  hold the key down. perhaps it should only set it at key press/release?

- MIDI events overlap the region frame/handle preventing region resize

- When starting Ardour for the first time it doesn't allow opening a session, a
  new junk/tmp session must be created first and then open another.

- Keybinding to loop selection?

- When region is at time 0 and the fadeout is set to start at the region start
  point there is no way to grab the fadeout handle to adjust it as it is left
  of the region but not visible on the timeline.

- When switching to note edit mode the range selection rectangle doesn't get
  hidden. Is there a purpose or a bug?

- Able to open recent session when engine stopped

- Should Xrun markers be movable?

- quantizing midi to start of region and setting loop points to start of region
  fails to play note at start of region

- Copying MIDI region to another track doesn't always copy midi events?
  sometimes a blank region is created

- Midi input ports not selectable as input in channel strip when enabling MIDI
  in a backend. e.g starting portaudio with midi backend disabled then stopping
  engine and starting engine with WINMME midi backend. ports are displayed in
  the routing window though.

- Unable to access menu with right mouse button when in draw mode in a midi
  region

- Unable to scroll when in draw mode within a midi region with region selected,
  perhaps velocity should be accessed via a modifier.

- When recording midi from a single channel the rec region displays data for
  all channels

- Disk space in info bar at top of editor window is sometimes red/invalid on
  windows(other platforms?)

- If mouse edit point is set to mouse, zooming in will use mouse as zoom point,
  unless the mouse is outside the canvas in which case it uses playhead which
  causes unexpected behaviour if you are trying to zoom in at the start of the
  session and the mouse goes into the track header. It should either stop
  zooming if mouse cursor is outside the canvas area or zoom in to the closest
  canvas edge to the mouse cursor if that is possible.

- With follow playhead on the canvas should page before the playhead cursor
  gets to the edge of the canvas so can always see what events are about to be
  played.

- Display of name highlight is broken when resizing tracks

- Using draw tool it is possible move midi event past the end of the MRV and
  canvas item isn't clipped by region view parent

- No ALSA backend with default build? add 'auto' param to --with-backends
  option?

- Placing the Draw tool at the start of a midi region causes the midi note to
  extend from the end of the region to the start of the session.

- When notes are selected and the keyboard is used to move notes, and undo/redo
  should not be created for each move, perhaps a timeout is needed.

- Hard coded key commands for internal midi editing should be
  configurable actions/key bindings.

- Moving Midi notes should be constrained/clipped to region boundaries. It
  appears like you can drag a note from one region to another when you can't.

- Clicking on the close button in the window manager will cause ardour to exit
  if the session state isn't "dirty". Closing the window may have been
  accidental.

- When adjusting the front of a midi region the ghost notes are not updated
  correctly and will still be displayed even when the parent notes are not

- Clicking on the end of a region to trim in Object "mode" without cursor
  movement sometimes results in the start and end points of the region jumping
  after the click point.

- If I start recording to a track and then click record enable on another track
  the red record rectangle will extend back to the record point of the first
  track. I'm not sure if that is intentional or bug, it only records and
  displays data after the point record was enabled.

- When a track is record enabled it is not possible to change the track name
  but there is no explanation/feedback

- Region becomes unselected when reversing using alt+5(I think)

- Measuring latency with larger spb/fpp values like 4096 returns negative
  systemic latency

- When dragging a midi region down into empty track area a new midi track is
  created with only a single midi input and output port. Perhaps the track
  should be created with the same track type as the region being dragged from?
  but then what to do when dragging a region selection that spans more than a
  single track.

- Crash when starting ALSA backend with midi device active. then stop driver,
  disable device, restart driver and show midi connections -> crash. Same for
  portaudio backend. Similarly issue when enabling midi devices, they will not
  be displayed in the midi connections window.

- With portaudio backend `midi_devices` member of EngineControl gets reset by
  maybe_display_state... between enumerating the midi devices and redisplaying
  the midi devices which means the devices will not be shown correctly in midi
  tab/page unless switching midi drivers or a valid state already exists.

- Midi note end trim tool should appear based on a fixed number of pixels not
  on a proportion of the note length

- Trim tool on midi region should always show trim tool icon with two arrows as
  the midi region can always be extended or trimmed.

- Select midi events in region1, select midi events in region 2, create midi
  region, undo will now remove new region and selection. Redo will not restore
  second midi region selection.

- Deleting selected midi notes only operates on the last region to have notes
  selected

- When importing the "copy files to session" check box is reset for each file
  selected

- Session search paths are not stored in a portable fashion

- Tracks added while transport rolling are not played back

- Ctrl + 't' to select all tracks and the 'F' to fit selected tracks causes
  canvas drawing issues at bottom of track area

- Drag and drop plugin from one track to another in mixer causes segv, may be
  windows specific.

- Removal of Nomad Factory BusDriver plugin causes segv(Windows 32-bit), not
  sure if the issue is specific to this plugin

- On windows the Ardour session files do not have an associated icon(it looks
  like a default one)

- When play midi notes as they are selected is enabled, loading a session
  causes midi notes to be played, rather than just when they are selected.

- Changing track color doesn't work if part of a group. When right clicking on
  a track header and selecting color if tracks are in group, the group color
  overrides the track color. This is fine I guess but not very obvious and made
  me think it was a bug, perhaps it should warn the user that changing the
  track color will have no affect as it is part of a group or just display a
  dialog that asks "This track is part of a group and while the track is part
  of a group the group color will override the track color, Do you want to
  change the color for the group? Yes/No

- On Windows if the audio engine is started and then I change for instance the
  samplerate setting in the RME config window, then it causes the application
  to freeze/crash.

- In the new track dialog when entering a name, hitting enter should accept the
  name and close the dialog(add tracks), currently it does nothing.

- Insert/Remove time dialog does not specify where the time will be inserted

- The name of the mode of the clock should be displayed in Insert/Remove time
  dialogs

- Pressing the Esc key while trimming a MIDI note event leaves note in strange
  state.

- Unable to undo cancelled drag of MIDI event. Pressing the Esc key to cancel
  drag of MIDI note event moves the event without adding ability to undo/redo.

- Drawing MIDI events across region boundaries indicates incorrect note
  placement? debatable whether ghost note should be shown past region end

- Trimming the length of a MIDI region and then undo doesn't display MIDI
  events

- Trimming MIDI start or end points results in missing(perhaps moved) event,
  Can't reproduce any more.

- Unable to trim/move single MIDI event to grid, unable to produce.

- Switching from Range mode to Draw mode does not hide range selection
  rectangle

- If Snap/Grid mode is set to Beats/X then MIDI events should not be able to be
  created that are smaller than the current snap to/grid setting

- Quantize dialog should be labelled to indicate that it is operating on the
  Region Selection e.g. label should be "Quantize Selected Regions".

- Scrolling on selected notes should not change note velocity without a
  modifier. This makes it hard to navigate and causes changing velocity
  unintentionally(nearly always).

- I'm not sold on vertical scroll scrolling by track rather than a pixel based
  scroll, It makes it hard to predict where a scroll will end up as larger
  tracks mean a "faster" scroll speed.

- Should scroll(not autoscroll) be disabled during drag or an option to prevent
  scrolling and zooming? perhaps I'm just uncoordinated.

- If loop end marker and session end marker are on the same position then
  moving the end marker also moves the loop marker

- Shortcut for Duplicate Range(perhaps others) doesn't always work, right
  clicking on the range to bring up the menu and then clicking outside the menu
  to hide it and then using the shortcut will now work.

- If two Regions are overlapping and the one on the right is on top then
  selecting the region on top first and then the region underneath, then
  duplicating them will put the region that was on top underneath. Selecting
  from left to right duplicates with what appears to be the correct layering.

- State of Auto-play in Import dialog is not stored and restored between
  application executions

- Shifting the contents of a region by Trimming and holding Ctrl stops if the
  cursor moves outside the canvas. Makes it hard to trim contents at start of
  timeline.

- In the ExportDialog, if you are on the last FilePage and delete export format
  you end up on a blank page and the 'add another format' button does not work.
  Either when deleting the current visible format, the page should be changed
  to the last format, or the 'add another format' button should be fixed.

- If you install Ardour major version X and already have config files for
  version X-1, then selecting no to the dialog "Would you like these files to
  be copied and used for Ardour 5.X?" does not result in the "Welcome to
  Ardour" setup dialog being displayed, so you can setup default Session
  folder, Monitoring options etc.

- In Stretch mode clicking on a Region and releasing without any mouse movement
  also triggers a time stretch (with the value 100.00 percent)

- Editing MIDI event velocity editing using Ctrl(primary modifier) and up/down
  keys is blocked by default by Move selected tracks up/down.

- Esc should close IOSelector windows

- With a vertical dual screen setup where Ardour is on the top screen, pressing
  the output routing button for a track in the Mixer causes the menu to cross
  the screens with the offical build. With a self build on Fedora 21 with
  external/system libs it pops up above the button and is usable. What is the
  reason for the difference?

- Unit test failure with an optimized build, noticed as of version 5.4.10 in
  InterpolationTest::cubicInterpolationTest

- Region menu should have Gain -> Reset Gain in addition to Boost and Cut to
  reset Region boost gain to 0.0dB

- When splitting with the edit point set to playhead, the split point is
  snapped to grid

- On AVLinux with nightly build 5.4.357 disconnecting from JACK results in
  crash/assertion

- Moving Region start or end position while playing midi note causes missing
  note-off

- Save as template does not save session first before copying Session file.
  Create 4 Tracks -> save template -> load template -> No tracks in Session

- Session templates with periods(.) in name get truncated.

- Sessions created from a template but are not explicitly saved do not get a SR
  or file resolution displayed in recent Session chooser?

- MIDI notes should be created on click rather than on release, or the ghost
  note should appear to look the same as an existing note.

- Using split/"Cut Mode" to cut a MIDI region can result in incorrect length of
  original region

- Undo/Redo for split created when no split has occurred

- Cross-Hair cursor should always be displayed in "Cut Mode" instead of just on
  mouse click

- Cross-Hair cursor should be displayed on top of regions in "Cut Mode"

- Cross-Hair cursor displayed in wrong location on mouse press with grid on in
  "Cut Mode"

- Cross-Hair cursor should always be displayed in "Draw" mode
