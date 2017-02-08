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

#~ FIX - [CollectD] Error: unable to connect amqp plugin: amqp_login (vhost = canopsis, user = cpsrabbit) failed
# Declared VHost
/opt/canopsis/bin/rabbitmqadmin declare vhost name=canopsis
# Declared User
/opt/canopsis/bin/rabbitmqadmin declare user name=cpsrabbit password=canopsis tags=administrator
# Set user permission
/opt/canopsis/bin/rabbitmqadmin declare permission vhost=canopsis user=cpsrabbit configure=.* write=.* read=.*

tail -f /opt/canopsis/var/log/*
