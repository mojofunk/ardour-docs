Move Midnam document parsing into ARDOUR::init?

Session::get_info_from_path is called to populate recent session dialog which
involves parsing all the session xml files, measure perf impact

Use new/delete and boost::scoped_ptr in EBUr128 class for exception safety etc
and remove goto

Remove use of goto in Session::save_state

Use `PBD::copy_file` in Session::create

move session directory names in libs/ardour/directory_names into
SessionDirectory class?

rename ARDOUR::ProcessThread to ARDOUR::ProcessContext

correct all header include ifdefs to be C and C++ standards
compliant

Rename ARDOUR::init_post_engine and write docs about why it
needs to be called after audio engine is valid etc.

rename libardour/globals.cc, most of the functions in it are
declared in ardour/ardour.h

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

