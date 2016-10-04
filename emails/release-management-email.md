In the interest of maintaining and improving the quality of Ardour releases I'd
like to request some small changes to the release and development process.

Firstly can we have additional communication via email at certain points in the
development cycle?

This would be for the benefit of developers, testers, packagers and users that
for whatever reason are not able to follow and participate in realtime
communication via IRC or are not privy to private development/release planning
discussion.

I'm not asking that private discussions be made public, only that any decisions
that may affect participants be announced in case they miss a conversation and
or feel further discussion is necessary before action is taken.

Specifically I think there should be 3 release management related emails.

The first would be sent at the start of the development cycle(so just after a
release), signaling the start of the development period(a merge window). This
could be something as simple as:

"
The master branch is now open for commits/merging.

Any feature/topic branches that haven't already been discussed and approved for
this cycle please push to origin/official repo and announce that you have done
so with the intention to merge. Then allow some time for testing/discussion
(email and or IRC) before merging.
"

The second email would be to announce a feature freeze period, which is related
to my second request to have a period of at least a week (preferably longer)
before the estimated release date where only straight forward fixes are
committed.

The email should contain:

- An estimated tagging/release date, contingent on blocker bugs (if any) and the
  result of testing.
- A list of the features and fixes (with references to bug tracker) that have
  been committed during the development period and any information relevant for
  testing (This list will also be used at release)
- List any regressions or issues blocking release with references to bug tracker.
- A request for participation in translation and documentation.

A simplistic example of such an email might be something like:

"
The development period/merge window is coming to a close. I plan to tag a
release late next week so if you don't think you can finish up any outstanding
issues with recent work in master by next Wednesday (18th), then please respond
ASAP so we can discuss.

There have been a number of new features (X, Y and Z) added this cycle so please
focus on testing those to ensure there are no remaining issues and if you find
some, please use the bug tracker to report them.

If you are interested in helping with testing for this release, please see the
following list of bugs that have been fixed during this cycle. Additional
confirmation that these issues are fixed and that there have been no
regressions is welcome. General triage of other issues in the bug tracker is
also welcome, especially for those bugs that have not been confirmed. 

[ Bug list ]

Now is the time for contributions to translations so please send pull requests
via github by Wednesday (18th) for them to be included in the release.

Contributions to the documentation/manual are welcome at any time, but now is
also a good time to review the recent changes and features implemented to
ensure that the documentation up to date.
"

The third email would be an announcement of an intent to tag the release. This
would be sent 24 hours before tagging and is probably only necessary AFAICT
because of how the current build system/release system works - there can
be no commits while the official builds are taking place.

This lets all people with commit access know not to commit until after
release (or merge window opens) and hopefully will prevent an issue occurring
like with the 5.2 release.

Ideally these emails will just be a template and minimal time will be spent on
adjusting them and sending them at appropriate times by the release
coordinator. I volunteer to do this if necessary.

My last request is that we try to merge larger changes and those that introduce
additional library dependencies towards the start of the development cycle.

I spent a fair amount of time testing and fixing bugs with the expectation that
we were heading towards a release as it had been mentioned on IRC but was
totally unaware that so many changes were going to be merged just before the
release.

While the changes probably did not invalidate my testing or fixes as they were
mostly related to the new push2 control surface support, it still takes time to
determine. It should not have to be done in such a short timespan and it does
not allow time for testing or review.

I look forward to your feedback,

Tim
