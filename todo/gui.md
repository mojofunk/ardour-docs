Port to Gtk+3?

make Midi Device Setup button in AudioSetup dialog insensitive when engine
running

Move `unload_session` from `ardour_ui_dialogs.cc` to `ardour_ui.cc`

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

Done - Move ARDOUR_UI::config out of ARDOUR_UI class into separate header

Done - Move ARDOUR_UI::set_tip into separate header

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

Add an ARDOUR_DECLARE_LEAK_DETECTOR macro and use instance_count log domain to
output instance counts

Move UI::Configuration::get_only_copy_imported_files into libardour RCConfig?

Clocks should get there mode from UIConfiguration

Write `UI::get_color` and `UI::get_color_with_mod` functions instead of
UIConfiguration::instance().color

Rename ARDOUR_UI_UTILS namespace to just UI, when Gtkmm2ext::UI class is
renamed

Region boost gain should indicate how much gain is being boosted or show a
dialog/allow preview etc.

# General

Show splash screen at application start and do a plugin scan at that point
rather than on session load

Write guide to using bug tracker. How to report bug, Using bug fields(severity,
status etc)

Setup build on OSX

prefix all tests with library name. So the namespaces don't clash? can't
remember exactly why I wrote this item.

# Windows

giomm interface keyword submit bug with patches upstream, check if this is
still relevant

Search/Discover lv2 in $PACKAGE_DIR/lib/lv2 in addition to
$PACKAGE_DIR/lib/ardour4/LV2

Package LV2 unreasonable synth

Package LV2 Helm synth?

Package meters.lv2

Package LV2 mda

Get John to justify/move/remove msvc folders

Investigate defining `__USE_MINGW_ANSI_STDIO`  or `_POSIX` for mingw build

Investigate native font backend(not fontconfig) via Gtk+

doc section on developing for windows and testing/debugging

Use nsis installer script from x-win, needs to be split

Remove windows_packaging directory now that the scripts are no longer used or
maintained

Fix/Investigate two export folders in windows package in share/ardour3

A way to indicate to binding system when some key combinations are hard coded,
or allow a way to change them?  There should be a warning if the bindings are
conflicting but there isn't because the bindings system doesn't know about the
hard coded bindings, like those in MidiRegionView
