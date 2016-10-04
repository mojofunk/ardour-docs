## TODO

Creation of Developer Tools Window to be the first thing after gtk is
initialised...Somehow.

Rename alog to adt

Rename alogmm to adtmm?

Add class tracking to library 

DONE - Rename `A_FORMAT` to `A_FMT`

Use renamed cppformat lib and update

DONE - set alog thread names from `PBD::pthread_name`

Rename LogWindow to LogView and pack it into ADTWindow 

Add ADTWindow class 

Add ClassTrackerView

Add MemoryInvestigateView to view allocations by thread

Add Global enable buttons for logging, class tracking and memory tracking

DONE - Don't reload SourceView buffer if filename/path hasn't changed

Redo patches with correct clang-format file

Done - Fall back to Gtk::TextView in alogmm::SourceView for Windows

Fix source search path on windows

Try using low priority idle timer in alogmm::Sink to update records rather than
using a dispatcher

Rename alogmm::Sink to alogmm::LogManager

Move RecordType to after message in param order in Record etc

Build alog/adt library with MSVC

Move alog to a separate git repository

Write more tests(perhaps using GTest)

Add --enable-developer-tools or similar to configure/build options
