I'm involved developing an application that uses waf that takes about 30
minutes to build on my machine(from cold ccache)

It builds about a dozen shared libraries and the application I have been
experimenting lately with using distcc to speed it up a bit. I was wondering if
there is a way for waf to start the linker for a particular library straight
after the object files have been compiled while the other threads continue
compiling other libraries.

At the moment using distcc I can compile all the source files in about 8
minutes but then it takes roughly 2 minute to then link. My thinking is that if
I can get the local machine to link the libraries while the "build slaves" continue
there work I will have a faster build.

If you think I've made any wrong assumptions please correct me. I have tried
to use build groups but quickly realized that they wouldn't help me(unless I'm
using them wrongly).

I use ccache which helps alot but I also often swap between many different
branches, a native linux build and a cross compiled build for windows etc so it
would be nice if there was something I could try that I may have overlooked We
are using version 1.6.11 if that makes any difference to my inquiry
