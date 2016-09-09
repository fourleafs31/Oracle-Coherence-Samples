#!/bin/sh
. ./setEnv.sh

JAVA_OPTION="${JAVA_OPTION} -Dtangosol.coherence.cacheconfig=jpa-cache-config.xml"
JAVA_OPTION="${JAVA_OPTION} -Dtangosol.coherence.distributed.localstorage=false"

export JAVA_OPTION

JPA_LIBS="${ORACLE_HOME}/oracle_common/modules/oracle.toplink_12.1.3/toplink-grid.jar:${ORACLE_HOME}/oracle_common/modules/oracle.toplink_12.1.3/eclipselink.jar:${ORACLE_HOME}/oracle_common/modules/javax.persistence_2.1.jar"

CLASSPATH="${BASEDIR}/classes:${BASEDIR}/config:${COHERENCE_HOME}/lib/coherence.jar"
CLASSPATH="${CLASSPATH}:${ORA_JDBC}:${JPA_LIBS}"

export CLASSPATH

echo "JAVA_OPTION => ${JAVA_OPTION}"
echo "CLASSPATH => ${CLASSPATH}"
echo "${JAVA_HOME}/bin/java -server -classpath ${CLASSPATH} ${JAVA_OPTION} -Xmx128m -Xms128m com.oracle.handson.RunEmpGetAll"

${JAVA_HOME}/bin/java -server -classpath ${CLASSPATH} ${JAVA_OPTION} -Xmx128m -Xms128m com.oracle.handson.RunEmpGetAll
pid=$!
echo "PID => $pid"
