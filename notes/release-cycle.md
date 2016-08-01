# Release Planning Period

- Announce release planning period

- Discuss and Specify what features and fixes should be included in the release
	ordered by priority

- Discuss what branches are ready for merging(meaning fairly well tested and
	general acceptance that they are appropriate changes)

- Determine how long release cycle should be, i.e major release with new
	features that may hold up release or more predictable minor release with
	smaller features and fixes.

- Add version identifier for next release to issue tracker in order to be use
	in "Target Version" and "Fixed in Version" fields

- Add version identifier for major release.X(for instance "3.X") to issue
	tracker in order to be used in the "Target Version" field to indicate that
	fix or feature is not associated with a specific(minor) release.

- Add version identifier for major release+1.X to issue tracker

# Development Period

- Announce start of development period and publish/notify what was determined
	in the planning period.
- Merge feature branches that are ready/approved.
- Minor fixes can be committed to master at any time during the dev period if they:
  - Have a ticket in the Issue Tracker
  - Can be reproduced using test case in Issue Tracker by someone other than
  	the reporter
  - Include a reference to the ticket in Issue Tracker in commit message

# Release Period

- Announce start of release period
- Ask translators to work on translation updates
- Only important fixes are allowed during the release period
- Perform regression tests, including all issues in tracker that have been
	fixed in this release and re-test.
- Perform other acceptance tests.
- Tag release candidates(rc)
- Tag final release

## Announcments

- Website
- Mailing lists
- Media
