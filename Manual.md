# Manual del Proyecto Sys-Monitor-Tool

## Introducción
Este proyecto tiene como objetivo desarrollar un conjunto de scripts en Bash para:
- Monitorear recursos del sistema (CPU, memoria, disco y red).
- Automatizar backups de directorios específicos.
- Analizar logs en busca de patrones (por ejemplo, errores).

El proyecto se gestiona de forma colaborativa usando Git y GitHub, facilitando el desarrollo modular y la integración de cada funcionalidad mediante ramas y Pull Requests.

## Instalación

### Requisitos
- **Sistema Operativo:** Linux (Ubuntu, Debian, Kali Linux, etc.).
- **Git:** Instalado en el sistema.
- **Cuenta en GitHub:** Para crear y gestionar el repositorio.

### Pasos de Instalación

1. **Instalar Git en Linux:**
   ```bash
   sudo apt update
   sudo apt install git

Crea el repositorio en GitHub (por ejemplo, "sys-monitor-tool").
Clónalo en tu máquina:
bash
Copy
Edit
git clone https://github.com/tu-usuario/sys-monitor-tool.git
cd sys-monitor-tool
Instalar Dependencias Adicionales (si es necesario):

Algunas herramientas como ifstat podrían no venir preinstaladas:
bash
Copy
Edit
sudo apt install ifstat
Descripción de los Scripts
1. Script de Monitoreo de Recursos: resource_monitor.sh
Este script captura el uso de CPU, memoria, disco y red, y guarda los datos en un archivo de log.

bash
Copy
Edit
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
Comandos Utilizados:

top: Muestra procesos y uso de CPU.
free: Muestra el uso de memoria.
df: Muestra el espacio en disco.
ifstat: Muestra estadísticas de red.
2. Script de Automatización de Backups: backup_manager.sh
Este script comprime un directorio específico y guarda el archivo comprimido en una carpeta de backups.

bash
Copy
Edit
#!/bin/bash
# Ruta del directorio a respaldar
DIRECTORIO_ORIGEN="/ruta/del/directorio"

# Carpeta destino para guardar el backup
DESTINO="/backups"

# Fecha actual para nombrar el backup de forma única
FECHA=$(date +%Y%m%d)

# Crear backup comprimido con tar y gzip
tar -czf "$DESTINO/backup_$FECHA.tar.gz" "$DIRECTORIO_ORIGEN"

echo "Backup completado: $DESTINO/backup_$FECHA.tar.gz"
Comandos Utilizados:

tar -czf: Crea un archivo comprimido con compresión gzip.
date: Obtiene la fecha actual para un nombre único.
3. Script de Análisis de Logs: log_analyzer.sh
Este script busca entradas de error en un archivo de log y extrae información relevante.

bash
Copy
Edit
#!/bin/bash
# Archivo de log a analizar
LOGFILE="/var/log/syslog"

# Archivo donde se guardarán los errores encontrados
OUTPUT="errores.log"

# Buscar la palabra "error" (sin distinguir mayúsculas/minúsculas) y extraer columnas
grep -i "error" "$LOGFILE" | awk '{print $1, $2, $3, $5}' > "$OUTPUT"

echo "Análisis completado. Los errores se han guardado en $OUTPUT."
Comandos Utilizados:

grep: Busca patrones en archivos.
awk: Extrae columnas específicas de cada línea.
(Opcionalmente, se puede usar sed para formatear el texto.)
Ejecución y Resultados
Cómo Ejecutar los Scripts
Monitoreo de Recursos:

bash
Copy
Edit
./resource_monitor.sh
Resultado: Se actualizará el archivo /var/log/system_stats.log con datos actuales del sistema.

Backup Manager:

bash
Copy
Edit
./backup_manager.sh
Resultado: Se creará un archivo comprimido en la carpeta /backups con el respaldo del directorio especificado.

Log Analyzer:

bash
Copy
Edit
./log_analyzer.sh
Resultado: Se generará el archivo errores.log con las líneas que contienen errores extraídas de /var/log/syslog.

Capturas de Pantalla y Logs
Capturas de Terminal: Incluye capturas mostrando la ejecución de cada script.
Archivos Generados: Adjunta capturas o ejemplos del contenido de /var/log/system_stats.log, el archivo de backup y errores.log.
Compatibilidad
Estos scripts han sido diseñados para funcionar en distribuciones Linux comunes, como:

Ubuntu
Debian
Kali Linux
Verifica que las herramientas utilizadas (como ifstat, tar, grep, awk) estén instaladas y sean compatibles con la distribución que utilices.

Historial de Commits y Colaboración
El proyecto se gestiona con Git y se utiliza GitHub para el trabajo colaborativo. A continuación, se describe un flujo de trabajo recomendado:

Crear Ramas para Cada Funcionalidad:

Por ejemplo, para el script de monitoreo:
bash
Copy
Edit
git checkout -b resource-monitor
Para el backup:
bash
Copy
Edit
git checkout -b backup-manager
Para el análisis de logs:
bash
Copy
Edit
git checkout -b log-analyzer
Agregar y Realizar Commits:

Ejemplo para resource_monitor.sh:
bash
Copy
Edit
git add resource_monitor.sh
git commit -m "Agregar script de monitoreo de recursos"
Subir la Rama a GitHub:

Ejemplo para la rama resource-monitor:
bash
Copy
Edit
git push origin resource-monitor
Crear un Pull Request (PR):

Ingresa a GitHub y crea un PR para fusionar la rama correspondiente (por ejemplo, resource-monitor) con la rama principal (main).
Resolución de Conflictos:

Si se presentan conflictos durante la fusión, resuélvelos manualmente:
Edita el archivo en conflicto, elimina las marcas de conflicto (<<<<<<<, =======, >>>>>>>), y selecciona los cambios a conservar.
Luego, agrega el archivo resuelto:
bash
Copy
Edit
git add archivo_en_conflicto.sh
Realiza un commit de resolución:
bash
Copy
Edit
git commit -m "Resolver conflictos en archivo_en_conflicto.sh"
Finalmente, sube los cambios:
bash
Copy
Edit
git push origin nombre-de-la-rama
Este flujo de trabajo asegura que cada funcionalidad se desarrolle de forma independiente y se integre de manera ordenada al proyecto principal
