# Screen Casting/Capture

Some notes on how to perform screen capture on various platforms for adding to
bug reports etc.

## Gnome

Gnome shell will record the entire screen using the Ctrl+Alt+Shift+R keys to
start and stop capture. A small red "record" dot should show up in the top
right corner. The files will be put into ~/Videos.

Gnome shell will limit the recording to 30 seconds by default. To increase the
time limit to for instance 60 seconds use:

$gsettings set org.gnome.settings-daemon.plugins.media-keys max-screencast-length 60

or a value of 0 will mean unlimited

Unfortunately there seems to be no way to record audio with more recent gnome
versions but I'm not sure how/if that would work with ALSA/JACK anyway.

## gtk-recordMyDesktop

Seems promising but I can't figure out how to stop recording and have to
sigkill it, I feel like I must be missing something simple...
