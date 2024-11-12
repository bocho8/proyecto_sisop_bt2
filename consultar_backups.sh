#!/bin/bash

# Solicitar al usuario el ID de la ruta o parte del nombre del archivo
read -p "Ingrese el ID de la ruta o parte del nombre del archivo: " busqueda

# Buscar backups en registro_backups.txt [2, 3]
grep "$busqueda" rutas_backup.txt

