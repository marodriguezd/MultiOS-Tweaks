# Guía para Configurar el Cursor "Breeze Light" en Pop!_OS

Esta guía te ayudará a configurar el cursor "Breeze Light" de manera que se aplique consistentemente en todas las aplicaciones en Pop!_OS.

## Paso 1: Verificar la Ubicación del Tema

Asegúrate de que el tema "Breeze Light" está ubicado en `/usr/share/icons`.

```bash
sudo mv ~/Descargas/Breeze-Light /usr/share/icons/
```

## Paso 2: Configurar el archivo `index.theme`

### Editar `index.theme` de Breeze Light

Ve a la carpeta del tema y edita el archivo `index.theme`:

```bash
sudo nano /usr/share/icons/breeze\ light/index.theme
```

Asegúrate de que el contenido sea similar a esto:

```plaintext
[Icon Theme]
Name=Breeze Light
Comment=Light version of Breeze cursor theme
Inherits=default
```

### Editar `~/.icons/default/index.theme`

Crea o edita el archivo `index.theme` en `~/.icons/default/`:

```bash
mkdir -p ~/.icons/default
nano ~/.icons/default/index.theme
```

Añade el siguiente contenido:

```plaintext
[Icon Theme]
Inherits=Breeze Light
```

## Paso 3: Configurar GTK y X Resources

### Editar `~/.config/gtk-3.0/settings.ini`

Abre o crea el archivo `settings.ini` en `~/.config/gtk-3.0/`:

```bash
mkdir -p ~/.config/gtk-3.0
nano ~/.config/gtk-3.0/settings.ini
```

Añade la siguiente línea en la sección `[Settings]`:

```plaintext
gtk-cursor-theme-name=Breeze Light
```

### Editar `~/.Xresources`

Abre o crea el archivo `~/.Xresources` y añade la configuración para el tema de cursor:

```bash
nano ~/.Xresources
```

Añade la siguiente línea:

```plaintext
Xcursor.theme: Breeze Light
```

### Editar `~/.profile`

Abre o crea el archivo `~/.profile` y asegúrate de que la configuración del cursor se cargue al iniciar sesión:

```bash
nano ~/.profile
```

Añade la siguiente línea:

```plaintext
export XCURSOR_THEME="Breeze Light"
```

## Paso 4: Aplicar Cambios

### Recargar `.Xresources`

```bash
xrdb ~/.Xresources
```

### Reiniciar GNOME Shell

Para aplicar los cambios, presiona `Alt + F2`, escribe `r` y presiona Enter. Si esto no funciona, reinicia tu sistema.

## Paso 5: Configuración Adicional para Steam

### Editar las Opciones de Lanzamiento de Steam

- Abre Steam.
- Ve a "Biblioteca".
- Haz clic derecho en un juego y selecciona "Propiedades".
- En el campo "Opciones de lanzamiento", añade:

```plaintext
XCURSOR_THEME="Breeze Light" %command%
```

## Verificar los Cambios

Abre varias aplicaciones, incluyendo Steam y algunos juegos, para verificar que el cursor ha cambiado en todas ellas.

## Documentación Adicional

Para más detalles sobre la personalización de Pop!_OS, consulta la [documentación oficial de Pop!_OS sobre GNOME Tweaks](https://pop-os.github.io/docs/customize-pop/gnome-tweaks-extensions/gnome-tweaks.html).
