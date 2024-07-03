#!/bin/bash

# Verificar si FFmpeg está instalado
if ! command -v ffmpeg &> /dev/null; then
    echo "FFmpeg no está instalado. Por favor, instálalo y vuelve a intentar."
    exit 1
fi

# Verificar si se proporcionaron los argumentos necesarios
if [ $# -ne 2 ]; then
    echo "Uso: $0 <input> <output>"
    exit 1
fi

INPUT=$1
OUTPUT=$2

# Obtener la extensión del archivo de entrada
EXT="${INPUT##*.}"

# Función para convertir videos
convert_video() {
    ffmpeg -i "$INPUT" -c:v libx264 -crf 23 -preset medium "$OUTPUT"
}

# Función para convertir imágenes
convert_image() {
    ffmpeg -i "$INPUT" -qscale:v 10 "$OUTPUT"
}

# Detectar si el archivo de entrada es un video o una imagen
case "$EXT" in
    mp4|mkv|mov|avi|flv|wmv|webm|gif)
        echo "Detectado archivo de video. Convirtiendo..."
        convert_video
        ;;
    jpg|jpeg|png|bmp|tiff|gif)
        echo "Detectado archivo de imagen. Convirtiendo..."
        convert_image
        ;;
    *)
        echo "Tipo de archivo no compatible: $EXT"
        exit 1
        ;;
esac

echo "Conversión completada. Archivo guardado en: $OUTPUT"
