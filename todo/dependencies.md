update Fedora mingw-cppunit package to at least be a version epoch whatever
greater than fedora mingw package

Update Fedora mingw packages to define native_pkg_name

Update FFTW3 to version >= 3.5? to get fix for plannar threading

Aubio as of version 0.4.1 has issues building with mingw with jack enabled.

Aubio version 0.4.1 needs wine to be able to run unit tests and build fails if
not installed and able to execute tests. write patch to add option to
optionally disable unit tests or just email author or check if fixed now.

Investigate building Aubio with fftw support rather than inbuilt oura

Investigate aligned malloc warning with rubberband when building with MSYS2/mingw.

Package gtk2-engines for MSYS2 for clearlooks or use ardour version

DONE - Update drobilla libraries for Fedora mingw packages
- Serd 0.24.0
- Sord 0.16.0
- Lilv 0.24.0
- Stratom 0.6.0

update Fedora mingw libsamplerate package to 1.9

DONE - update mingw-fftw package to 3.3.5

update Fedora mingw liblo package to 0.28.0

update mingw-aubio package to 0.4.3

Remove --no-plugins option in mingw-lv2 package, plugins have .so extension

Fedora mingw-cppunit package only builds/provides 32bit binary package
