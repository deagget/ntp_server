#!/bin/sh
if sudo sh -c  "service ntp status | grep inactive" > /dev/null;
then sudo sh -c "service ntp start"
else echo NTP service start
fi
echo "NOTICE: /etc/ntp.conf was changed. Calculated diff:"
echo  ` comm -3 /etc/ntp.conf /root/ntp.conf`
if diff -u /etc/ntp.conf /root/ntp.conf > /dev/null;
then echo All is fine
else  sudo sh -c "cp /root/ntp.conf /etc/ntp.conf"
echo  File ntp.conf restore
fi
