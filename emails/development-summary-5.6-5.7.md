# Development Summary (5.6..5.7)

The 5.7 release has been tagged earlier than expected and it contains fixes for
a number of regressions in 5.6 as well as the steady addition of features.

There are some larger changes/branches ready for merging which may mean the
next development cycle could be a bit longer than usual...but who knows.

Hopefully for the next release there is an opportunity for improved structure
and communication to allow more time for wider testing and translation updates
before tagging/release.

# General

- Add Record with Count-in functionality accessible via Transport menu.
- Save and restore Location clock modes in Locations pane in Editor List and
  Locations Window separately.
- Improvements to sensitivity of actions in Region context menu. [#7077]
- Version keyboard shortcut configuration file (.keys).
- Add support for importing MIDI from Pro Tools Session files.
- Consistently use the term VCA rather than Control Master.
- When starting Ardour without any existing configuration files and not copying
  them from a previous version then still present the Startup/First time dialog.
- Control (Primary Modifier) and right click on group tab will present Group Edit Window.
- Shift (Tertiary Modifier) and right click on group tab will remove group.
- Support for QT5 lv2 UIs in bundles/installers from ardour.org
- Add support for relocating missing external files in Missing File dialog.
- Improvements to wording in Preferences and Session Properties.
- Change master meter type in toolbar via right click.
- Constrain VCA slave value to prevent overshoot and snap back on release.
- Use consistent Installer names for all platforms (Name + Version + Arch)

# MIDI

- Separate bank selection into MSB/LSB in Patch Change Dialog.

# Plugin

- Allow rescanning of VST plugins after changing VST path.

# Scripting

- Update bindings and scripts for API changes.
- Updates to Lua scripting documentation.
- Add bindings for plugin reordering and add example reverse plugin order
  script.
- Add bindings for solo/mute and realtime control changes and update example
  script.
- Bind scripts via right click on Lua Action Script Button in Toolbar.
- Unbind scripts via Shift + right click on Lua Action Script Button in
  Toolbar.
- Allow scripts to define a custom icon when bound to a Lua Action Script Button.
- Include Audio to MIDI script in Bundles/Installers.
- Add ability to Load/Remove Session scripts in the Script Manager.
- Edit button in Script Manager now opens Lua Script Window.
- Add bindings to create Aux sends and add script to send multiple tracks to an
  Aux bus.
- Add Action Script Button icons for various scripts.
- Add example script to show/hide Tracks in the Editor.

# Translation

- Updated Japanese translation by Hiroki Inagaki
- Updated Czech translation by Pavel Fric

# Fixes

- Use correct position when copying MIDI regions
- Fix issue when moving MIDI regions with non-default meter and snap set to
  Beats [#7234]
- Reset window size when switching between custom and generic plugin UI. 
- Fix timing of regions recorded before the musical origin.
- Fix loading of 4.X Sessions with missing initial tempo section.
- Fix vertically constrained Region drag.
- Properly update main window title when switching Snapshots.
- Fix issues with Toolbar height changing with varying appearance options.
- Fix issues with Track and Mixer Strip order.
- Don't show hidden Mixer Strips when spilling a VCA.
- Fix Undo/Redo for Snap position to grid via Region context menu. [#7246]
- Ensure toggle Editor & Mixer action always works with a detached Mixer
  Window.
- Fix incorrect position of percussive notes while dragging during move/copy.

# Contributors

$ git log 5.6..5.7 --format="%aN" | sort | uniq

Ben Loftis
Damien Zammit
Hiroki Inagaki
John Emmas
Len Ovens
nick_m
Paul Davis
Robin Gareus
