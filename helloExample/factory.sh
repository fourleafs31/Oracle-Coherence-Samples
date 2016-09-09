#!/bin/sh
. ./setEnv.sh

#JAVA_OPTION="${JAVA_OPTION} -Dtangosol.coherence.cacheconfig=coherence-cache-config.xml"
#JAVA_OPTION="${JAVA_OPTION} -Dtangosol.coherence.override=../coherence-override.xml"
JAVA_OPTION="${JAVA_OPTION} -Dtangosol.coherence.distributed.localstorage=true"
#JAVA_OPTION="${JAVA_OPTION} -Djava.security.egd=file:/dev/./urandom"
#JAVA_OPTION="${JAVA_OPTION} -Dtangosol.coherence.localhost=10.185.154.11"
#JAVA_OPTION="${JAVA_OPTION} -Dtangosol.coherence.localport=18088"
#export JAVA_OPTION="${JAVA_OPTION} -Dtangosol.coherence.localport.adjust=false"

export JAVA_OPTION

echo "JAVA_OPTION => ${JAVA_OPTION}"
echo "${JAVA_HOME}/bin/java -server -classpath ${BASEDIR}/config:${COHERENCE_HOME}/lib/coherence.jar:. ${JAVA_OPTION} -Xmx128m -Xms128m com.tangosol.net.CacheFactory"

${JAVA_HOME}/bin/java -server -classpath ${BASEDIR}/config:${COHERENCE_HOME}/lib/coherence.jar:. ${JAVA_OPTION} -Xmx128m -Xms128m com.tangosol.net.CacheFactory
