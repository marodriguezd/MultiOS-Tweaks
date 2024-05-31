#!/bin/bash

# Verifica si se ha proporcionado un directorio como argumento
if [ -z "$1" ]; then
    echo "Por favor, proporciona un directorio."
    exit 1
fi

# Cambia al directorio especificado
cd "$1" || exit

# Encuentra todos los archivos PNG y JPEG y los convierte a WEBP
find . -type f \( -name "*.png" -o -name "*.jpeg" -o -name "*.jpg" \) | while read file; do
    # Convierte cada archivo encontrado a formato WEBP
    convert "$file" "${file%.*}.webp"
done
