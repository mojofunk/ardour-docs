# Development Summary (5.5..5.6)

As a new release seems imminent I've written up another development summary.

I've tried to test as many of the changes as possible while going through the
commits and writing this up, but it has taken longer then expected as I've been
travelling/busy. I've also not been as thorough as I'd like and I may have
missed or mixed up a few details.

Overall it seems like it will be another great release.

# General Changes and Improvements

- Speed up unloading large Sessions
- Speed up recent Session display, with many large Sessions and or snapshots.
- Transport control area layout changes.
- Add a mini-timeline to toolbar.
- Follow Edits has been renamed Follow Range and has changed behaviour
- Allow customization of Toolbar via Preferences -> Appearance -> Toolbar
- Add ability to archive Session.
- Normalize audio when archiving to a fixed point format.
- Add more precise localization options to Preferences -> General -> Translation
- Enable all types of Range locations (loop, start, end) to be glued to BBT.
- Allow preference for tempo to be expressed in divisions per minute or quarter
  notes per minute (General -> Tempo). 
- Preference layout, grouping, wording/naming and tooltip changes.
- Add button to reset keyboard modifiers to recommended defaults in preferences
  (Editor -> Modifiers)
- Minor updates to Blueberry Milk, Caineville, Clear Gray and Cubasish Themes.
- Support added to compile on macOS 10.12 (Sierra)
- Modify playlist option labels in Duplicate Track/Bus dialog. [#7149]
- Support import of Tempo maps during MIDI import at selected position.
- Show context menu on right click on VCA track header.
- Support all drive letters on windows with harvid version >= 0.8.2
- Rename Bindings Window to Keyboard Shortcuts.
- Display name of conflicting keyboard shortcut.
- Allow automation line fill opacity themable.
- Add global monitoring controls to toolbar, enable visibility via Preferences
  -> Appearance -> Toolbar.
- Implement count-in before recording with fixed BPM, enable via Session
  -> Properties -> Misc.
- Implement record with pre-roll, accessible via Transport menu.
- Allow Editor toolbar and background to be themable.
- Allow changing Metronome level via Mouse Wheel on Metrenome button in
  Toolbar.
- Display application version Session was last modified/saved with tooltip in
  recent session list. 
- Scale Gain automation by masters current value if slaved.
- Add scripts to run Ardour under rr debugging tool.
- Disable VST scan in safe mode.
- Mark Session dirty when moving range/tempo markers.
- Add undo/redo for changing marker lock style.

# Editor

- Duplicate action now works in Range Selection mode.
- Multi-Duplicate now works for Range Selections.
- Zoom to Selection (Z key) now zooms on both axes.
- Add Zoom to Selection (Horizontal) action.
- Add preference (Editor -> General) to Zoom to Selection in Object mode.
- Left and Right arrow keys move playhead to next/previous grid point instead
  of region boundary (old behaviour can be accessed with modifiers)
- Speed up patch change redisplay.
- Don't locate when clicking on region fade handles in smart mode with follow
  edits enabled.
- Add actions to set current meter/tempo.
- Display Boost/Cut Gain after Audio Region name.

# Mixer

- Display VCA's at the end of Track/Bus list
- Show isolate solo and lock solo status buttons in Master mixer strip but keep
  de-sensitized to preserve mixer strip layout between track/bus types
- Fix update of group color in mixer strip header.
- Show VCA color on number label and top of Mixer Strip.
- Fixes to visual alignment of GUI elements in the Mixer.
- Use a popup menu to select meter point instead of cycling through modes.

# MIDI

- Increase MIDI related test coverage and refactoring.
- Add midnam support for a-Fluid Synth.
- Allow sending immediate patch changes via MIDI track context menu [#6830]
- Speed up MIDI ghost note redisplay.
- Save and Restore MIDI automation controls.
- Add option to use track numbers, track names or instrument names from SMF
  files when importing.
- Add track and instrument names to SMF files.
- Add option to use tempo map from SMF file on import.
- Access to MIDI track channel settings now only via context menu.
- Improved canvas redraw performance with many MIDI notes.
- Add MIDI channel number to controller names.
- Implement Copy drag for MIDI Notes.

# Plugins

- Add support for Mac VST hidden/favorites
- Show plugin format (LV2/LADSPA/VST/etc) in menus to differentiate between
  the same plugin with several formats installed (e.g AU/VST).
- Allow to directly fan-out when adding multichannel instruments.

# Scripting

- Add Bindings for Track/Bus Groups, MidiTrack::MidiControl, Timecode
  conversion, AudioRegion RMS/Peak
- Extend Bindings for PluginInsert, 
- Add Fader to Trims script
- Add script to add a-High/Low pass filter to all tracks
- Add Create Drum Tracks script
- Add example script to start recording on a MIDI event.
- Add script to delete X-Run markers.
- Allow Lua bindings up to 10 arguments
- Add example script/snippet for importing File/s

# Control Surfaces

- Remove unused feedback option from OSC surface controls.
- Add Talent individual monitor controls

# Translations

- Updated Italian translation. [#7180]
- Updated German translation by Edgar Aichinger.
- Updated French translation by Olivier Humbert.
- Added Japanese translation by Hiroki Inagaki.

# Fixes

- Fix update of Track/Bus color in Summary and Connection Manager.
- Fix loading of Blueberry Milk and Clear Grey themes. [#7155]
- Fix issues in Export with trim enabled. [#6412]
- Fix crash when creating track via region drag when exceeding JACK connection
  limit. [#6496]
- Fix crash at stop when recording in non-layered mode.
- Fix parsing export trim threshold config variable.
- Fix a crash at exit
- Fixes for MSVC compiler
- Fix video-monitor "sync-source" changes
- Fix a source of hangs when closing Session with ALSA backend.
- Fix possible crash when naming tracks with reserved I/O names. [#7171]
- Fix flickering in tempo curve when Markers are reordered.
- Fixes for sample locked Meter and Tempo sections? (ask nick_m about this
  wording)
- Fix crash when dragging sample locked tempo over a music locked Tempo while
  snapped to grid. 
- Fix potential crash in peak file building.
- Fix possible crash when removing ports with JACK1.
- Fix layered record undo to include changes to existing regions.
- Fixes to ensure Command key generates MOD2 on OS X.
- Fix region position when dragging multiple regions to respect time base/lock
  style.
- Fix thread safety issues with invalidation requests in event loop.
- Fix inaccessible controls in Pin Connections window. [#7177]
- Fix crash when resetting with VCA peak-meters. (ask Robin, could not
  reproduce in 5.5)
- Fix patch changes appearing outside of Region bounds.
- Fix toggling between Editor and Mixer using Korg nanoKontrol2.
- Fix Solo button on Faderport
- Fix management/ownership of shared playlists. [#7150]
- Fixes to inactive Tempo sections.
- Fix possibly incorrect start position of MIDI regions after split.
- Fix crash when changing Pane widgets. [#7198]
- Fix MTC slave implicit return on transport stop.
- Fix some memory leaks in libpbd, libardour and GUI code.
- Fix undo/redo for Regions -> Edit -> Close Gaps.
- Fix continuous multi-selection in the Mixer.

# Contributors

$ git log 5.5..5.6 --format="%aN" | sort | uniq

Alexandre Prokoudine
Ben Loftis
cooltehno
Daniel Sheeler
David Robillard
Dobroslav Slavenskoj
Edgar Aichinger
Ed Ward
Hanspeter Portner
Hiroki Inagaki
John Emmas
Julien ROGER
Len Ovens
nick_m
Nil Geisweiller
Olivier Humbert
Paul Davis
Paul Tirk
powerpaul17
Robin Gareus
Tim Mayberry
Tobi Stadelmaier
