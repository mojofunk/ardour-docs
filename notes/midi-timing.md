
Currently the portaudio midi ports have their latency set to the same offset as
the audio ports but the timestamps used are relative to the current cycle. The
timestamps need to be adjusted so that the input latency is added to the
incoming timestamps of the midi messages and the output latency is added to the
timestamps of the outgoing midi messages

Each Midi input and output may have a different latency offset so the
`systemic_midi_latency`

The input and output latency offset of the timestamps has to be identical to
the offset of the ports. So the port latency must be set from the offset member
of the midi port 

A midi input/output needs access to a TimeStampProvider/Source to be able to
get generate a timestamp when the midi msg arrives. If the underlying API
provides a timestamp then the device needs to indicate which timestamp it is
using.

# MIDI loopback offset measurements in master

Measurements are in samples before the 
WASAPI
fpp = 4096 loopback latency ~= 13633 samples
fpp = 512 loopback latency ~= 3273

ASIO = 512 loopback latency ~= 1569
ASIO = 4096 loopback latency ~= 12300

# hit assertion after restarting audio engine, investigate

assertion ardour/midi_port.cc line 248

In the case where the audio device is using 2 periods then the max Midi input
latency should be samples_per_period.

Midi port input latency should be samples_per_period 

