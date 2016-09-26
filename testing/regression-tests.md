# Smoke Tests

A list of tests to be performed periodically as functional smoke tests. Some of
these will come from the bug tracker and will be referenced but enough
information should also be contained in this document in order to perform the
tests.

# Sessions

- [Use an existing Session as template](http://tracker.ardour.org/view.php?id=5299)
- [Crash when creating new session while there is currently opened other session](http://tracker.ardour.org/view.php?id=6766)
- [Renaming the session root folder results in all media items missing](http://tracker.ardour.org/view.php?id=6557)
- [The "id" property of some Controllable xml nodes is changed at first Session save](http://tracker.ardour.org/view.php?id=7025)
- [Crash when exiting after opening second session](http://tracker.ardour.org/view.php?id=7033)
- [Opening Session and moving start or end range/location markers and closing Session does not ask to save session](http://tracker.ardour.org/view.php?id=6774)

# Transport/Recording

- [Reduced volume during fast playback/rewind](http://tracker.ardour.org/view.php?id=6583)
- [Changing region layers doesn't playback raised region](http://tracker.ardour.org/view.php?id=6570)
- [Error in latency compensation](http://tracker.ardour.org/view.php?id=5781)
- [When recording in a loop, some audio is not captured](http://tracker.ardour.org/view.php?id=5781)

# Mixer

- [Crash when clicking the Mono button in the Monitor section in the Mixer](http://tracker.ardour.org/view.php?id=6758)
- [PFL sometimes produces SIP/AFL audio](http://tracker.ardour.org/view.php?id=5803)

# Editor

- [Splitted audio regions jump to the beginning of timeline and build layers on session tempo change](http://tracker.ardour.org/view.php?id=5781)
- [Black region outline ugly with many small regions](http://tracker.ardour.org/view.php?id=6615)
- [Duplicate Range that spans multiple tracks can add extra regions in empty track](http://tracker.ardour.org/view.php?id=6579)
- [Duplicate range selection will not work when selection begins in an empty area](http://tracker.ardour.org/view.php?id=4984)
- [Duplicate range doesn't refers to multiple or trimmed regions](http://tracker.ardour.org/view.php?id=4986)
- [keyboard split region while dragging crashes](http://tracker.ardour.org/view.php?id=6338)

# MIDI

- [Missing first note when midi region looped #5438](http://tracker.ardour.org/view.php?id=5438)
- [MIDI Quantize doesn't work](http://tracker.ardour.org/view.php?id=5545)

# Control Surfaces

- [All midi bindings lost when one track removed](http://tracker.ardour.org/view.php?id=5633)
- [Crash on selecting 'Behringer X-Touch Compact' mackie control surface type](http://tracker.ardour.org/view.php?id=6764)

# Undo/Redo

- [Crash when split while dragging region](http://tracker.ardour.org/view.php?id=6338)
- [Undo should be disabled during recording](http://tracker.ardour.org/view.php?id=6540)

# Importing

- [Ardour draws the same waveform for different files](http://tracker.ardour.org/view.php?id=5745)

# Exporting

- Test closing App after export with different backends/options

# Preferences

- [Can't remove custom click sound #6160](http://tracker.ardour.org/view.php?id=6160)

# Plugins

