## Portaudio backend TODO list

- issues with changing samplerate after starting PortaudioBackend

- Portaudio library isn't deinitialized when the Backend is destroyed

- Issues with some devices/drivers(focusrite), especially at lower latency

- XRun reporting seems broken for many(all?) portaudio drivers

- Use(or optionally use) MME stream out api instead of thread/WaitableTimer

- Use a single thread/WaitableTimer for all midi outputs

- Add option to use timestamps supplied via API on a per device level

- Add DirectMusic MIDI driver? Deprecated? mingw-w64 issues?

- Use a DLL for the CycleTimer, will affect/improve MIDI timing etc

- Support Direct Monitoring
