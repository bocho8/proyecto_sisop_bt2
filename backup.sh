#!/bin/bash

while true; do
  # Mostrar el menú principal
  clear
  echo "----------------------------------------"
  echo "Sistema de Backup Automático"
  echo "----------------------------------------"
  echo "1. Alta de rutas"
  echo "2. Baja de rutas"
  echo "3. Modificación de rutas"
  echo "4. Realizar Backup"
  echo "5. Consultar Backups"
  echo "6. Salir"
  echo "----------------------------------------"

  # Obtener la opción del usuario
  read -p "Seleccione una opción: " opcion

  # Procesar la opción seleccionada
  case $opcion in
    1)
      ./alta_rutas.sh
      ;;
    2)
      ./baja_rutas.sh
      ;;
    3)
      ./modificar_rutas.sh
      ;;
    4)
      ./realizar_backups.sh
      ;;
    5)
      ./consultar_backups.sh
      ;;
    6)
      echo "Saliendo del sistema..."
      exit 0
      ;;
    *)
      echo "Opción inválida. Intente nuevamente."
      ;;
  esac

  read -p "Presione Enter para continuar..."
done

