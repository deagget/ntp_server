#!/bin/sh
sudo sh -c "apt-get update"
sudo sh -c "apt-get install ntp"
sudo sh -c "sed -i '/[1-4].ubuntu.pool.ntp.org/d' /etc/ntp.conf"
sudo sh -c "sed -i 's/.*.ubuntu.pool.ntp.org.*/ua.pool.ntp.org/' /etc/ntp.conf"
sudo sh -c "service ntp restart"
sudo sh -c "sed -i '$ a \\*/5 * * * * /bin/bash  /root/ntp_verify.sh' /etc/crontab"
sudo sh -c "cp /etc/ntp.conf /root/ntp.conf"
