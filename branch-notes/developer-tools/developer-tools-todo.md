# TODO

Creation of Developer Tools Window to be the first thing after gtk is
initialised and able to be accessed before any other Ardour dialog/window is
presented.

Redo patches with correct clang-format file

Squash/Fix patch series

## Windows

Fix source search path on windows

Fix low timer resolution on windows, perhaps incorporating QPC Timer from
libpbd/mojo

## Naming

DONE - Rename alog to adt

DONE - Rename alogmm to adtmm

DONE - Rename `A_FORMAT` to `A_FMT`

DONE - Rename ScopeTimer to ScopedLogger

Rename LogWindow to LogView and pack it into ADTWindow 

DONE - Rename alogmm::Sink to alogmm::LogSink?

DONE - Rename Record to LogRecord or LogEvent?

DONE - Rename logging.hpp to log.hpp? move log.hpp to LogPrivate

DONE - Rename adt::Sink to adt::LogSink

DONE - Rename RecordType to LogRecordType

DONE - Rename RecordType::Mark to RecordType::Instant

DONE - Rename Record to RTLogRecord

DONE - Add LogRecord to adt:: that uses std::string (Move from libadtmm)

DONE - Rename pbd/loggers.h pbd/logging.h, and same for ardour/loggers.h etc

DONE - Rename de/initialize_loggers to de/initialize_logging in pbd, ardour, etc

DONE - Rename adt::String to adt::RTString

DONE - Enable recording logging from the command line by setting A_LOG environment var

DONE - Add A_LOG_FILE environment variable to override the default trace log output
file

DONE - Add A_LOG statements in PBD::Transmitter to capture error/info/warning messages

DONE - Test that changing LogImpl only causes adt.cpp to be recompiled

Add a thread added callback so that trace event sink can write the thread list
periodically?

Add a LoggingGroup class/enum that is used to enable a group of logging
categories via callback(or other mechanism). With at least Default and All
groups defined. 

## Other

Change all member variables to have_ this_ post_ fix_ m_rather m_than m_this?

DONE - add capability to set to synchronous to LogImpl

Is adt/forward.hpp necessary? Is it only used for internal declaration?

DONE - Move static singleton functionality in logging.hpp into Log class and
move async_log into internal implementation in private/

Separate Initialization for Log, MemoryTracker?

DONE - Remove all cerr debug output from libadt/libadtmm

Use std::make_unique...well perhaps just factory functions

Use std::make_shared

Move Logger instances to source file that references them if only single file
uses logger

## libadt

Write tests to find out the size of a default allocated string and how many
characters it can store (SSO) before allocation

Use `char* const` for property names and filename and function names

DONE - Add a Singleton class

Add an AtExitManager class similar to chromium

Register Singletons with AtExitManager

Move ThreadNameRegistry to private

Move utility classes like Demangle/FixedSizePool etc to private/?

DONE - Add the ability to enable timing/duration events separately from normal
log messages.

DONE - Rename LogRecord::logger_name to category

DONE - Rename A_LOG_SCOPE to A_LOG_DURATION?

DONE - Remove A_LOG_SCOPE_MSG macro as timing data should not include string
formatting and should be replaced by separate messages

DONE - Add A_LOG_DATA (LOG::name, this, first, second, third)

DONE - Add A_LOG_CLASS_DATA (LOG::name, this, first, second, third)

DONE - Add A_LOG_CALL (LOG::name, this, rg1, arg2) 

DONE - Add A_LOG_FUNCTION_CALL (LOG::name, param1, param2) 

DONE - Remove cpu_id, thread_id arguments from RTLogRecord

DONE - Move dis/enable trace from Logger class into Log class

DONE - Move dis/enable message types from Logger class into Log class

DONE - Generate/Create StackTrace in RTLogRecord and not in ScopedLogger/Logger

DONE - Remove Log::set/get_trace_enabled by default

DONE - Add ScopedLogger::get_enabled() method

DONE - Only create LogRecords in ScopedLogger if Logger and Message type enabled

DONE - Add large bucket size in adt::Allocator for Properties

Use `RTProperty*` in RTPropertyList class to reduce total allocation
size for unused properties

Look again into using std::unique_ptr instead of explicit new and typedef/using
pointer types to use custom deleter.

Move VariantTemplate union into Variant?

DONE - Add ADT_ENABLE_PROPERTIES to enable/disable creation of properties 

Move to_string into Variant or non template part of it?

