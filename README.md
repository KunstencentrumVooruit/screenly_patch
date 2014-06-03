SCREENLY OSE
************

1) Under the hood


-> screenly/misc/xloader.sh : zorgt voor autostart viewer.py, ook als het crasht. Wordt zelf opgestart door ../.config/lxsession/LXDE/autostart

-> server.py (webinterface) wordt verzorgd door /etc/init.d/supervisord. Doet wel wat moeilijk bij herstarten (in geval van aanpassing javascriptcode bv.). Eerst stop, dan start en daarna restart

2) Viewer.py

Zie comments in file zelf. Belangrijkste aanpassingen:

-> loopfunctie

-> update_playlist aangepast omdat assets die in de toekomst gepland staan niet afgespeeld werden

-> zwart scherm met Vooruitlogo om pauzes tussen assets op te vangen

-> index.haml aangepast om screenshot te tonen


2) Tools

SCREENSHOTS

-> grabScreenshot.c: code via http://www.raspberrypi.org/forums/viewtopic.php?p=376546#p376546

-> compileer met  gcc -O3 grabScreenshot.c -o grabScreenshot -DHAVE_LIBBCM_HOST -DUSE_EXTERNAL_LIBBCM_HOST -DUSE_VCHIQ_ARM -Wno-psabi -I/opt/vc/include/ -I/opt/vc/include/interface/vcos/pthreads -I/opt/vc/include/interface/vmcs_host/linux -L/opt/vc/lib/ -lGLESv2 -lEGL

-> genereert .ppm file, te converteren naar jpg via commando 'convert .ppm .jpg' (imagemagick installeren)

-> */1 * * * *	root	/home/pi/tools/grabScreenshot.sh

OMXPLAYER LOOP

-> apt-get purge omxplayer

-> http://omxplayer.sconde.net/ (eerste .deb!)


