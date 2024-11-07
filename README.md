
# Malandro.sh

Malandro.sh es un script de bash optimizado para realizar ataques de fuerza bruta en archivos `.kdbx` de KeePass. Utiliza **GNU Parallel** y un sistema de archivo de bloqueo para incrementar la eficiencia al intentar múltiples combinaciones de contraseñas en paralelo.

## Descripción

Este script permite intentar abrir archivos KeePass usando una lista de palabras (wordlist) en paralelo, aprovechando **GNU Parallel** para ejecutar múltiples intentos de contraseña al mismo tiempo. Gracias al uso de un archivo de bloqueo, el script se detiene en el momento en que una contraseña válida es encontrada, evitando que otros procesos continúen una vez que la clave ha sido identificada.

## Requisitos

- Sistema operativo Linux o macOS
- `keepassxc-cli` para abrir archivos KeePass desde la terminal
- `parallel` (GNU Parallel) para ejecutar comandos en paralelo

Para instalar los requisitos, usa los siguientes comandos:

```bash
sudo apt update
sudo apt install keepassxc-cli parallel
```

## Configuración

Coloca el script en una carpeta y asegúrate de tener permisos de ejecución:

```bash
chmod +x Malandro.sh
```

## Uso

Ejecuta el script de la siguiente manera:

```bash
./Malandro.sh <kdbx-file> <wordlist>
```

- `<kdbx-file>` es la ruta del archivo KeePass que deseas desbloquear.
- `<wordlist>` es la ruta del archivo que contiene la lista de contraseñas.

Ejemplo de uso:

```bash
./Malandro.sh mydatabase.kdbx common-passwords.txt
```

Al ejecutarse, el script irá probando cada línea del archivo de palabras hasta encontrar una coincidencia. Si la contraseña es encontrada, se guarda en `password_encontrada.txt`.

## Mensajes de salida

- Si la contraseña es encontrada, verás el mensaje: `Password encontrada y guardada en password_encontrada.txt`.
- Si no se encuentra ninguna coincidencia, el script mostrará `[!] Wordlist exhausted, no match found`.

## Ventajas de esta implementación

La principal ventaja de este script sobre otras implementaciones de fuerza bruta para KeePass es el uso de GNU Parallel y File Lock:

- Velocidad: Al probar contraseñas en paralelo, se reduce considerablemente el tiempo de ejecución, especialmente en listas de contraseñas extensas.
- Eficiencia: El uso de un archivo de bloqueo permite detener todos los procesos una vez que la contraseña ha sido encontrada, ahorrando tiempo y recursos.

## Licencia

Este proyecto se ha creado de manera Open-Source bajo la licencia GPL (Licencia Pública General de GNU). Esto significa que puedes copiar, modificar y distribuir el código, siempre y cuando mantengas la misma licencia y hagas público cualquier cambio que realices.

## Soporte

Si tienes alguna pregunta o encuentras algún problema con el script, no dudes en comunicarte. Cualquier sugerencia para mejorar este proyecto es siempre bienvenida.

## Créditos

Este proyecto ha sido desarrollado por Diego Martínez Fernández (@Dgmtnz) https://github.com/Dgmtnz
