# Development Summary (5.4..5ab33bdb) and 5.5 Release Planning

It has now been about 6 weeks since 5.4 was released, which if we are
continuing the pattern of releasing every 2 months or so means we are due for
another release in early December.

So IMO now would be the time to finish/polish new features and focus on
testing, finding and fixing as many bugs as possible before then so that we can
have a solid release. (That I can use over the holiday period, Thank you)

It also is a good time translators to submit translation updates, the best way
being via a github pull request, unless you have commit access.

I spent some time today testing the latest nightly build/s on three different
machines and went through all the commits since 5.4 to come up with a sort of
development summary. The intention behind writing it now rather than as part of
the release process is to have a list of features and fixes for those that are
interested to test between now and release. It should also make writing the
release notes much easier.

I may have missed a few things, so if you think there are any relevant features
or fixes that I've missed that need mentioning or testing then please respond.

Almost none of the new features that I've listed below have documentation in
the [manual](https://github.com/Ardour/manual) AFAIK, so if you are interested
in contributing documentation that would be appreciated.

# Fixes

- Work around MIDI devices sending invalid timestamps on OSX.
- Open Sessions with files referenced from removable drives on Windows.
- Various fixes for NetBSD and FreeBSD.
- Add MIDI Control Change at correct location when importing.
- Update Region colors on theme change.
- Fix/Support note translations.
- Allow loading sessions with missing external files. [#7067, #7114]
- Use distinct color identifier for meter clip indicator. [#7010]
- Prevent panners being reset when switching to Aux sends and back. [#6893]
- Use correct BBT offset when using Insert Time. [#7072]
- Fix restoration of key bindings assigned to Windows+key. [#7037]
- Prevent duplicate moves when selecting regions on shared playlists.
- Fix crash when instrument instantiation fails on track creation.
- Prevent infinite loop when calculating tick marks on low zoom levels.
- Fix LTC-generator 24h wraparound
- Correctly handle failed activation of Control Surface Modules
- Fix Master Track moving down one position in Editor after Session reload. [#7080]
- Mark Session state as changed when tracks are reordered. [#7093]
- Improved fix for playback of linked MIDI Regions [#6541]
- Fix to keep Meterbridge Window on top.
- Fix for non-working buttons in Monitor Section after second Session load [#7098]
- Fix LV2 state versioning with Session templates.
- Include Aux Busses in default strip types in OSC Surface [#7090]
- Fixes to Insert/Remove time dialog [#7072]
- Fix intermittent hang when stopping PortaudioBackend [#7095]
- Fix playlist XML nodes changing order on Session save [#7053]

# General Changes and Improvements

- Many MIDI and Tempo related refactorings, fixes and improvements to
  performance, source code documentation and tests. (Thanks Nick)
- Include Session utilities in the application installers/bundles.
- Allow feedback loops from internal Sends to enable custom "Echo" chains.
- Improved performance when reading and writing XML files.
- Improved performance of Region export.
- Snap to Track Strip boundaries when scrolling with arrow keys in the Editor.
- Clicking on a Strip in the Mixer Strip List will move the Strip into view.
- Snap to Mixer Strip boundaries when scrolling with arrow keys in the Mixer
- Minor updates to Cubasish Theme.
- Compensate for latency/correct alignment when exporting the Master Bus.
- Improve automatic Track naming [#7092]
- Add option to zoom in the time rulers using button press and dragging
  vertically. [#6768]

# MIDI

- Support MIDI input follows Track selection. [#6744]
- New MIDI -> Ports page in Preferences for managing MIDI port functionality
  and enabling MIDI input follows Track Selection.
- Added support for Type 0 MIDI files and add option to split channels into
  tracks on import.
- Added MIDI mapping for AKAI Midimix.
- New MIDI Note selection XML format, existing note selections will be lost.

# Plugins

- Experimental? VST-2.X support on OSX
- Add functionality to Fan out an Instruments outputs to new Tracks/Busses
  [Link](https://vimeo.com/191024580)
- Allow LV2 plugins to provide Midnam XML.
- Increase maximum release time in a-comp.
- Sort Instrument list alphabetically.
- Updated internal versions of qm-dsp library and qm-vamp plugins.
- Allow LV2 Plugins to signal state changes and mark Session state as changed.
- Support LV2 PortGroup extension
- Add support for output-channel/bus grouping in AU plugins

# Scripting

- Added or improved Lua bindings for VAMP plugins, TempoMap, Basic MIDI model
  editing, Inter-Processor communication, Source, AudioSource, Route, Panner,
  Instrument
- Add example script for Audio to Midi Transcription.
- "Sound Smasher" example script added.
- Add prototype script for converting polyphonic audio region to a MIDI region.
- Add example script for instrument fan-out

# Control Surfaces

- Added Support for Steinbergs CC121 Control Surface
- Activate/Deactivate plugins via OSC
- Added configuration files for the Avid Artist Control and Artist Mix Control
  surfaces.
- Allow Aux Buses visibility to be controlled separately via OSC

# Known Issues

Yes some (See bug tracker) but no major issues or regressions that I know of
that would block a release.

# Contributors

There are many people who contribute to Ardour development behind the scenes
with thier time and or financial support that may have never commited a change
to the source code repository...but the following people have committed one or
more changes to the master branch since 5.4.

$ git log 5.4..5ab33bdb --format="%aN" | sort | uniq

Ben Loftis
cooltehno
David Robillard
eighthkeepa
John Emmas
Kamil Rytarowski
Len Ovens
Michael Beer
Michiel de Roo
Nathan Stewart
nick_m
Nil Geisweiller
Nils Philippsen
Olivier Humbert
Paul Davis
Robert Scott
Robin Gareus
Tim Mayberry
W.P. van Paassen

# Development Summary 5ab33bdb..0d3c2a9d

There has been a fair bit of development activity over the last two weeks with
some nice bug fixes and improvements. What follows is a summary of additional
commits and issues that have been addressed.

One thing to note is that if you are using JACK1 then it seems the latest
JACK1 release (0.125.0) will be required for the next Ardour release.

# Fixes

- Fix crash loading u-he Diva VST plugin on Windows
- Fix Duplicating Tracks with Sidechains [#7117]
- Fix incorrect Midi Region length when splitting
- Fix for widget visibility with detached preferences window [#7002]
- Fixes when creating MIDI notes in Sustained note mode [#7126]
- Fixes when creating MIDI notes in Percussive note mode [#7130]
- Fixes to Cut Mode to make the cut line visible and respect snap modifier
- Fix inaudible Percussive notes being displayed at the end of the Region
- Fix crash when editing pitch of notes to outside visible area [#7135]
- Fix crash when deleting a MIDI Region while mouse over CC event
- Fix concurrency/locking issue with Event Loop request invalidation [#7049]
- Fix creation of playlists with duplicate names [#6523, #5681, #6497]
- Fix output display for non-plugin processors in the Processor Box
- Fix forwarding of output buffers by using correct channel count
- Fix loading, recording & saving MIDI with PolyKeyPressure events [#6948]
- Fixes to Duplicate Track [#7141, #7146]
- Fixes to OSC Control Surface
- Fix handling of pitch bend events by a-fluidsynth [#7140]

# General

- Speed up changes to AFL/PFL on large Sessions
- Large improvements in time to process Solo changes [#7119]
- Speed up Track/Bus creation time
- Restrict ALSA input/output device selection to valid combinations
- Speed up Track deletion when Editor Mixer Strip is visible

# MIDI

- Many minor fixes and improvements
- Improved editing in Percussive note mode

# Control Surfaces

- Add OSC support to query strips internal sends [#7136]
- Add OSC support to query plugins and their parameters [#7137]

# Scripting

- Add example script to modulate parameters globally
- Add support for calling ARDOUR.DSP Lua functions from UI scripts
- Add example script to process Regions selected in the Editor
- Add MIDI LFO example script

# Translations

- Updated German translation
- Updated French translation

# Known Issues

- Crash when starting JACK1 with versions prior to 0.125.0 [#7115]
