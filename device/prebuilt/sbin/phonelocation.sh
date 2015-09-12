#!/system/bin/sh
# Edit By YaoSheng 2012/04/27

if [ -e /system/etc/phoneloc.dat ]
then
busybox mv /system/etc/phoneloc.dat /data/system/phoneloc.dat
fi
