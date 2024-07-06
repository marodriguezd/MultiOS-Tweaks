# Desactivar Modo Boost en Ryzen 5 4600H en Arch Linux

## Introducción

Este documento describe los pasos necesarios para desactivar permanentemente el modo boost del procesador Ryzen 5 4600H en un sistema Arch Linux. La desactivación del modo boost puede ser útil para reducir el consumo de energía y la generación de calor, especialmente en situaciones donde no se necesita el máximo rendimiento del procesador.

## Pasos para Desactivar el Modo Boost

### 1. Desactivar el Modo Boost Temporalmente

Primero, puedes desactivar el modo boost temporalmente usando el siguiente comando en la terminal:

```bash
echo "0" | sudo tee /sys/devices/system/cpu/cpufreq/boost
```

### 2. Desactivar el Modo Boost Permanentemente

Para desactivar el modo boost de forma permanente, necesitamos crear un archivo de servicio de `systemd` que ejecute el comando anterior durante el inicio del sistema.

#### Crear el Archivo de Servicio

Crea un archivo de servicio de `systemd` con el siguiente comando:

```bash
sudo nano /etc/systemd/system/disable-cpu-boost.service
```

Añade las siguientes líneas al archivo:

```ini
[Unit]
Description=Disable CPU Boost

[Service]
Type=oneshot
ExecStart=/usr/bin/bash -c 'echo "0" > /sys/devices/system/cpu/cpufreq/boost'

[Install]
WantedBy=multi-user.target
```

Guarda y cierra el archivo.

#### Recargar `systemd` y Habilitar el Servicio

Ejecuta los siguientes comandos para recargar `systemd`, habilitar el nuevo servicio y arrancarlo inmediatamente:

```bash
sudo systemctl daemon-reload
sudo systemctl enable disable-cpu-boost.service
sudo systemctl start disable-cpu-boost.service
```

## Verificación

Para verificar que el modo boost se ha desactivado correctamente, puedes ejecutar el siguiente comando y asegurarte de que el valor devuelto es `0`:

```bash
cat /sys/devices/system/cpu/cpufreq/boost
```

Si todo ha funcionado correctamente, el modo boost se desactivará automáticamente cada vez que inicies tu sistema.

## Referencias

- [Arch Linux Wiki - CPU frequency scaling](https://wiki.archlinux.org/index.php/CPU_frequency_scaling)
- [AMD Ryzen Processor and Linux Kernel Documentation](https://www.kernel.org/doc/html/latest/admin-guide/pm/cpufreq.html)