Remove `m_` prefix from public struct members

Add explicit RTProperty and RTVariant types/defs

Add explicit StandardProperty and StandardVariant types/defs

Move adt/debug.hpp to private and only include in common_source_includes

Add public adt-private.hpp header for tests and debugging etc.

Add allocator stats

Move Semaphore into private/

Improve allocator pool code to use vector or std::array of FixedSizePools

Rename FixedSizePool to MTFixedSizePool

Add STFixedSizePool

Override global new/delete to track allocations

Use Thread local pool allocators to avoid contention that might affect timing
etc for threads that are registered with Threads::register()

Add a way/class to set allocator properties, chunk size/min count/max count etc

Use TLS for RT threads in adt allocator

Rename logging_de/allocate to adt::de/allocate

Put functions in allocator.hpp into new Singleton Allocator class

Look into add allocators from cppcon 2015 video?

DONE - Add line token/name to scoped_logger instance so more than one can be
used in the same scope/function

Perf impact of making Logger::write_record inline and just check if enabled in
the inline section and then call a private function if it is to avoid the
overhead of a function call and is it worth it?

DONE - Use renamed cppformat lib and update

DONE - Move `get_cpu_id()` to somewhere more appropriate

DONE - Rename macros.hpp file to log_macros.hpp

DONE - Add locale independant string conversion functions for thread/proc id's
and timestamps. Cheated by using std::ios::imbue with std::locale::classic.

DONE - Make Logger instances statically initialized, and de/initialize libadt
on demand 

DONE - Use adt::de/initialize to init adt lib

DONE - Call adt::de/initialize from libpbd

add sync parameter to LogSink::handle_record

enable logging using category names with upper or lower case characters

Add get_enabled_for_type (LogRecord::Type) API to Logger class

DONE - Add ThreadsPrivate class

Rename Log::set_all_categories_enabled to Log::set_categories_enabled_by_default?

DONE - Add LogFile interface for writing trace event data rather than
inheritance.

Add trace events for TraceEventLogSink write time etc

Rename thread var in TraceEventLogSinkPrivate to m_write_thread or..?

Pass unique_ptr to transfer strong ownership in TraceEventLogSink::set_output_file

Add ThreadType enum with at least Normal/RealTime

Add ThreadType argument to Threads::register/deregister function

DONE - Remove Thread id and CPU ID args from RTLogRecord


DONE - Move RecordType to before message in param order in LogRecord etc

Add interface to Logger/Log to limit writing log records to only certain
RecordTypes. e.g Only duration or only Instant or only function calls.

DONE - Rename Threads::register_name to set_name

DONE - Add Threads::get_name()

Add LogFileSink interface that takes a LogFile instance

Rename TraceEventLogSink to TraceEventLogFileSink

DONE - Add class tracking to library

Use thread local FIFO to send log events to guarantee message ordering? Not
necessary as messages from a single thread are still strictly ordered.

Add wscript for libfmt and moodycamel so that alog.hpp/cpp can include the
headers using what would be the normal system wide include path. So
`<fmt/format.h>` and `<moodycamel/concurrent_queue.h>`

Add StderrSink and StdoutSink and derive from OStreamSink

Build alog/adt library with MSVC

Move adt to a separate git repository?

Write more tests(perhaps using GTest)

Rename Allocator class to StdAllocator

Does cxa_demangle leak? ref boost/core

Add LogRecordCache interface with get_cached_records/clear_cached_records

Add LogRecordCache::set/get_max_cache_size

Implement LogRecordCache interface in TraceEventLogFileSink

Move handling of `A_LOG*` environment variables into libadt

Will priority inversion be a problem for sync logging?

## libadtmm

DONE - Append records to tracing file at timer interval or if num records > max

DONE - Fall back to Gtk::TextView in alogmm::SourceView for Windows

DONE - Try using low priority idle timer in alogmm::Sink to update records
rather than using a dispatcher

DONE - Don't reload SourceView buffer if filename/path hasn't changed

If the source file can't be found, show nothing rather than the last source
file

Add filename label above/below source view

Remove filename from RecordView columns

Add ADTWindow class 

Add ClassTrackerView

Add MemoryTrackerView

Does adtmm::LogSink need to derive from sigc::trackable?

Put LogControl in ScrolledWindow

Add toggle button or checkbox to enable only timing log data

Rename LogSink to LogRecordCache or ...?

Add display of recording time

Add separate enable buttons for logging, class tracking and memory tracking

