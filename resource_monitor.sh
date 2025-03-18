#!/bin/bash
LOGFILE="/var/log/system_stats.log"

echo "Fecha: $(date)" >> $LOGFILE
echo "Uso de CPU:" >> $LOGFILE
top -b -n1 | head -n 5 >> $LOGFILE

echo "Uso de Memoria:" >> $LOGFILE
free -h >> $LOGFILE

echo "Espacio en Disco:" >> $LOGFILE
df -h >> $LOGFILE

echo "Estadísticas de Red:" >> $LOGFILE
ifstat -t >> $LOGFILE

echo "--------------------------" >> $LOGFILE

