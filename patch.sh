#!/bin/bash

# install noodzakelijke tools voor grabframe
sudo apt-get -y install imagemagick libvncserver0

git clone https://github.com/vooruit/screenly_patch.git

# compileer grabScreenshot
cd screenly_patch/tools
gcc -O3 grabScreenshot.c -o grabScreenshot -DHAVE_LIBBCM_HOST -DUSE_EXTERNAL_LIBBCM_HOST -DUSE_VCHIQ_ARM -Wno-psabi -I/opt/vc/include/ -I/opt/vc/include/interface/vcos/pthreads -I/opt/vc/include/interface/vmcs_host/linux -L/opt/vc/lib/ -lGLESv2 -lEGL

sudo echo "/1 * * * root /home/pi/tools/grabScreenshot.sh" > /etc/crontab
sudo /etc/init.d/cron restart


