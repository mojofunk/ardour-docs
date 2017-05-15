# Development Summary (5.8..5.9)

Version 5.9 has been tagged so this is an updated summary of the changes since 5.8.

Some significant optimizations were made to redraw performance on OS X/macOS that may be apparent if you are using Ardour on that platform.
 
There were further improvements to tempo and MIDI related features and lots of small improvements to state serialization.

Support for the Faderport8 control surface was added, see the manual for some quite thorough documentation: http://manual.ardour.org/using-control-surfaces/PreSonus_FaderPort8/

There were also many smaller but by no means less significant fixes and improvements.

# General

- Prevent adding Master Bus to a Track/bus group and make group button insensitive.
- Re/Add send options in the Processor box context menu and an option to allow feedback loop via Aux sends.
- Improvements to behaviour of Track/Bus/VCA Color Selection dialog.
- Consistent Color Selection dialogs with customizable color palette. 
- Update Track/Bus/VCA colors while choosing color in Color Selection dialog.
- Use Shift key to enable group when moving Fader with group disabled.
- Update Selection Clock when selected Region properties change.
- Hide SoundCloud upload in Export Dialog until fixed.
- Use OpenGL backed rendering/drawing for several Widgets on OS X/macOS including main Track Canvas to improve performance.
- Add ability to drop Group from VCA via right click on Group tab.
- Add preference to disable blinking of alert buttons.
- Various improvements to Audio Setup dialog.
- Add preference to only enable Click when recording is enabled.
- Updates to Blueberry Milk colors/theme.
- Merge most of the string-convert branch (see ardour-dev list for overview).
- Remove no longer necessary LocaleMode preference.
- Make -b/--bindings command line option output key bindings to HTML and launch in browser.
- Add -A/--actions command line option to output action names in HTML and open in browser.
- Deselect WASAPI support by default in Windows installer.
- Make Track/Bus XML node order in Session file independent of display order [#7327]
- Add action to select the topmost track and use in Faderport8 surface.
- Make Group color property accessible to surfaces and scripts.
- Improve Tap Tempo and allow tapping with keyboard (Space or Enter).
- Add configurable limit to clock display range.
- Restore visibility of Monitor Section and whether attached/detached.

# Tempo

- Allow tempo discontinuities at the beginning of ramped tempo section.
- Changes to Tempo marker operations and modifiers.
- Add 'Ramp to Next' to Tempo Marker menu, when next tempo is different.
- Add 'Continue' to Tempo Marker menu to continue end tempo value of previous Tempo Marker.
- Display red Tempo Mark pointer if tempo jumps more than 1 NTPM.
- Display note type in marker text if note type is non-quarter.
- Add entry for end bpm when creating a ramped Tempo in the Tempo Dialog.

# Editor

- Add Reset Gain to context menu for selected regions.
- Use a single undo action for notes added when dragging in percussive note mode. [#7134]
- Limit notes added while dragging in percussive note mode to first note added.
- New notes added in percussive note mode are selected.
- Allow Separate using Loop/Punch range with edit point set to mouse. [#7276]
- Allow Edit -> Crop with edit point set to mouse. [#7278]
- Improve behaviour of playhead and reduce jitter, particularly with large period sizes.

# MIDI

- Use a Patch Change dialog to send immediate patch changes via the MIDI Track Controls context/right-click menu.
- Updates to Korg Nano Kontrol2 MIDI map by Philippe Demartin
- Add MIDI map for Korg Studio and Arturia KeyLab 49.
- Add MIDI map for Alesis QX25 from Nathan Stewart [#7345]
- Support note name editing in the MIDI List Editor.

# Plugin

- Add support for VST effSetBypass. [#7266]
- Cut reverb tail in a-reverb when deactivating plugin.
- Improve a-delay to follow tempo-ramps and BPM changes.
- Increase VST scan timeout and set default of Verbose Plugin Scan to false.
- Changes to plugin categories to improve consistency across plugin API's/standards.

# Scripting

- Add action script to bypass all plugins
- Add action script to mute all Tracks
- Add script to installers/bundles to save a Session snapshot on export.
- Add '==' instance equality operator and update scripts to use it.
- Add bindings for transient analysis and add a script to print transients of selected regions.
- Add Lua bindings to access MIDI Region note events and example script.
- Optimize garbage collection (affecting performance of serialization).
- Improve bindings for RouteGroupList and Plugin classes.
- Add bindings for FileSource
- Add example script to convert MIDI-CC to Plugin Automation.
- Add LuaDialog and derived Widgets as well as an example script.
- Add bindings for setting group color.

# Control Surfaces

- Use "Mix" and "Proj" buttons on the Faderport to present the Mixer and Editor rather than a toggle.
- Various improvements to the OSC surface.
- Add support for Faderport8 control surface.
- Update preferences when control surfaces change with session.
- Retain the state of disabled control surfaces.
- Add scrub and multi-mode jog commands to OSC surface
- Add automation mode feedback to OSC surface.
- Support gain automation feedback in OSC surface [#7160]
- Assign some default actions for the function select (F-keys) in the Mackie MCP user profile.

# Translation

- Updated Japanese translation by Hiroki Inagaki.
- Updated German translation by Edgar Aichinger.

# Fixes

- Allow changing track colours with older 4.X Sessions.
- Fix for touch mute automation.
- Allow loading of SMF meta data with size greater than 127 bytes.
- Fix implicit selection when operating Track header control buttons.
- Fix audition with monitor section.
- Don't display channel selector for instrument plugins with zero audio outputs.
- Don't automatically open generic UIs for plugins without controls.
- Fix crash when adding a plugin immediately after re-order (via script).
- Fix issue with mouse button event ordering in EngineDialog.
- Prevent an empty system config and ship the system_config in bundles again.
- Fix crash when inserting time with split intersected regions.
- Offset linked regions to compensate for negative start after trim drag [#7105]
- Restore screen position when undoing creation of a MIDI note.
- Prevent the General MIDI Control Protocol surface from overriding Session version.
- Ensure no horizontal movement occurs when dragging regions with the x-constrain modifier enabled [#7260]
- Fix AFL/PFL from MIDI tracks without audio
- Work around a crash at exit with some Linux VST UIs
- Prevent creation of MIDI regions with length less that a pixel [#7271]
- Fixes to VST Window re/sizing.
- Prevent crash when removing time from track with automation. [#7287]
- Fix issue when undoing of Fade range operation [#7283]
- Use Tempo Curve color for measure line beats [#4930]
- Correctly restore clock modes in Location Window and other AudioClocks.
- Restore Solo/Mute when loading old 4.X Sessions.
- Avoid possible crash with multi-bus AudioUnit plugins.
- Prevent issue with automation playback setting Session as modified.
- Fix issue with Pan stuck at center in OSC surface.
- Fix toggling Monitor Mute/Dim/Mono actions with OSC.
- Prevent MIDI tracks from drawing into the Ruler area.
- Make Peak display in MixerStrip insensitive to mouse clicks/drags.
- Update Patch Change Naming when plugins change.
- Fix count-in for non 4/4 time signatures.
- Hide eye-dropper color picker on OS X/macOS builds due to it not working.
- Correctly load Track templates with inserts [#5778]
- Fix crash when dragging playhead or mouse in ruler area [#7304]
- Fix `set-*-from-edit-range` actions, when accessed from control surfaces
- Fixes to reset keybindings.
- Prevent crash during extreme timestretch. [#7305]
- Fixes for performance issues with region selection. [#7274]
- Retain order of concurrent MIDI events.
- Prevent truncation of concurrent events with ALSA raw MIDI buffers.
- Restore Track/Bus polarity invert state from older Sessions.
- Use correct action path names in several midi-maps.
- Prevent crash when loading MIDI port info where ports no longer exist.
- Fix crash when clicking on the canvas while unloading a Session.
- Avoid a possible deadlock in the control surface manager.
- Prevent possible freeze when clicking on canvas without a AudioBackend running.
- Fixes to performance issues when restoring Region selection state. [#7274]
- Fix nested VCA assigns and mixer-layout.
- Fixes to copy/paste of MIDI automation from/to Parameter automation.
- Corrections to latency measurement and Audio Setup dialog behaviour.
- In smart-mode, don't switch to range-mode after "set range selection" and similar operations. [#7332]
- Fix vari-speed and non-locked slave modes.
- Use correct descriptions and typos in --help output.
- Prevent MIDI learn handling events intended for other operations like temporary un/solo/mute.
- Make exclusive solo work again via ctrl+alt+click on solo button.
- Correctly restore track monitoring state from older Sessions. [#7336]
- Correctly scale ruler for HiDPI. [#7226]
- Scale text correctly in group tabs for HiDPI. [#7331]
- Allow Session end marker to move correctly when a Session is created from a template. [#7348]
- Prevent crash when replacing some LV2 plugins on a MIDI Track. [#7341]
- Update the profile name in the Mackie control panel to reflect the profile being edited when assigning actions.
- Make Save As and switch work correctly with a read-only Session. [#7352]
- Remove duplicate "Tape" menu item in Record Mode drop down in the Add Track/Bus/VCA dialog.
- Prevent creation of out-of-bounds image sizes during waveform rendering with high samplerates and high zoom levels.  

#  Contributors

$ git log 5.8..5.9 --format="%aN" | sort | uniq

André Nusser
Ben Loftis
cooltehno
Edgar Aichinger
Hiroki Inagaki
John Emmas
Len Ovens
licorne-sama
nick_m
Nil Geisweiller
Paul Davis
Robert Schneider
Robin Gareus
Tim Mayberry
