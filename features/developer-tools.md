# Feature: Developer Tools

## Description

The Developer Tools(DT) feature would be an additional user interface used
primarily be developers to help debug issues in Ardour.

Some similar tools are available as standalone software but are also frequently
built in to an application.

- EA TurboTuner
- Mozilla Developer Tools
- Chrome Developer Tools
- Gtk Inspector

## Requirements

- The DT ui should be accessible from within the application and also
  standalone.

- View class allocations, instance counts, source location, timing and thread
  info and traces.

- View the state of all class properties and record state changes

- Support Syncronous and Asyncronous logging.

- Low overhead, for instance the ability to turn on logging at a class or per
  logging stream level.

- Log to file mode where the log sink is logged to a file in another thread.

- Load a log file from disk and display in log viewer.

- Set active loggers at application startup via command line

- Set active loggers at application startup via dialog

- Able to load/save enabled loggers from/to a config file.

- Save last logging profile(enabled loggers) to config file and reload

- Save/Load logging profiles by name

- Filter timing data from log message data

- Logging should be RT safe.

- Show timing statistics for function calls, min/max/avg/etc

- Display timing events in log graph style view, for instance frame rate/dsp
  process time

- Display a function call stack over time, list files and source.

- Useful analysis of audio/midi threads and processing threads/plugins

- Useful analysis of butler thread/diskstream etc

- Useful analysis of GUI Timing/redraw/wave image cache etc

- Start and Stop recording of log records

- Record log for a time period. i.e Record log output for X seconds

## Logging Options

When a user has an issue and a developer requires logging output what is the
best way to get that information? Using the same interface required to use the
application IMO. So either enable logging to disk via a menu or save to file
from a logging window.

If the issue is timing sensitive then logging only the relevant data required
would result in the least overhead. In which case specifying a logging profile
file that will only enable the logging options that the developer is interested
in may be a good idea, otherwise the user may have to interact with the
developer to set up the logging or use the command line(if they can)

## Disk Logging

## Time Estimate

At least 100 hours to get something useful.

## Implementation Details

A logging stream per class and to be able to filter messages for a
particular instance or instances.

Function scope timing should be done RAII style
`A_LOG_TIME_SCOPE(PBD::Loggers::Init)` to ensure termination of timing events

`A_LOG_FUNC_PARAM`
`A_LOG_CLASS_VAR`

For timed events that record a log message at event start and event end, the
cpu id may change. How will that impact display of events in UI

`A_ASSERT_THREAD` macro that can be used to assert that a function is executed
in a certain thread context

## alog

Is a callback mechanism needed to signal when a Logger has been enabled or
disabled. If there is only a single ui widget that controls the Logger enabled
state then perhaps not.

Define a RAII style macro to log begin and end records to capture timing
information for scopes etc.

## Preferences

The DT application should have a default settings/preferences file that is
saved to a $appname.dtp(dev tools profile/preferences file) in a user config
directory that is loaded by default.

A preferences/profile file should also be able to be specified on the command
line.

Preferences include:
- Enabled Logging streams
- Capture traces
- Capture class allocation counts

## alogmm::Sink

Implement a limit on the number of Records stored in the Sink

Implement a filtering mechanism. The Sink should probably hold a set of filters
that are applied when records are received and stored in a separate set of
Records? or should filters be applied when iterating/displaying all?

## ui::LoggerControlWidget

DONE - Enable or disable loggers

- Filter loggers by name

## ui::LogRecordListWidget

Filter Records by Logger name, message, cpu, thread, path/directory/file, function, file
line range.

Selecting Records in the list can update the timeline view to show only records.

## ui::LogRecordFilterWindow

## ui::LogRecordFilterEditWidget

## ui::LogRecordFilterListWidget

## ui::LogRecordTimelineCanvasWidget

When selecting a time range in the timeline view the entries in the
LogRecordListWidget should be filtered or perhaps just selected.

## ui::ClassTrackerControlWidget

Contains list/treeview of classes with a row for each class type. columns would
include class name, enable counting, enable tracing.(or perhaps just one
"enabled" column.

## ui::ClassInstanceTimelineCanvasView

Classes that are enabled in the ClassTrackerControlWidget will be displayed in
a line graph. A line for each class type representing the current allocation
count.

Rows is selected in the HistoryListView will be displayed, probably as a
vertical line at the event timestamp.

## ui::ClassInstanceHistoryListView

Contains the history of class instance creation/copying/destruction. column
headings would be Class Type/Name, Timestamp, Instance address,
Event(Created/Copied/Destroyed), Line, File.

## ui::ClassInstanceView

View all the properties of a single class instance. Values should change as the
timeline cursor is moved to them at a particular point in time.

All the Log messages/calls made by the class

## ui::ClassInstanceTraceView

Display of the current trace.

## A File view

The file view could show which files are being accessed.

## Misc

Use unique line tokens generated by compiler for use as unique id's for timing
etc in `LOG_SCOPE_TIME`?

