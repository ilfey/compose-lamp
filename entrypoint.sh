#!/bin/sh

a2ensite server.conf

# Restart service
service apache2 stop

/usr/sbin/apache2ctl -D FOREGROUND