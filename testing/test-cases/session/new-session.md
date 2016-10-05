# Title

## Summary

### Objective

To test creating of a new session via the GUI

### Bug References

None

### Unit Test References

`libs/ardour/test/test_new_session.cc`

### Pre-Conditions

None

### Test Case Dependencies

Installation Test Case

## Steps to Reproduce

1. Start Ardour
2. Use Input Data for Session names

## Expected Result

That Session creation is successful with success expected input data and not

## Input Data

### Success Expected

- Names with spaces
- Names with hypens and underscores
- Names with UTF-8 characters

### Failure Expected

- Names with Colons/Semi-colons
