# Build System

Support(Implement and Document) Native MSVC 2013/2015 build on windows?

Continous Integration using Buildbot with virt images for Fedora,
Ubuntu/Debian, Windows 7 and 8.1. Debug and Release Builds, run tests,
coverage, Packages, RPM's, Debs.

is VERSION used for anything at the top of gtk2_ardour/wscript build section?

Add script/s to ardour-build-scripts to test all build configurations

re-indent python scripts to 4 spaces? PEP-8 checker/formatter script?
            
target to build doxygen docs
            
There are two Doxygen files ardour.dox and docs/Doxyfile. remove one and add
target to build system to build the other.
            
Move man files to doc/man directory

Ask John to move all MSVC build files to libdir/msvc/vs8/ and top level MSVC
directories to tools/MSVC/

Build midi++/pbd/ardour as one dll?

--use-external-libs option needs reviewing or removing in wscript files

portaudio build options for getting debug output from the library etc

Test that installing Fedora debug rpm for mingw packages works. I think this
might have been broken at some point.

# Dependencies

update Fedora mingw-cppunit package to at least be a version epoch whatever
greater than fedora mingw package

Update Fedora mingw packages to define native_pkg_name

Aubio as of version 0.4.1 has issues building with mingw with jack enabled.

Aubio version 0.4.1 needs wine to be able to run unit tests and build fails if
not installed and able to execute tests. write patch to add option to
optionally disable unit tests or just email author or check if fixed now.

Investigate building Aubio with fftw support rather than inbuilt oura

Investigate aligned malloc warning with rubberband when building with MSYS2/mingw.

Package gtk2-engines for MSYS2 for clearlooks or use ardour version

# Documentation

