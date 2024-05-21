# MultiOS-Tweaks
Este repositorio contiene configuraciones y scripts útiles para sistemas operativos Linux y Windows. Incluye archivos de configuración como `.bashrc` para Bash en Linux y configuraciones de PowerShell en Windows, entre otros.

## Contenido

- **Linux**
  - `.bashrc`: Configuración personalizada para Bash.
  - Otros scripts y configuraciones útiles.

- **Windows**
  - Configuraciones de PowerShell.
  - Otros scripts y configuraciones útiles.

## Instalación

### Linux

1. Clona este repositorio:
   ```sh
   git clone git@github.com:marodriguezd/MultiOS-Tweaks.git
   ```

2. Copia el archivo `.bashrc` a tu directorio home:
   ```sh
   cp nombre-del-repositorio/linux/.bashrc ~/
   ```

3. Recarga tu archivo `.bashrc`:
   ```sh
   source ~/.bashrc
   ```

### Windows

1. Clona este repositorio:
   ```powershell
   git clone git@github.com:marodriguezd/MultiOS-Tweaks.git
   ```

2. Copia las configuraciones de PowerShell a tu perfil:
   ```powershell
   Copy-Item -Path nombre-del-repositorio\windows\profile.ps1 -Destination $PROFILE
   ```

3. Recarga tu perfil de PowerShell:
   ```powershell
   . $PROFILE
   ```

## Contribuciones

¡Las contribuciones son bienvenidas! Siéntete libre de abrir un issue o enviar un pull request.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.
