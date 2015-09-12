#!/sbin/sh
#Created by yyjdelete && Edit By YaoSheng
if [ `cat /sys/devices/system/soc/soc0/zte_ftm_flag` -eq 0 ]
then
	echo 'ro.mode.ftm=0' >> /default.prop
else
	echo 'ro.mode.ftm=1' >> /default.prop
fi
