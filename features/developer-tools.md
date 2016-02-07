# Developer Tools

What functionality is required Developer Tools(DT)?
What are some similar tools available to compare/copy/etc.

- EA TurboTuner
- Mozilla Developer Tools
- Chrome Developer Tools
- Gtk Inspector

## Information

Allocations, class instance, source location, timing, thread 
Class instance counts, traces for instanciation/copying/destruction including
source location. Ideally the state of all class properties can be recorded.

A logging stream per class and to be able to filter messages for a
particular instance or instances.


## A Timeline view

The ability to start and stop capturing data for a list of classes

When selecting a time range in the timeline view the entries in the log window
should be filtered.

## A Class overview

Contains list/treeview of classes with instance count, copy count. 


## A Class instance view 

View all the properties of a class. Values should change as the timeline cursor is
moved to them at a particular point in time.

All the Log messages/calls made by the class

## A General Log view

The current logging system is not class based but domain/category based, It
could be argued that this is necessary as the classes are too big and contain
too much functionality but still, something that may be necessary to keep.




