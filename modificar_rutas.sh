#!/bin/bash

# Solicitar el ID de la ruta a modificar
read -p "Ingrese el ID de la ruta a modificar: " id_ruta

# Solicitar la nueva ruta al usuario
read -p "Ingrese la nueva ruta: " nueva_ruta

# Validar la nueva ruta (debe tener entre 5 y 255 caracteres y existir)
if [[ ${#nueva_ruta} -ge 5 && ${#nueva_ruta} -le 255 && -d "$nueva_ruta" ]]; then
  # Actualizar la ruta en el archivo rutas_backup.txt
  sed -i "s/^$id_ruta:.*/$id_ruta:$nueva_ruta/" rutas_backup.txt

  # Registrar la acción en el archivo de log
  echo "$(date +"%Y-%m-%d %H:%M:%S") - Modificación de ruta: ID $id_ruta a $nueva_ruta" >> backup_log.txt

  echo "Ruta con ID $id_ruta modificada correctamente."
else
  echo "Error: La nueva ruta ingresada no es válida."
fi

