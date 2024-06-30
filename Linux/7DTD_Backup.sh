#!/bin/bash
echo "Arrancando Script..."
echo "Accediendo a ruta..."
echo ""
cd /home/marodrigued/.local/share/Steam/steamapps/compatdata/251570/pfx/drive_c/users/steamuser/AppData/Roaming/7DaysToDie/Saves
echo "Comprimiendo Saves..."
tar -czf 7DTD_Saves_Backup_Day_X.tar.gz . 2>/dev/null
echo "Moviendo Saves a destino..."
echo ""
mv 7DTD_Saves_Backup_Day_X.tar.gz /home/marodrigued/SaveGames
echo "Script completado."
