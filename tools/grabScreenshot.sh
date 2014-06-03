#!/bin/bash

cd /home/pi/tools
./grabScreenshot
convert out.ppm /home/pi/screenly/static/img/screenshot.jpg
chmod 777 /home/pi/screenly/static/img/screenshot.jpg

