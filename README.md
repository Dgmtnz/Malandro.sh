
# Malandro.sh

Malandro.sh es un script de bash que utiliza GNU Parallel para intentar abrir una base de datos de KeepassXC con una lista de contraseñas proporcionada por el usuario. El script utiliza una función de verificación de contraseñas para intentar abrir la base de datos con cada contraseña de la lista y, si se encuentra una coincidencia, se guarda la contraseña en un archivo y se detiene el proceso.

## Descripción

El script solicita al usuario un archivo de base de datos de KeepassXC y una lista de contraseñas. Luego, utiliza GNU Parallel para leer la lista de contraseñas y intentar abrir la base de datos con cada una de ellas. Si se encuentra una coincidencia, se guarda la contraseña en un archivo y se detiene el proceso.

## Requisitos

- KeepassXC-cli instalado en el sistema
- GNU Parallel instalado en el sistema
- Un archivo de base de datos de KeepassXC
- Una lista de contraseñas

## Configuración

No se requiere configuración adicional.

## Uso

- Guarde el archivo Malandro.sh en una carpeta.
- Abra una terminal dentro de la misma carpeta.
- Ejecute el script con el siguiente comando:
```bash
./Malandro.sh <archivo_de_base_de_datos> <lista_de_contraseñas>
```
- Siga las instrucciones del script para intentar abrir la base de datos.

## Ventajas

- Utiliza GNU Parallel para acelerar el proceso de verificación de contraseñas.
- Puede manejar listas de contraseñas muy largas.

## Licencia

Este proyecto se ha creado de manera Open-Source bajo la licencia GPL (Licencia Pública General de GNU). Esto significa que puedes copiar, modificar y distribuir el código, siempre y cuando mantengas la misma licencia y hagas público cualquier cambio que realices.

## Soporte

Si tiene algún problema o duda con respecto a esta guía o al Malandro.sh, no dude en comunicarlo. Estamos aquí para ayudar y mejorar continuamente este recurso para la comunidad.

Por favor, tenga en cuenta que este proyecto se mantiene con la intención de ser un recurso útil y profesional. Cualquier contribución o sugerencia para mejorar es siempre bienvenida.

# Créditos

- Este proyecto ha sido desarrollado por Diego Martínez Fernández (@Dgmtnz) https://github.com/Dgmtnz

- Todos los enlaces proporcionados anteriormente.

- Gracias por utilizar esta guía y script de bash.
