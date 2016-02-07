Stateful::add_extra_xml takes a reference to an XMLNode that it takes ownership
of when it should at least take a pointer.

Stateful::add_instant_xml copies the node passed in, then copies the entire
node and writes it disk. This makes ARDOUR_UI::save_ardour_state pretty
inefficient with many copies and writes.

Replace use of PBD::split and PBD::replace_all with boost equivalents and
remove.

move clock/timing code from PBD::file_manager to PBD::get_microseconds and test

Make PBD::Timing into template to be able to use different clock sources

Rename `Timing::get_interval` to elapsed()

Add `elapsed_microseconds`, `elapsed_milliseconds` and `elapsed_seconds` to
PBD::Timing class

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

Look for opportunities to use `boost::string_ref` xml parsing is a good
candidate.

Investigate whether it is desirable to replace AbstractUI with something
non-templated. How hard is it to remove all per thread event buffers/thread
registration. Are there any hueristics that can be applied to simplify things

Move PBD::canonical_path etc from pathexpand into file_utils.h/cc

Remove call to Gio::Init in PBD::init?

Use path_expand in SearchPath constructors/add_directory or perhaps just add
expand () method

Move pbd/pathexpand.h to pbd/file_utils.h

Move pbd/cleardir.h to pbd/file_utils.h

Done - Use g_open in PBD::copy_file

Move pbd/error.h/cc to pbd.h/cc?

Done -Should we set `_fmode = O_BINARY` or use newer `_set_fmode` in PBD::init for MSVC
and MINGW

Remove inclusion of io.h in pbd/file_utils.cc if not needed

Move PBD::short_path into pbd/file_utils.h

Move PBD::basename_nosuffix into pbd/file_utils.h

Rename PBD::basename_nosuffix to filename_no_extension


