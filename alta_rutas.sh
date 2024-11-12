#!/bin/bash

# Obtener el último número autogenerado del archivo rutas_backup.txt
ultimo_numero=$(tail -n 1 rutas_backup.txt | cut -d: -f1)

# Incrementar el número autogenerado
nuevo_numero=$((ultimo_numero + 1))

# Solicitar la ruta al usuario
read -p "Ingrese la ruta a respaldar: " ruta

# Validar la ruta (debe tener entre 5 y 255 caracteres y existir)
if [[ ${#ruta} -ge 5 && ${#ruta} -le 255 && -d "$ruta" ]]; then
  # Agregar la nueva ruta al archivo rutas_backup.txt
  echo "$nuevo_numero:$ruta" >> rutas_backup.txt

  # Registrar la acción en el archivo de log
  echo "$(date +"%Y-%m-%d %H:%M:%S") - Alta de ruta: $ruta (ID: $nuevo_numero)" >> backup_log.txt

  echo "Ruta agregada correctamente con ID: $nuevo_numero"
else
  echo "Error: La ruta ingresada no es válida."
fi


