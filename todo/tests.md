Test timestretch using different files, lengths etc.
<ulink url="http://tracker.ardour.org/view.php?id=5923">Crash or
distortion on timestretch</ulink>

Session test that programmaticaly creates a session and writes it to a
directory that contains the arch/platform it was built on and the build
identifier

A test utility that loads a session in a random locale and re-saves it to check
for string conversion/formatting not done in ascii/latin1

Automatic stress/stability testing of Audioengine/Session paths at various
buffer sizes, samplerates etc. This will require some sort of simultaneous
loading of system subsystems etc. perhaps via phoronix test integration

Add debug output debug bit for tests and use DEBUG_TRACE for test output, the
test output should be clean by default but good to be able to define an
environment variable for extra output

Add automated test execution for all supported compilers/platforms/build
combinations using buildbot/ardour-build

Tests need to be run for debug and release builds

Add test for MidiPatchManager and use perf to look at xml parsing

Add test for plugin/lv2/vst scanning.

Test for Audio device sync/xrun at different settings with simulated load

Test for disk/storage read and write speed, there is an existing test for this
but not integrated into the testsuite. I'm not sure what would be considered
failure though. This needs to test multiple configurations, write only, read
only, read and write using various counts, locations?

Test for ability to write large files(> 4Gb), This could be achieved using
dummy backend to generate data. The DummyBackend can run faster than realtime
in order to speed this up.

Try to add utf-8 and utf-16/UCS strings to libardour test utils

AudioEngine/backend tests

Write test case for PBD::short_path, not portable ATM

Write test to save session, then change various aspects of the session and undo
and check that the session file is the same etc.

Write a test for export, comparing against reference file

Test a complex session with session with many plugins and periodically(but
somewhat randomly) saving session to see if there are any issues.

Test for large track count, loading/saving/closing success/times etc

Test for Session renaming

Test that randomly places all the plugins located on the system on a number of
tracks and runs through a variety of data values including NaN/Denormals
probably using dummy backend to generate test audio and midi data.

Test for memory allocations from RT threads.

Test for compatibility with C99, C11, C++11 and C++14

Test that timestamp set in BWF file is properly recognized by other software.
