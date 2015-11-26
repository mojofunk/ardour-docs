# Notes

Place for bugs that are not yet in the tracker either because I'm offline, or I
haven't had enough time to look for existing bugs in the tracker or enter it as
a new bug.

# Untracked

- Middle click to bind controls should bring up a warning/info box if there is
  no controller active, perhaps with a don't show this again checkbox.

- Middle click to bind controller should have a timeout when no input is
  recieved with a suggestion as to how to get it to work. It could suggest
  going to midi tracer window and checking midi control input and could have an
  option to go there etc.

- Support for VST3 plugins

- Cut a region before peak but peak shows in waveform of cut region before peak

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

- Snap modifier doesn't work for MIDI notes when snap set to 'No Grid'
  When moving or adjusting the start/end of midi note with the snap to set to
  'No Grid', using the snap modifier doesn't turn snap on as it does for
  regions.

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

- Output latency is not adjusted for MIDI in portaudio backend

- Midi ports are listed under 'other' in midi connections windows, I think they
  should be under 'hardware'

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

- Hide midi note when in draw mode and cursor is within another midi note.

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

- Region become unselected when reversing using alt+5(I think)

- Measuring latency with larger spb/fpp values like 4096 returns negative systemic latency

# Windows

- [Portaudio Backend #6495](http://tracker.ardour.org/view.php?id=6495)
- [Windows plugin issues #6442](http://tracker.ardour.org/view.php?id=6442)

# Sessions

- [Renaming session results in media missing](http://tracker.ardour.org/view.php?id=6557)

# Transport and Recording

- [Playback continues past loop end #6582](http://tracker.ardour.org/view.php?id=6582)
- [Looping works incorrectly with loop as mode enabled twice #6581](http://tracker.ardour.org/view.php?id=6581)
- [Latency compensation incorrect with plugins and looping/locate](http://tracker.ardour.org/view.php?id=5781)
- [When recording in a loop some audio is not captured](http://tracker.ardour.org/view.php?id=6569)

# Backends

- [ALSA backend unable to run realtime, when jack can #6585](http://tracker.ardour.org/view.php?id=6581)

# Importing

- [Freesound import broken #6493 #6197](http://tracker.ardour.org/view.php?id=6493)

# Exporting

# Undo/Redo

- [Crash if two undo operations are performed at same time](http://tracker.ardour.org/view.php?id=6602)
- [Undo should be disabled during recording](http://tracker.ardour.org/view.php?id=6540)

# General

- [Can't audition when importing sound files for click #5599](http://tracker.ardour.org/view.php?id=5599)

- [Adding files with duplicate names via Dnd results in missing files](http://tracker.ardour.org/view.php?id=6558)
- [Dragging canvas item to far right of canvas results in non-responsive UI](http://tracker.ardour.org/view.php?id=6556)
- [Audition audio without interrupting session playback](http://tracker.ardour.org/view.php?id=5337)

# MIDI

- [Missing first note when midi region looped #5438](http://tracker.ardour.org/view.php?id=5438)
- [MIDI note off issues #6340](http://tracker.ardour.org/view.php?id=6340)
- [exported audio file(from MIDI Track) contains stuck notes](http://tracker.ardour.org/view.php?id=6492)
- [MIDI Loop triggers the first note of the bar AFTER the loop end](http://tracker.ardour.org/view.php?id=6389)

# Editing

- [Black region outline ugly with many small regions](http://tracker.ardour.org/view.php?id=6615)
- [Region names are hard to read](http://tracker.ardour.org/view.php?id=5824)
- [Duplicate Range that spans multiple tracks can add extra regions in empty track](http://tracker.ardour.org/view.php?id=6579)
- [Duplicate range selection will not work when selection begins in an empty area](http://tracker.ardour.org/view.php?id=4984)
- [Duplicate range doesn't refers to multiple or trimmed regions](http://tracker.ardour.org/view.php?id=4986)
- [Undo goes way back and works unpredictably. Ardour 4.2](http://tracker.ardour.org/view.php?id=6518)

# Preferences
