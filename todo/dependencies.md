update Fedora mingw-cppunit package to at least be a version epoch whatever
greater than fedora mingw package

Update Fedora mingw packages to define native_pkg_name

Aubio as of version 0.4.1 has issues building with mingw with jack enabled.

Aubio version 0.4.1 needs wine to be able to run unit tests and build fails if
not installed and able to execute tests. write patch to add option to
optionally disable unit tests or just email author or check if fixed now.

Investigate building Aubio with fftw support rather than inbuilt oura

Investigate aligned malloc warning with rubberband when building with MSYS2/mingw.

Package gtk2-engines for MSYS2 for clearlooks or use ardour version
