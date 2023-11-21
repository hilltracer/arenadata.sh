#!/bin/sh -eux

(
cd "$HOME/src/kafka"
bin/kafka-server-stop.sh || echo $?
bin/zookeeper-server-stop.sh || echo $?
rm /tmp/kafka-logs/*/*
bin/zookeeper-server-start.sh -daemon config/zookeeper.properties
#JVMFLAGS=-Dsun.net.spi.nameservice.provider.1=dns,sun 
#export KAFKA_OPTS=-Dsun.security.krb5.debug=true
bin/kafka-server-start.sh -daemon config/server.properties
#tail -F logs/*.log logs/*.out
tail -F logs/*.log
) 2>&1 | tee "$HOME/adb.log"
