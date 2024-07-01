#!/bin/bash

# Define el nombre base del comprimido final
COMPRESSED_NAME=MX360J

# Define la ruta de los saves y la ruta de destino
SAVE_DIR=~/.config/com.modrinth.theseus/profiles/Legacy\ Reborn/saves/
DEST_DIR=~/SaveGames

# Obtener la fecha actual en formato YYYYMMDD
CURRENT_DATE=$(date +"%Y%m%d")

echo "Arrancando Script..."
echo "Accediendo a ruta..."
echo ""

# Acceder a la ruta de los saves
cd "$SAVE_DIR" 2>/dev/null

echo "Comprimiendo Saves..."
# Crear el archivo comprimido con la fecha actual en el nombre
tar -czf "$COMPRESSED_NAME"_"$CURRENT_DATE".tar.gz . 2>/dev/null

echo "Moviendo Saves a destino..."
echo ""

# Mover el archivo comprimido al destino
mv "$COMPRESSED_NAME"_"$CURRENT_DATE".tar.gz "$DEST_DIR" 2>/dev/null

echo "Script completado."
