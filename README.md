# **Taller de introducción a Bash**  

# Índice  

1. [Introducción a Bash](#1-introducción-a-bash)  
2. [Primer Hola mundo en Bash](#2-primer-hola-mundo-en-bash)
3. [¿Cómo crear el primer hola mundo?](#3-¿Cómo-crear-el-primer-hola-mundo?)


[Comandos en Bash](#comandos-en-bash)

[Referencias](#referencias)  

## **1 Introducción a Bash**
Básicamente es una interfaz de usuario de línea de comandos muy popular, específicamente es un **Shell de Unix**; así como un **lenguaje de scripting**. Originalmente fue escrito por **Brian Fox** y fue lanzado en **1989**.

**Bash es un intérprete de órdenes que generalmente se ejecuta en una ventana de texto** donde el usuario escribe órdenes en modo texto.
Al igual que todos los intérpretes de Unix, es compatible de nombres de archivos. Al igual que todos los intérpretes de Unix, es compatible con **tuberías**, **variables** y **estructuras de control**.

Existe un elemento fundamental que se ha de poner siempre en la primera línea del script, denominado ***Shebang***.

Este elemento está conformado por un par de caracteres `#!`

También es posible lanzar la ejecución de un script indicando en su ejecución qué intérprete de comandos deseamos utilizar por ejemplo: `bash script.sh`

## **2 Primer Hola mundo en Bash**

En este apartado se muestra la estructura básica que ha de tener un script en Bash.
En él se aprecian 3 apartados líneas bien diferenciadas.

1) Hace referencia al Shebang.
2) Los comentarios se indican poniendo en la primera línea una almohadilla `Alt Gr + 3`.
3) Los comandos del propio script, en este caso simplemente muestra por la terminal (salida estándar) `Hola mundo`.

```bash  
#!/bin/bash
# Comentarios
echo "Hola mundo"  
```

## **3 ¿Cómo crear el primer hola mundo?**

Para realizar el primer script debemos seguir los siguientes pasos:

1) Crear un archivo con el nombre del script y por convenio ha de terminar con la extensión `.sh`. Para ello debemos utilizar el siguiente comando: `touch <nombre del script>.sh`

2) Abrimos con cualquier editor de texto, por ejemplo `nano` que para ello se introduce el comando `nano <nombre del script>.sh`, e introducimos las líneas indicadas en el [apartado 2](#2-primer-hola-mundo-en-bash).

    En **nano**, tras haber introducido el código, debemos guardar los cambios con la combinación de teclas `Ctrl + o` y para salir pulsamos `Ctrl + x`.

3) Cambiamos los permisos del script introducción el comando: `chmod u+x ./<nombre del script>.sh`.

Estos serían los pasos fundamentales necesarios para la creación de tu primer script en Bash y tenerlo totalmente funcional, pero aún faltaría saber cómo se ha de ejecutar y para ello solo tenemos que ejecutarlo poniendo la ruta del archivo junto con su nombre: `<ruta>\<nombre del script>.sh`.

Además os dejo disponible una pequeña infografía que espero que os pueda servir de ayuda [Infografía](infografia.pdf).



















## Comandos en Bash

En este apartado se pretende ir anexando aquellos comandos que se están utilizando en cada uno de los script que vamos utilizando.