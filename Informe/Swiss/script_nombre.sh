#!/bin/bash

# Obtener la lista de archivos en la carpeta actual
archivos=$(ls -p | grep -v /)

# Guardar los nombres de los archivos en un archivo de texto
echo "$archivos" > nombres_archivos.txt

echo "Los nombres de los archivos se han guardado en 'nombres_archivos.txt'."
