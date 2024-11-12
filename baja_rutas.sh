#!/bin/bash

# Solicitar el ID de la ruta a eliminar
read -p "Ingrese el ID de la ruta a eliminar: " id_ruta

# Eliminar la línea correspondiente al ID del archivo rutas_backup.txt
sed -i "/^$id_ruta:/d" rutas_backup.txt

# Registrar la acción en el archivo de log
echo "$(date +"%Y-%m-%d %H:%M:%S") - Baja de ruta: ID $id_ruta" >> backup_log.txt

echo "Ruta con ID $id_ruta eliminada correctamente."

