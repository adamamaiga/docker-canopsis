#!/bin/bash
ln -s /opt/canopsis/etc/init.d/canopsis /etc/init.d/
update-rc.d canopsis defaults
RESULT=`/opt/canopsis/etc/init.d/canopsis status`
STATUS=`echo ${RESULT} | egrep "STOPPED|STARTING"`
while [ $? -eq 0 ]
do
    echo "waiting for service start"
    /opt/canopsis/etc/init.d/canopsis start
    RESULT=`/opt/canopsis/etc/init.d/canopsis status`
    STATUS=`echo ${RESULT} | egrep "STOPPED|STARTING"`
done
tail -f /opt/canopsis/var/log/*
