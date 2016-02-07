# The Current XML/State API

The current XML API is a small wrapper around libxml2. The DOM that is used to
read/write state in ardour is constructed entirely in the wrapper on document
read/write.

The DOM for the Session and other separate state structures such as
configuration data are mostly not kept in memory. An exception to this is the
`Stateful::add_extra_xml` method which is used to add external state to a
DOM. The `add_extra_xml` method takes a reference to an external XMLNode that
contains the state of some external class instance. This is used for instance
to add GUI specific data into the Session DOM.

When the state of a Session is written to disk in `Session::save_state` a new
DOM/XMLTree is created and `Stateful::get_state` is called for each Stateful
class that the Session references directly and they in turn call `get_state` on
any Stateful classes etc down the tree. A new XMLNode is allocated in each
virtual `get_state` method to contain the state of the class in xml/text form
and then this new node is returned by reference to the parent class to add as a
child node using `XMLNode::add_child_nocopy`.

# Issues with the current XML/State API

`Stateful::add_extra_xml` uses `XMLNode::remove_node` to remove a node of the
same name as the one being added. `XMLNode::remove_node` does not delete the
child node being removed so it is likely that the node is leaked as the node
being added is added as a child node using the `XMLNode::add_child_nocopy` API.

When `Stateful::add_extra_xml` is called the XMLNode instance is allocated
for instance in the GUI and then `Session::add_extra_xml` is called and the
Stateful class instance should take ownership of these extra nodes.

The lifetime of these XMLNode instances are tied to the Stateful class instance.

On read/write the wrapper will re-create this DOM using libxml2 data structures
and there will be two copies the data at that point.

A concern with the current usage of the XML API creation of the entire DOM on
Session save. This creates a memory usage spike that may mean being unable to
save if close to exhausting the available memory. I've never experienced it but
it is something to consider for extremely large sessions with plugin state or
lots of automation etc.

XMLNode and XMLProperty have a "name" member that is a std::string that is set
at construction time and has no modifier methods so it could be const but the
issue really is that the node and property names are contained in a typical
Session file many many times. As each instance is holding a copy of the name in
the std::string it means allocation occurs for each copy, it may not if Small
String Optimization(SSO) is in use by std::string but even if it is and
allocation for the "name" occurs as part of the allocation for XMLNode/Property
it will still use more memory and have more overhead(copy etc) that than just
using `const char* const` as the type at least for name. Is it possible the
XMLNode/Property names will need to be copied under some circumstances?

`Stateful::add_instant_xml` is called by `ARDOUR_UI::save_ardour_state` to save
the state of the Editor, Mixer and Meterbridge. There are a two issues at this
point but the main one is that the `get_state` methods in those three classes
follow the usual pattern of allocating the XMLNode's storing their current
state in them and then returning a reference to the allocate nodes. As
`Stateful::add_instant_xml` copies the nodes the XMLNode instances that were
allocated a leaked. The other minor issue is that the each time
`add_instant_xml` is called it writes the file so it is written three times
rather than just once. There are few other similar uses of `add_instant_xml`
where XMLNode instances are leaked.

`Stateful::_extra_xml` xml member is leaked

# Fixing issues with existing API

Delete all XMLNode's after they are passed to `Stateful::add_instant_xml`

`Stateful::get_state` should return by pointer not reference?

`XMLNode::add_child_nocopy` parameter type should be a pointer no a reference

All users of `Stateful::add_extra_xml` should add child nodes directly to the
extra xml node so that the `_extra_xml` node can be owned by the Stateful class
and properly destroyed

Even though every class derived from Stateful has the `set_extra_xml`
method only ARDOUR::Session and ARDOUR::Configuration classes seem to be using
this functionality presently(actually there are a few more AFAICT). Similarly
each Stateful class also has an `Stateful::add_instant_xml` method and
`_instant_xml` XMLNode that is only used by Session and Configuration classes.
So it seems like functionality isn't relevant to all the other classes derived
from Stateful and it should be moved.

Also `Stateful::add_instant_xml` and `Stateful::instant_xml` should be moved
out of the Stateful class perhaps into a InstantXMLDocument class

# Changes to existing XML API?

Rather than be able to create nodes and properties outside of the Document/DOM,
if the only way to create new nodes is via a document/tree then lifetime
management of the nodes is tied to the life of the document and reference
counting of nodes is not necessary.

This means that a Session instance would keep the DOM in memory at all times
and basically when a class instance changes it notifies the Session or other
class responsible for the DOM that the state has changed. It is not necessary
for the state of the class instance to be copied into the DOM at that point,
the StateObserver class(I'll call it for now) could just take note of which
classes had changed since the last save request and then request the state of
all the classes at that point.

Monitoring instance state and updating the DOM has the advantage that the
entire state of the session doesn't have to be allocated at the point of saving
the session. Which could become an issue with larger sessions if saving is not
possible because hundreds of Megabytes need to be allocated. If the Session DOM
is already in memory this shouldn't be a problem and writing it to disk should
not require much additional memory and possibly be faster?

This is how libxml2 and most xml/DOM API's I've encountered to be implemented.

This means that classes can't just return an XMLNode representing class state
they need to first access the DOM/tree to get an new XMLNode to add their
child nodes/properties to. This doesn't mean each class needs to reference the
Session instance(although many do already) an ArchiveNode instance could be
passed into the `get_state` method and then the class adds its properties to
the ArchiveNode. If the class instance is the owner of a child class that has a
`get_state` method then the

# Measurements

## Memory usage

- `Session::get_state`
- `Session::set_state`
- Midnam file parsing

## Execution time

- Session constructor
- Session save/write
- Midnam file parsing

# Requirements for a new/modified XML API

## No raw use of new/delete

The current API has ownership semantics, XMLNodes are allocated using new and
passed around by reference.

## Lower memory usage

The current API stores node and property(attribute) names in std::string. This
means there are many many copies of the same string and a lot of allocations
when a document is saved.

## Support for Allocators

## Similar API

The API should be as similar as possible unless the changes are required to
satisfy other requirements. 

## Compatible/Identical output

The xml should be compatible/identical to the current API.

# Implementation

The implementation will still be a wrapper API around libxml so no new
dependencies are introduced and output should remain identical.

## Lower memory usage

In a typical ardour file there are a lot of repeated node and attribute names
and if each instance is saved as a std::string in the "DOM" then that may use a
lot of memory on load/save and will cause many small allocations which will
affect performance.

When writing the DOM created with a libxml wrapper API, libxml will also keep a
copy of all character arrays in its internal DOM until the document is written
and similarly at document read time there will be a character array in the
libxml DOM and then another copy in the wrapper DOM

There is no way to avoid libxml copying character arrays when reading and
writing a document but there is a way to reduce the amount of copies kept in
the wrapper using a mapping of const char arrays to "atom" pointers. 
