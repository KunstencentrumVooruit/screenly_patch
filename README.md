SCREENLY OSE
************

1) Under the hood


-> screenly/misc/xloader.sh : zorgt voor autostart viewer.py, ook als het crasht. Wordt zelf opgestart door ../.config/lxsession/LXDE/autostart

-> server.py (webinterface) wordt verzorgd door /etc/init.d/supervisord. Doet wel wat moeilijk bij herstarten (in geval van aanpassing javascriptcode bv.). Eerst stop, dan start en daarna restart

2) Viewer.py

Zie comments in file zelf. Belangrijkste aanpassingen:

-> #loopfunctie: eruit gehaald. Te veel problemen met omxplayer

-> update_playlist aangepast omdat assets die in de toekomst gepland staan niet afgespeeld werden

-> zwart scherm met Vooruitlogo om pauzes tussen assets op te vangen

-> voor alle veranderingen: zie patchfile

-> index.haml aangepast om screenshot te tonen


2) Tools

SCREENSHOTS

-> grabScreenshot.c: code via http://www.raspberrypi.org/forums/viewtopic.php?p=376546#p376546

-> apt-get install libvncserver0

-> compileer met  gcc -O3 grabScreenshot.c -o grabScreenshot -DHAVE_LIBBCM_HOST -DUSE_EXTERNAL_LIBBCM_HOST -DUSE_VCHIQ_ARM -Wno-psabi -I/opt/vc/include/ -I/opt/vc/include/interface/vcos/pthreads -I/opt/vc/include/interface/vmcs_host/linux -L/opt/vc/lib/ -lGLESv2 -lEGL

-> genereert .ppm file, te converteren naar jpg via commando 'convert .ppm .jpg' (imagemagick installeren)

-> */1 * * * *	root	/home/pi/tools/grabScreenshot.sh

OMXPLAYER LOOP

-> apt-get purge omxplayer

-> http://omxplayer.sconde.net/ (eerste .deb!)

3) installeer patch

curl -sL https://raw.githubusercontent.com/vooruit/screenly_patch/master/patch.sh | bash

4) API

-> nieuwe asset (fileupload nog te checken):
> > curl --data-binary "@postdata" http://192.168.2.60:8080/api/assets

-> update bestaande asset:
> curl --data-binary "@postdata" http://192.168.2.60:8080/api/assets/580c92e07cb34c7d96950f9cdb01c88a

@postdata:
``` 
name=wim2&mimetype=image&uri=%2Fhome%2Fpi%2Fscreenly_assets%2F10b8eb1354be48cbaa228a749c6fb841&is_active=false&start_date=2015-03-04T19%3A00%3A00.000Z&end_date=2015-03-03T20%3A00%3A00.000Z&duration=0&is_enabled=0&nocache=0
```

