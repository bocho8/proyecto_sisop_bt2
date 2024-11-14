#!/bin/bash

# Obtener la fecha actual en el formato personalizado
fecha=$(date +"%d-%m-%Y_%H-%M-%S")

# Verificar si el directorio backups/ existe. Si no existe, crearlo.
if [ ! -d "backups" ]; then
  mkdir backups
fi

# Recorrer el archivo rutas_backup.txt
while read linea; do
  id_ruta=$(echo "$linea" | cut -d: -f1)
  ruta=$(echo "$linea" | cut -d: -f2)

  # Crear el nombre del archivo de backup
  nombre_backup="backup_${id_ruta}_$fecha.tar.gz"

  # Comprimir el contenido del directorio actual en un archivo .tar.gz 
  tar -Pczf "./backups/$nombre_backup" "$ruta" 

  # Registrar el backup en registro_backups.txt
  echo "$id_ruta:$nombre_backup:$fecha" >> registro_backups.txt

  # Registrar la acción en el archivo de log
  echo "$(date +"%Y-%m-%d %H:%M:%S") - Backup realizado: $nombre_backup" >> backup_log.txt
done < rutas_backup.txt

echo "Backups realizados correctamente."

