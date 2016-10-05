## Objective

To test for the expected behaviour when creating a new Session

## Bug References

None

## Unit Test References

`libs/ardour/test/test_new_session.cc`

## Pre-Conditions

None

## Test Case Dependencies

Installation Test Case

## Steps to Reproduce

1. Start Ardour
2. Use Input Data for Session names

## Expected Result

Expected Success: Names with spaces, hypens and underscores, UTF-8 characters

Expected Failure: Names with colons and semi-colons
