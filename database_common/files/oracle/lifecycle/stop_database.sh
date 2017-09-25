#!/bin/sh
 
echo 'STOPPING DATABASE'
# shutdown can be
# abort: performs an inconsistent shutdown of the target instance
# immediate: performs an immediate, consistent shutdown of the target database
# normal: performs a consistent shutdown of the target database with normal priority
sqlplus / as sysdba << EOF
SHUTDOWN NORMAL;
EXIT;
EOF
 
echo 'STOPPING LISTENER'
lsnrctl stop
 
echo 'check'
netstat -anp|grep -e :1521 -e Local
#ps aux |grep -e PID -e orcl
