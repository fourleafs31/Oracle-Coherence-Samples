#!/bin/sh
. ./setEnv.sh

JAVA_OPTION="${JAVA_OPTION} -Dtangosol.coherence.management=all"
#JAVA_OPTION="${JAVA_OPTION} -Dtangosol.coherence.management.remort=true"
JAVA_OPTION="${JAVA_OPTION} -Dcom.sun.management.jmxremote.ssl=false"
JAVA_OPTION="${JAVA_OPTION} -Dcom.sun.management.jmxremote.authenticate=false"
     
     
export JAVA_OPTION

echo "JAVA_OPTION => ${JAVA_OPTION}"
echo "${JAVA_HOME}/bin/java -server -classpath ${BASEDIR}/config:${COHERENCE_HOME}/lib/coherence.jar:. ${JAVA_OPTION} -Xmx128m -Xms128m com.tangosol.net.management.MBeanConnector -http"

now=`date +%Y%m%d%H%M%S`
${JAVA_HOME}/bin/java -server -classpath ${BASEDIR}/config:${COHERENCE_HOME}/lib/coherence.jar:. ${JAVA_OPTION} -Xmx128m -Xms128m com.tangosol.net.management.MBeanConnector -http > logs/mbconnsvr_$now.log 2>&1 &
pid=$!
echo "PID => $pid"
echo "mbconnsvr_$now.log: PID $pid"
echo "mbconnsvr_$now.log: PID $pid" >> logs/StartedServerMemo.txt
echo "$pid" >> logs/ServerPIDs.txt

