#!/bin/sh
. ./setEnv.sh

JAVA_OPTION="${JAVA_OPTION} -Dtangosol.coherence.management=all"
JAVA_OPTION="${JAVA_OPTION} -Dtangosol.coherence.management.remort=true"

#JAVA_OPTION="${JAVA_OPTION} -Dtangosol.coherence.cacheconfig=coherence-cache-config.xml"
#JAVA_OPTION="${JAVA_OPTION} -Dtangosol.coherence.override=../coherence-override.xml"
#JAVA_OPTION="${JAVA_OPTION} -Dtangosol.coherence.distributed.localstorage=true"
#JAVA_OPTION="${JAVA_OPTION} -Djava.security.egd=file:/dev/./urandom"
#JAVA_OPTION="${JAVA_OPTION} -Dtangosol.coherence.localhost=10.185.154.11"
#JAVA_OPTION="${JAVA_OPTION} -Dtangosol.coherence.localport=18088"
#export JAVA_OPTION="${JAVA_OPTION} -Dtangosol.coherence.localport.adjust=false"

export JAVA_OPTION

echo "JAVA_OPTION => ${JAVA_OPTION}"
echo "${JAVA_HOME}/bin/java -server -classpath ${BASEDIR}/config:${COHERENCE_HOME}/lib/coherence.jar:. ${JAVA_OPTION} -Xmx128m -Xms128m com.tangosol.net.DefaultCacheServer"

now=`date +%Y%m%d%H%M%S`
${JAVA_HOME}/bin/java -server -classpath ${BASEDIR}/config:${COHERENCE_HOME}/lib/coherence.jar:. ${JAVA_OPTION} -Xmx128m -Xms128m com.tangosol.net.DefaultCacheServer > logs/cachesvr_$now.log 2>&1 &
pid=$!
echo "PID => $pid"
echo "cachesvr_$now.log: PID $pid"
echo "cachesvr_$now.log: PID $pid" >> logs/StartedServerMemo.txt
echo "$pid" >> logs/ServerPIDs.txt

