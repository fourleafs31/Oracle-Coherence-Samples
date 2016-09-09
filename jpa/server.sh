#!/bin/sh
. ./setEnv.sh

# This is JMX Server.
JAVA_OPTION="${JAVA_OPTION} -Dtangosol.coherence.management=all"
JAVA_OPTION="${JAVA_OPTION} -Dtangosol.coherence.management.remote=true"
JAVA_OPTION="${JAVA_OPTION} -Dtangosol.coherence.log.level=9"

export JAVA_OPTION

JPA_LIBS="${ORACLE_HOME}/oracle_common/modules/oracle.toplink_12.1.3/toplink-grid.jar"
JPA_LIBS="${JPA_LIBS}:${ORACLE_HOME}/oracle_common/modules/oracle.toplink_12.1.3/eclipselink.jar"
JPA_LIBS="${JPA_LIBS}:${ORACLE_HOME}/oracle_common/modules/javax.persistence_2.1.jar"

CLASSPATH="${BASEDIR}/classes:${BASEDIR}/config:${COHERENCE_HOME}/lib/coherence.jar"
CLASSPATH="${CLASSPATH}:${ORA_JDBC}:${JPA_LIBS}"

export CLASSPATH

echo "JAVA_OPTION => ${JAVA_OPTION}"
echo "CLASSPATH => ${CLASSPATH}"
echo "${JAVA_HOME}/bin/java -server -classpath ${CLASSPATH} ${JAVA_OPTION} -Xmx128m -Xms128m com.tangosol.net.DefaultCacheServer"

now=`date +%Y%m%d%H%M%S`
${JAVA_HOME}/bin/java -server -classpath ${CLASSPATH} ${JAVA_OPTION} -Xmx128m -Xms128m com.tangosol.net.DefaultCacheServer > logs/cachesvr_$now.log 2>&1 &
pid=$!
echo "PID => $pid"
echo "cachesvr_$now.log: PID $pid"
echo "cachesvr_$now.log: PID $pid" >> logs/StartedServerMemo.txt
echo "$pid" >> logs/ServerPIDs.txt