Use lock-free queue in adtmm::LogSink as it is only between two threads

Refactor adtmm::Sink into TraceEventFileLogSink

Checkbox to auto update at timer interval in LogView

Explicit Update button in LogView

Add adt::LogSink::set_enable/get_enable API

return bool from adt::TraceEventLogSink::set_enabled to indicate success

If the current file cannot be displayed use an empty textview/File cannot be
found message.

## libpbd

DONE - set adt thread names from `PBD::pthread_name`

Save trace log as compressed archive, on quit?

Add --log-type command line argument

Write trace log to temporary location, not home directory?

DONE - Add sink to libpbd that writes to trace event format

DONE - Add Glib option parsing options.h/cc in pbd::init

DONE - Rename CommandLineOptions to LibraryOptions

Add init function to take LibraryOptions reference to allow setting options
without constructing argc, argv

Move pbd.h/cc to init.h/cc

DONE - Add --log-file argument to specify log file

Add --log-sink argument to specify trace-event-file, plain-file or stderr/stdout?

DONE Add --log-enable-trace and A_LOG_TRACE variables

Add LogFormatType enum with Text and TraceEvent types

Use g_get_pgrname to set default output file?

Add accessor for Glib::OptionContext Singleton instance to be able to add
libardour and ui OptionGroups to it?

PBD::parse_logging_options, pass by std::string const& rather than const char*

## libardour

Call PBD::pthread_name to register process threads

Add moodycamel::readerwriterqueue for thread <-> thread queuing

DONE - Rename DiskIOPerf AudioIO?

## gtk_ardour

DONE - Make a new Log Event type "Complete" event that has a start time and end time
(or duration).

DONE - Remove A_LOG_CALL

DONE - If syncronous logging is enabled then ScopedLogger should write a start
and end log message otherwise a complete event with duration

DONE - Set active loggers from environment variable A_LOG='files,network,processors' etc

DONE - Add adt::short_function_name std::string

DONE - Make adt::Loggers disabled by default?

DONE - Add adt::set_categories_enabled (std::vector<std::string const> const&)
and use it from PBD::parse_log_env log parsing code

DONE - Remove A_DEINIT_LOGGER, as adt::Log managers the Logger instances

DONE - Fix so that A_LOG=all enables all loggers even when they don't exist yet.

Add build option to build without Developer Tools GUI/adtmm library dependence?

Add --enable-logging or similar to configure/build options

Add --enable-class-tracking or similar to configure/build options

Add --enable-tracking-allocator or similar to configure/build options

Add --enable-developer-tools to enable all the above? and build/link to
libadtmm

Add adt::Logger class as friend of adt::Log and make Log::write_record private

Have low/medium/high/max logging output to be able enable useful debugging by
default or default/all and use these options from the command line --logging
all

DONE - Add --log-categories list command line option, sort of useless ATM
though as it only lists logging categories that have already been registered

DONE - Add --log-categories all command line option

Add --log-sync command line option

Add --log-sinks trace-event-file, stderr

DONE - Move trace event/json related utilities into libadt

Add adt::short_function_name for RTString?

Use adt::short_function_name to truncate function names before writing to
RTRecord?

Remove virtual and return type in function name in adt::short_function_name

Add option to adtmm::LogView to change filename to save log to

Add atomic counting to PBD::init/deinit to allow multiple matched callers or
convert to PBD::Init Singleton class

Add PBD::cleanup to main()

Make adt::Loggers enabled/disabled check non-atomic for performance/cache
impact

Add export macro to necessary functions/classes

Add adt::set_loggers_disabled (std::vector<std::string const> const&)

Move initialization of Loggers into A_DEFINE_LOGGER, call Log::initialize()
from Log::get_logger_for_category()...This seems to have issues.

Only link to libadt with --enable-developer-tools defined, so all macros need
to define a null version

DONE - Add a A_DECLARE_PRIVATE macro or similar

Add macros for all public API so that there aren't ifdefs like
A_REGISTER_THREAD etc

Write test to check fix of threading issue with RunLoop startup

Write test to check speed of A_FMT vs string compose and A_DEBUG vs A_LOG

Move PBD::midi_event_to_string up the stack? libardour?

Use A_LOG in ardour_g_log handler

## Code Style

Check for correct placement of const

Use range for instead of iterators where possible

# Notes

Can't use quotes in logging strings as it breaks Trace Event parsing

Don't use newline characters in logging strings
