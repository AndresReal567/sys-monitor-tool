#!/bin/bash
DIRECTORIO_ORIGEN="/home/andresrojas4801/sys-monitor-tool"
DESTINO="/backups"
FECHA=$(date +%Y%m%d)

tar -czf "$DESTINO/backup_$FECHA.tar.gz" "$DIRECTORIO_ORIGEN"
