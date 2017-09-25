#!/bin/sh
 
echo 'STARTING LISTENER'
lsnrctl start
 
echo 'STARTING DATABASE'
sqlplus / as sysdba << EOF
STARTUP;
EXIT;
EOF
 
echo 'check'
netstat -anp|grep -e :1521 -e Local
#ps aux |grep -e PID -e orcl
