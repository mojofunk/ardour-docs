I have pushed a branch called rewaveview to origin(official ardour repository)
that started out initially as an effort to address the long standing bug #6478.

In trying to understand the issue/s there were a number of things I thought
could be improved so I ended up rewriting/redesigning some of the aspects of
rendering the canvas and waveforms.

I have not been able to reproduce the crashing issue in the rewaveview branch
as I can(eventually) in master, but as it is fairly hard to reproduce I would
like some further testing and feedback on the branch before hopefully
proceeding to merge/commit to the master branch after working through any
(hopefully minor) issues. As although I've done many hours of testing it is a
fair bit of new code so there is the potential for a different set of issues
and or simple typos/oversights etc.

The first main change is to coalesce changes to the canvas. Mouse and Key
driven events have a higher priority than rendering the canvas so if there is a
consecutive sequence of events that result in a change in state of the canvas
then rendering the result of those changes is often blocked until a pause in
the event stream and sometimes in the case of a series of mouse driven events
until after the last event, even though the last state is the only state that
gets rendered.

This results in a lot of superfluous processing taking place in
Editor::visual_changer and it is noticable in the jumps for instance when
holding down the -/+ keys to zoom, zooming with the mouse wheel or using ruler
drag zoom. Coalescing further canvas changes after the first is rendered and
then processing those changes once(and re-rendering) results in a much smoother
and predictable canvas zooming/scrolling experience and a noticably higher
frame rate when performing those operations.

The other main change is to introduce an interface that canvas items can
implement so they will be notified when a change to the canvas or items occurs
and they are determined to be located in the visible canvas area. This is only
implemented for WaveView at the moment and it allows the waveform to be drawn
in another thread/s much earlier than previously, so that by the time the
canvas renders for display the image is usually finished and you don't get
much flickering of the audio regions.

The design and implementation of the WaveView class has changed a fair amount.
The waveform drawing itself should be unchanged but the handling of threaded
drawing and support classes are different.

The caching of images in WaveView was improved so that all caching operations
are in constant time. I thought this was necessary as in the master branch when
the cache is full(which it becomes quite quickly) it can slow rendering down
enough that it was worth fixing.

Another change I made to the caching of images is being able to add them to the
cache as soon as the request is made and they are unfinished, as it means that
usually only one image is drawn for WaveViews with similar properties and
it reduces the amount of drawing for loop/clip based compositions for instance.

There are a few more optimizations/tricks included in the changes and when
threaded rendering is enabled it will use cpus/cores - 1 threads for waveform
drawing which is useful in some circumstances to reduce draw time and
flickering.

I'm going to be travelling for the next 10 days, so I may not have much
opportunity to respond to feedback/issues until after I get back but have
created a report in the bug tracker to track any issues:

http://tracker.ardour.org/view.php?id=7309

I attached to the report some logging/trace output of various of my testing
scenarios for master and rewaveview that can be analyzed with
chrome/ium://tracing if anyone is interested in those.

There are a few further changes that will help to improve canvas performance
that I know of, but this is a very good start I think.

Depending on how testing of the branch goes, we can discuss when/if it can be
merged into master after I get back, I just didn't want to sit on this code if
there is a possibility of fixing #6478 before the next release.
