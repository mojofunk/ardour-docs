# Test Application

An application that can be used to automate testing various aspects of
libardour to find out the limits of the system and any possible issues.

It should be a GUI application so that it can be used by everyone and can be
built into, or at least accessed from the Ardour GUI.

The tests run all also be in the testsuite, which suggests writing a
libardour-test library. What about libpbd/evoral/etc

It should be able to be executed in all configurations including
non-debug/release builds.

Many of the tests are not of a pass/fail nature but rather return

# Results

It may be useful to eventually allow uploading test results so that problems
can be identified with certain versions, OS, hardware etc.
SystemProperties/Profile/Info Class?

System Properties needs to be in a separate file than the test results or
perhaps it included in test results but can be saved separately for uploading
to bug reports etc.

# Tracking Results across versions



# Configuration

The tests will need some form of configuration file to store things like test
paths and settings.

Specify directories that contain audio and midi test data.

Specify Audio and Midi hardware for test, and configuration?

Also add test functions to generate test data/files.

Choose buffer settings, or just test all?

# Display/Record System Properties

- Ardour version
- Build Configuration.
- OS Version(config.guess and allow manual specify)?
- Hardware

Audio

# Audio Hardware/Backend Tests

Xrun test

Xrun cable loopback test

dummy/digital loopback tests

determine latency to listening point test?

Signal Analysis

# MIDI Hardware Tests

Cable Loopback, test latency and jitter.

Syncronization tests

# Data Read/Write Tests

Determine appropriate buffer sizes for specific track counts

# Plugin Tests

# Export Tests

# Session Tests

There should be a number of test sessions distributed with Ardour that can be
used to verify results of export etc.

Use an existing Session as a test profile.

Test saving/etc in a resource constrained environment, memory, disk space.

# Report

What relevant data to present to user? Suggested configurations? A way to
automatically use


