# Internal Debugging and Profiling Tools

## Shell Scripts

# External Tools

## gdb

## htop

## strace

## valgrind

## callgrind

Use arcall script to start ardour

Use `callgrind_control -i on` to turn on profiling and `callgrind_control -i
off` to turn off

Then use `callgrind_annotate` to check results

`callgrind_control -b` can sometimes be useful to get a stack backtrace during
execution.

`callgrind_control -e -b` to see event counts

[Callgrind Manual](http://valgrind.org/docs/manual/cl-manual.html)

## heaptrack

## gprof

## perf

[Some perf examples](http://www.brendangregg.com/perf.html)

Sampling for a period of time using PID

perf record -F 99 -p pid -g  -- sleep 20

Using perf report with options that make it a bit easier to understand

perf report -g 'graph,0.5,caller' --no-children

perf top -p pid -g

perf top -p pid --no-children -g --call-graph dwarf


## FlameGraphs

[FlameGraphs](http://www.brendangregg.com/FlameGraphs/cpuflamegraphs.html)

## address-sanitizer

## logging

# Threads

## Butler

## Audio Threads

### Jitter

### DSP load

### Plugins

## GUI Main Thread

### Load/Unload

### Rendering

### Signal Emission
