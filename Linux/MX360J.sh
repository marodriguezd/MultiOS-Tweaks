#!/bin/bash
echo "Arrancando Script..."
echo "Accediendo a ruta..."
echo ""
cd ~/.config/com.modrinth.theseus/profiles/Legacy Reborn/saves/ 2>/dev/null
echo "Comprimiendo Saves..."
tar -czf MX360J_Ver_X.tar.gz . 2>/dev/null
echo "Moviendo Saves a destino..."
echo ""
mv MX360J_Ver_X.tar.gz ~/SaveGames 2>/dev/null
echo "Script completado."
