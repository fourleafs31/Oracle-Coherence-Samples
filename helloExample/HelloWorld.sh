#!/bin/sh
. ./setEnv.sh

JAVA_OPTION="${JAVA_OPTION} -Dtangosol.coherence.distributed.localstorage=true"

export JAVA_OPTION

echo "JAVA_OPTION => ${JAVA_OPTION}"
echo "${JAVA_HOME}/bin/java -server -classpath ${BASEDIR}/classes:${BASEDIR}/config:${COHERENCE_HOME}/lib/coherence.jar:. ${JAVA_OPTION} -Xmx128m -Xms128m com.examples.HelloWorld"

${JAVA_HOME}/bin/java -server -classpath ${BASEDIR}/classes:${BASEDIR}/config:${COHERENCE_HOME}/lib/coherence.jar:. ${JAVA_OPTION} -Xmx128m -Xms128m com.examples.HelloWorld
pid=$!
echo "PID => $pid"