Section on recommended Audio Interfaces, update
[FAQ](https://community.ardour.org/realfaq) and add to manual

Add section on MIDI on Windows to manual

Add section on Audio on Windows to manual

Add section on Windows default keybindings to manual

# GUI

Port to Gtk+3?

Disable remove loop and punch range in locations dialog

rename ArdourWindow to SessionWindow or something as these windows depend on session

Shift click on automation point should reset it to 0dB, check this

Move dialog functions into classes or just move functions into new file first.

Refactor code in `editor_timefx.cc` and put it into libardour and write tests for
it.

Refactor code in `ARDOUR_UI::check_memory_locking` into libpbd and add unit test.
Add to `PBD::get_resource_limit`

Make a Test Case for [Bug 5575](http://tracker.ardour.org/view.php?id=5575")

Move ArdourUI::TransportControllable to new header

Split Gtkmm2ext::UI into UI::RequestHandler and LogWindow

Move `Gtkmm2ext::UI::get_color` out of gtk_ui and into separate header and use
in EditorRouteGroup and ThemeManager

Move Gtkmm2ext::UI::Tooltips into UI::Application or remove

Move logic in verify `route_new_route_name()` into libardour, `is_valid_route_name()` etc

`ARDOUR_UI::` has tooltips member, as does `Gtkmm2ext::UI`

Make `UI::TransportController` class and move related code from `ARDOUR_UI`
namespace

Rename `Mixer_UI` to `UI::Mixer` or `UI::MixWindow`

Create UI::EditorWindow class or UI::EditWindow

Add `UI::get_copyright_string` from main.cc

Add `UI::get_full_version_string` and `UI::get_version_string` from main.cc

Remove calls to Glib::thread_init, not needed if glib version 2.32 is required

Move ARDOUR_UI::gui_idle_handler to UI::idle_handler

Remove Gtkmm2ext::flush_pending or rename ARDOUR_UI::gui_idle_handler and use
only one of them

Remove use of goto in ARDOUR_UI::load_session

Move non-session-manager code from ARDOUR_UI::Starting into nsm.h/cc or somewhere

Solo, Audition and feedback buttons in editor shouldn't have prelight state, or
whatever it is called that makes it seem like they are buttons.

Preference Window seems to get stuck behind Editor window sometimes

Remove gtk2_ardour/glade directory and contents

Move ARDOUR_UI::config out of ARDOUR_UI class into separate header

Move ARDOUR_UI::set_tip into separate header

When playhead passes Region name it can dissappear, seems like incorrect
bounding box, check this and submit bug report if still relevant.

Update to new version of freesound API

create libfreesound or similar lib and independant UI or define interface for
content providers etc.

Have option for freesound files to be automatically downloaded so preview is
not so tedious

Add freesound to export options

Add get_current_time_string to libardour and use in ARDOUR_UI::update_wall_clock

Fix code duplication in Recent session handling

Change Profile to use features rather than products.  Profile::get
(USE_FEATURE) rather than get_mixbus() etc. should Profile be merged with
Configuration?

Check instances where Gtk::Adjustment is created with ::new and then
Gtk::manage is used. Check if any of these instances are added to top level
containers as Gtk::Adjustment isn't a Gtk::Widget and won't be properly
destroyed in those instances AFAIR

Refactor so VideoTimeline singleton isn't a member of ARDOUR_UI class

Refactor so VideoTimeline singleton isn't a member of ARDOUR_UI

Access Mixer singleton through ARDOUR_UI or UI::Mixer::instance() in another
header class

Move UI::Configuration::get_only_copy_imported_files into libardour RCConfig?

Clocks should get there mode from UIConfiguration

Rename ARDOUR_UI_UTILS namespace to just UI, when Gtkmm2ext::UI class is
renamed

Region boost gain should indicate how much gain is being boosted or show a
dialog/allow preview etc.

# General

Write guide to using bug tracker. How to report bug, Using bug fields(severity,
status etc)

Get OSX system to build and test on.

prefix all tests with library name. So the namespaces don't clash? can't
remember exactly why I wrote this item.

# Windows

Build Waves backend? Is it relevant anymore

giomm interface keyword submit bug with patches upstream, check if this is
still relevant

Search/Discover lv2 in $PACKAGE_DIR/lib/lv2 in addition to
$PACKAGE_DIR/lib/ardour4/LV2

Package LV2 unreasonable synth

Package LV2 Helm synth?

Package meters.lv2

Package LV2 mda

Get John to justify/remove msvc folder

Investigate defining `__USE_MINGW_ANSI_STDIO`  or `_POSIX` for mingw build

Investigate native font backend(not fontconfig) via Gtk+

doc section on developing for windows and testing/debugging

Consolidate Semaphore classes

Use nsis installer script from x-win, needs to be split

Remove windows_packaging directory now that the scripts are no longer used or
maintained

Fix/Investigate two export folders in windows package in share/ardour3

# libardour

Test timestretch using different files, lengths etc.
<ulink url="http://tracker.ardour.org/view.php?id=5923">Crash or
distortion on timestretch</ulink>

Session test that programmaticaly creates a session and writes
it to a directory that contains the arch/platform it was built
on and the build identifier

Automatic stress/stability testing of Audioengine/Session paths
at various buffer sizes, samplerates etc. This will require some
sort of simultaneous loading of system subsystems etc. perhaps
via phoronix test integration

move session directory names in libs/ardour/directory_names into
SessionDirectory class?

rename ARDOUR::ProcessThread to ARDOUR::ProcessContext

correct all header include ifdefs to be C and C++ standards
compliant

Rename ARDOUR::init_post_engine and write docs about why it
needs to be called after audio engine is valid etc.

rename libardour/globals.cc, most of the functions in it are
declared in ardour/ardour.h

MidiPatchManager::set_session is called when loading session
which seems to take a while, is it possible to call this after
Session is loaded during idle.

Move ARDOUR::touch_file into PBD::? only used by sfdb which we
don't use

Use Serd? instead of lrdf in AudioLibrary?

Should debug bits be visible outside a library or while NDEBUG is
defined

Look into using native types instead of XMLNode for
properties/state/etc, reimplement statesystem branch from old
repo

Look into using native types instead of XMLNode for
properties/state/etc, reimplement statesystem branch from old
repo

Remove now unneccessary AudioSource::find_broken_peakfile

Decouple AudioBackend from AudioEngine and Session. Is it
possible to have no dependency on libardour at all? Perhaps with
AudioBackendListener interface passed to AudioBackend instead of
AudioEngine. Not sure how to have access to Session, perhaps
accessed through another interface or via `set_data (string name,
void* data)`

Fix crash in libardour test_playlist_equivalent_regions

Call AudioFileSource::set_build_peakfiles and
AudioFileSource::set_build_missing_peakfiles to true in
ARDOUR::init

Change Session constructor situation. One constructor for new
sessions that take folder and name, etc and a second constructor
that takes a path to the session file for existing sessions.

Move clock_gettime and get_microseconds from ardour/globals.cc
to libpbd and test

Move FPU and denormal stuff to separate C lib?

Use PBD::get/set_resource_limit in ARDOUR::lotsa_files_please
and rename it

Move RuntimeProfile into GUI as it is not used in libardour.

Investigate either replacing RuntimeProfile with interface
options or turning RuntimeProfile into an interface with
implementations for Ardour, TRX etc.

Fixup ExportProfileManager::find_file and usage

Add utility functions get_standard_sample_rates and
get_standard_buffer_sizes and use in at least the AudioBackends

What is the impact of storing all paths to session folders in
the session file rather than relying on a fixed directory
structure relative to the session file.

Use Searchpath in Session::cleanup_sources to construct
Searchpaths

Fix portability in Session::cleanup_sources, this may be fixed...

Move ARDOUR::find_named_node into libpbd

Rename identifiers in ardour/filename_extensions.h from `*_suffix`
to `*_extension`

# libpbd

Replace use of PBD::split and PBD::replace_all with boost equivalents and
remove.

move clock/timing code from PBD::file_manager to PBD::get_microseconds and test

Abstract registering per thread pool so that a size doesn't need to be
specified. Ultimately it shouldn't be necessary to register threads outside of
libardour IMO but a GUI shouldn't need to worry about that detail.

move SndfileManager out of PBD into libardour

Write docs for PBD::EPA class and why it is necessary

put pbd/thread_utils in PBD namespace

PBD::ControllableDescriptor should be in ARDOUR::

PBD::Controllable should be in ARDOUR:: ?

rename hardware_concurrency in pbd/cpus.h and put it in PBD namespace

Can PBD::Destructable and PBD::?? be merged into PBD::Object

Can EnumWriter be replaced with TypeFactory from libmojo, what is the advantage
of doing so?

Rename PBD::EnvironmentalProtectionAgency

correct docs for PBD::path_is_within

Put pbd/command.h and pbd/memento.h inside PBD namespace

Put pbd/mountpoint inside PBD and is it even necessary anymore?

make pbd/path_expand.h/cc portable and test

Use glib regex in PBD::path_expand instead of regex.h

Use glib regex in PBD::find_files_matching_regex instead of regex.h

call canonical_path in PBD::path_expand instead of realpath

Docs for PBD::init/cleanup

Move pbd/pool.h into PBD namespace

Rename CrossThreadPool MultiThreadPool?

Tests and Docs for every function/method/class, Ha good luck?

Test memory consumption of XMLNode

Look into a custom allocator for XMLNode to cache nodes etc?, I'm not sure it
would matter if libxml is doing the string allocations, needs looking into etc

Look into a custom allocator for XMLNode to cache nodes etc?, I'm not sure it
would matter if libxml is doing the string allocations, needs looking into etc

Investigate whether it is desirable to replace AbstractUI with something
non-templated. How hard is it to remove all per thread event buffers/thread
registration. Are there any hueristics that can be applied to simplify things

Move PBD::canonical_path etc from pathexpand into file_utils.h/cc

Remove call to Gio::Init in PBD::init?

Use path_expand in SearchPath constructors/add_directory or perhaps just add
expand () method

Move pbd/pathexpand.h to pbd/file_utils.h

Move pbd/cleardir.h to pbd/file_utils.h

Use g_open in PBD::copy_file

Move pbd/error.h/cc to pbd.h/cc?

Should we set `_fmode = O_BINARY` or use newer `_set_fmode` in PBD::init for MSVC
and MINGW

Remove inclusion of io.h in pbd/file_utils.cc if not needed

Move PBD::short_path into pbd/file_utils.h

Move PBD::basename_nosuffix into pbd/file_utils.h

Rename PBD::basename_nosuffix to filename_no_extension

# Tests

Add debug output debug bit for tests and use DEBUG_TRACE for test output, the
test output should be clean by default but good to be able to define an
environment variable for extra output

Add automated test execution for all supported compilers/platforms/build
combinations using buildbot/ardour-build

Tests need to be run for debug and release builds

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
tracks and runs through a series of data, probably using dummy backend to
generate test audio and midi data.

Test for memory allocations from RT threads.

Test for compatability with C99, C11, C++11 and C++14
