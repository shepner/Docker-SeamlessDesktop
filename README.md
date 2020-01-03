# Docker-desktop

seamless window

seems that VNC doesnt really have a way to share a single application window (seemless window):
https://en.wikipedia.org/wiki/Comparison_of_remote_desktop_software#Features

At this point, X11 is looking more and more likely (tho I would rather avoid that as [xquartz](https://www.xquartz.org/) hasnt been updated in years)

[Xpra](https://xpra.org/) is effectively screen for X11, by default shares a single app, and has [HTML5 support](https://xpra.org/trac/wiki/Clients/HTML5).  This might be all thats needed....


[x2go](https://wiki.x2go.org/) may be a good alternative

[xrdp](http://xrdp.org/) might be another option??

[xrdp](https://github.com/neutrinolabs/xrdp) prolly wont give this functionality but is an interesting project


old stuff:

* https://stackoverflow.com/questions/33953153/how-to-make-a-single-window-vnc-session-with-x11vnc
