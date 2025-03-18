#!/bin/bash
LOGFILE="/var/log/syslog"
OUTPUT="errores.log"

# Buscar líneas que contengan la palabra "error" (no sensible a mayúsculas)
grep -i "error" $LOGFILE | awk '{print $1, $2, $3, $5}' > $OUTPUT

echo "Análisis completado. Los errores se encuentran en $OUTPUT."
