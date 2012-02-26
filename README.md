Creepy Cam
==========

A simple PHP site to serve up streaming images from a Mac's built-in iSight
camera. Affectionately referred to as the "Creepy Cam".

Installation
------------

[Enable Web Sharing][web] and make sure that you've [enabled PHP][php] on your
system. Next, install the [imagesnap][imagesnap] application to facilitate the
capture of images from your Mac's iSight camera. If you have
[Homebrew][homebrew] installed, the following commands should get you up and
running.

    brew install imagesnap
    git clone git://github.com/chazlever/creepycam ~/Sites/creepycam
    cd ~/Sites/creepycam
    ./start.sh

Who are you?
------------

My name is [Chaz Lever][chazlever]. I'm a graduate student pursuing a PhD in
computer science with a focus in computer networking and security.

[php]:http://stackoverflow.com/questions/6790568/how-do-you-get-php-working-on-mac-os-x-lion-10-7
[web]:http://www.macinstruct.com/node/112
[imagesnap]:http://iharder.sourceforge.net/current/macosx/imagesnap/
[homebrew]:http://mxcl.github.com/homebrew/
[chazlever]:http://www.chazlever.com
