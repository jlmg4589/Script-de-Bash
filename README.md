
# Índice  
[Taller de introducción a Bash](#taller-de-introducción-a-bash)
1. [Introducción a Bash](#1-introducción-a-bash)  
2. [Estructura básica de un script](#2-estructura-básica-de-un-script)
3. [¿Cómo crear el primer hola mundo?](#3-¿cómo-crear-el-primer-hola-mundo)
4. [Introducción de variables en Bash](#4-introducción-de-variables-en-bash)

    4.1. [Ámbito de una variable](#41-ámbito-de-una-variable)
    
    4.2. [Variables de entorno](#42-variables-de-entorno)
    
    4.3. [Variables especiales de un script](#43-variables-especiales-de-un-script)
    
    4.4. [Asignación del resultado de un comando a una función](#44-asignación-del-resultado-de-un-comando-a-una-función)
    
    4.5. [Comillas en Bash](#45-comillas-en-bash)

5. [Operaciones artiméticas](#5-operaciones-aritméticas)

6. [Lógica](#6-lógicas)

*. [Comandos en Bash](#comandos-en-bash)

<!-- [Referencias](#referencias)-->  

# **Taller de introducción a Bash** 

## **1. Introducción a Bash**
Básicamente es una interfaz de usuario de línea de comandos muy popular, específicamente es un **Shell de Unix**; así como un **lenguaje de scripting**. Originalmente fue escrito por **Brian Fox** y fue lanzado en **1989**.

**Bash es un intérprete de órdenes que generalmente se ejecuta en una ventana de texto** donde el usuario escribe órdenes en modo texto.
Al igual que todos los intérpretes de Unix, es compatible de nombres de archivos. Al igual que todos los intérpretes de Unix, es compatible con **tuberías**, **variables** y **estructuras de control**.

Existe un elemento fundamental que se ha de poner siempre en la primera línea del script, denominado ***Shebang***. Este elemento está conformado por un par de caracteres `#!`

También es posible lanzar la ejecución de un script indicando en su ejecución qué intérprete de comandos deseamos utilizar por ejemplo: `bash script.sh`

## **2. Estructura básica de un script**

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

## **3. ¿Cómo crear el primer hola mundo?**

Para realizar el primer script debemos seguir los siguientes pasos:

1) Crear un archivo con el nombre del script y por convenio ha de terminar con la extensión `.sh`. Para ello debemos utilizar el siguiente comando: `touch <nombre del script>.sh`

2) Abrimos con cualquier editor de texto, por ejemplo `nano` que para ello se introduce el comando `nano <nombre del script>.sh`, e introducimos las líneas indicadas en el [apartado 2](#2-primer-hola-mundo-en-bash).

    En **nano**, tras haber introducido el código, debemos guardar los cambios con la combinación de teclas `Ctrl + o` y para salir pulsamos `Ctrl + x`.

3) Cambiamos los permisos del script introducción el comando: `chmod u+x ./<nombre del script>.sh`.

Estos serían los pasos fundamentales necesarios para la creación de tu primer script en Bash y tenerlo totalmente funcional, pero aún faltaría saber cómo se ha de ejecutar y para ello solo tenemos que ejecutarlo poniendo la ruta del archivo junto con su nombre: `<ruta>\<nombre del script>.sh`.

Además os dejo disponible una pequeña infografía que espero que os pueda servir de ayuda [Infografía](Infografia.pdf).

## **4. Introducción de variables en Bash**

Aquí te mostraré cómo se ha de realizar una asignación a una variable en Bash. En primera instancia, vamos a aprender para qué sirve una variable.

Una variable es el nombre que el damos a una dirección de memoria para que podamos utilizarlo en nuestro programa tan solo referenciando sobre su nombre, de esta forma podemos actualizar su valor en cualquier momento durante la ejecución de nuestro programa. Esta es una idea muy superficial sobre el concepto de una variable. Básicamente, un símil a lo mencionado sería el coger una caja y establecerle un nombre ej. `numero` y dentro de esta caja, en cualquier momento podemos introducir cualquier objeto en su interior y podemos además, bien intercambiar el objeto o incluso sacarlo y dejar la caja vacía.

En Bash cuando empezamos a utilizar una variable, si no le asignamos ningún valor, por defecto está vacía, además, todas las variables se consideran texto aunque para nosotros sean números, de hecho cuando queremos realizar un cálculo en Bash debemos indicarlo con una sintaxis especial (que se verá más adelante).

A continuación se indica la sintaxis de las variables para diferentes casuísticas.

1) Asignación de una variable.

    ```bash  
    # Asignamos "Hola" a la variable1
    variable1=Hola
    ```
    Es muy importante ser muy riguroso en la sintaxis, p. ej. introducir un espacio entre alguno de los elementos en la asignación provocaría un error.

2) Consultar el valor de una variable.

    ```bash  
    # Muestra en pantalla el valor de la variable asignada anteriormente.
    echo $variable1
    ```

    Lo importante de este caso es que debemos de anteponer un `$` a la variable para poder acceder a ella.

    Enlace a explicación del comando [echo](#51-comando-echo)

3) Asignar el valor de una variable a otra variable.

    ```bash
    variable2=$variable1
    ```
    El valor que inicialmente estaba en la `variable1` ahora está también en la `variable2`.

### 4.1. Ámbito de una variable

Las variables en Bash de forma predeterminada son globales y por tanto, si queremos tener una variable que esté definida de forma local, debemos definirla como `local`

Este aspecto no es crucial por ahora, pero sí que hay que tenerlo en cuenta sobre todo cuando empecemos a utilizar funciones, ya que puede que nos interese utilizar el nombre de una variable que ya existe previamente en otra parte del código, y al definirla como `local` dentro de una función, podemos crear un nuevo ámbito para ella.

A continuación, te muestro un pequeño ejemplo de lo mencionado.

```bash
#!/bin/bash

saludo=hola

funcion(){
   local saludo=hello
   echo "Variable saludo dentro de la función: $saludo"
}

echo "Variable saludo fuera de la función: $saludo"
funcion # ejecución de la función
```
Resultado de la ejecución del script.

![imagLocal1](/Imagenes/local-salida.png)

### 4.2. Variables de entorno

Existen una serie de variables que están definidas por defecto en nuestro sistema Linux y que según el entorno en el que se esté trabajando sus valores tendrán unos valores y otros. 
Por ejemplo, es fácil pensar que las variables del sistema de las que estamos hablando, no deben ser las mismas si iniciamos sesión con un usuario que con otro, no?

Dicho esto, podemos destacar las siguientes:

* `$SHELL`: indica el shell que se está ejecutando.
* `$EDITOR`: indica el editor utilizado por defecto.
* `$HOME`: ruta donde se almacena el perfil del usuario.
* `$USEERNAME`: nombre de usuario.

### 4.3. Variables especiales de un script

En Bash existen además unas variables que están definidas o dispuestas a ser usadas por el usuario ante la ejecución de cualquier script (ya que realmente se crean al crear un nuevo proceso).

Podemos destacar:

* `$0`: nos dice el nombre del script.
* `$1` - `${10}`: los primeros diez argumentos de entrada, indicar que pueden ser más de diez pero cuando queremos acceder a un argumento de entrada con más de un dígito debemos de meterlo entre llaves `{}`.
* `$#`: indica el número de argumentos pasados al script.
* `$@`: representa a todos los argumentos pasados al script.
* `$?`: hace referencia a la salida del último proceso ejecutado.
* `$$`: el ID del proceso del script.
* `$RANDOM`: devuelve un número aleatorio cada vez que se lee esta variable.

### 4.4. Obtener el resultado de un comando

Cuando queremos guardar el resultado de la ejecución de un comando, tenemos que meter el comando dentro de paréntesis `()` y preceder los paréntesis con `$`, tal como `$(<comando>)`.

Por ejemplo.

```bash
directorios=$(ls)
```
Nota: al asignar la salida de un comando en una variable, la información que se almacena no es igual que la que muestra el comando si lo ejecutamos directamente.
![imagComando1](/Imagenes/comandos-salida.png)

### 4.5. Comillas en Bash

Este apartado es muy importante, ya que en Bash las comillas juegan un papel relevante.

Cuando entrecomillamos con comillas simples `''` lo que hacemos es decirle al intérprete que toda la información que contiene ha de ser interpretada de forma literal. Sin embargo, con las comillas dobles `""` lo que ocurre es que si tenemos por ejemplo una variable dentro de las comillas, se sustituye el texto que la identifica por su valor.

Por ejemplo:

1. Asignar a una variable más de una palabra.
    
    Para delimitar qué cantidad de información pertenece a una variable, tenemos dos formas análogas, una con comillas simples `''` y otra con comillas dobles `""`.
    ```bash
    saludo1='Hola mundo'
    saludo2="Hasta pronto"
    ```
    Si hacemos un `echo` con cada uno de las variables, obtendremos toda la información que la contiene, pero se ha de hacer con comillas dobles (como e indica a continuación).

2. Mostrar el valor de una variable.

    Si intentamos mostrar el valor de una variable utilizando entrecomillado simple, tal como:

    ```Bash
    echo '$saludo1, encantado de conoceros, $saludo2'
    ```
    Obtendremos:

    ![imagComillas1](/Imagenes/comillas-salida1.png)

    Si hacemos un entrecomillado doble, tal como:

    ```Bash
    echo "$saludo1, encantado de conoceros, $saludo2"
    ```

    Obtenemos:

    ![imagComillas2](/Imagenes/comillas-salida2.png)

## 5. Operaciones aritméticas

En Bash podemos realizar operaciones aritméticas con números enteros de forma nativa. Para ello debemos utilizar la siguiente combinación de símbolos `$(())`, e introducir dentro alguno de los siguientes operadores:

* `+`: Suma `$((25+2))` (Resultado: `27`).
* `-`: Resta `$((25-2))` (Resultado: `23`).
* `*`: Multiplicación `$((25*2))` (Resultado: `50`).
* `/`: División `$((25/2))` (Resultado: `12`).
* `%`: Resto `$((25%2))` (Resultado: `1`).

Tal y como se ha comentado anteriormente, estas operaciones únicamente son válidas si queremos hacer operaciones con números enteros, pero si queremos realizar operaciones con números reales podemos utilizar el comando `bc`

Ejemplo:
```bash
echo "25.2*3.32" | bc
```

Obtenemos:

![imagbc1](/Imagenes/bc-salida.png)

En nuestro caso vamos a utilizar para realizar este tipo de cálculos, aunque a priori sea más tedioso, `python` al ser un lenguaje de programación completo, podremos realizar cualquier tipo de operación, aún más si utilizamos el módulo `math`.

Comprobación y resultado:

![imagpy1](/Imagenes/python3-1.png)

Como vemos en el resultado obtenido tiene muchos decimales, por tanto tenemos que controlar este hecho para que la salida sea la deseada. Para solucionar esta cuestión, debemos poner el comando con `"{}".format()` que nos ayudará a establecer el formato deseado.

En el siguiente ejemplo se indica que la salida de la operación sea de tipo `float` y que queremos dos decimales detrás de la coma. Esto se indica cuando poniendo `"{:.2f}.format(<operación o variable>)"`, el `2` indica los decimales ya que está puesto tras el `.` y la `f` (float) nos indica el tipo de dato.

![imagpy2](/Imagenes/python3-2.png)

Más información: [enlace](https://www2.eii.uva.es/fund_inf/python/notebooks/03_E_S/Entrada_salida.html) 

## 6. Lógicas

La utilidad de estas operaciones es saber si una consulta es cierta o no. Para ello podemos utilizar la orden `test` o delimitar la comprobación entre corchetes `[]`.

De tal forma, serían compatibles tanto la expresión `test 1 -lt 2` que `[ 1 -lt 2 ]`, **cuidado con los espacios** que hay tras y después de los corchetes, son **obligatorios**.

### Comprobaciones sobre cadenas y números.

| Cadena | Numérico | Descripción |
| :---: | :---: | :---: |
| x = y | x -eq y | **x** es igual que **y** |
| x != y | x -ne y | **x** es distinto que **y** |
| x < y | x -lt y | **x** es menor que **y** |
| - | x -le y | **x** es menor o igual que **y** |
| x > y | x -gt y | **x** es mayor que **y** |
| - | x -ge y | **x** es mayor o igual que **y** |
| -nx | - | **x** es no nulo |
| -zx | - | **x** es nulo |

### Comprobaciones sobre ficheros y directorios.

| Operador | Descripción |
| :---: | :---: |
| -d RUTA | Cierto si la RUTA existe y es un directorio. |
| -e RUTA | Cierto si la RUTA existe sea el elemento que sea. |
| -f RUTA | Cierto si la RUTA existe y es un archivo. |
| -r RUTA | Cierto si la RUTA existe y se puede leer. |
| -w RUTA | Cierto si la RUTA existe y se puede escribir. |
| -x RUTA | Cierto si la RUTA existe y se puede ejecutar. |
| -s RUTA | Cierto si la RUTA existe y su tamaño es mayor que cero (no está vacío). |

### Operadores lógicos.

| Operador [  ] | Operador [[ ]] | Descripción |
| :---: | :---: | :---: |
| !EXPRESIÓN | !EXPRESIÓN | NEGACIÓN: cierto si la EXPRESIÓN es falsa. |
| EXPRESIÓN1 -a EXPRESIÓN2 | EXPRESIÓN1 && EXPRESIÓN2 | AND: cierto si ambas EXPRESIONES son ciertas. |
| EXPRESIÓN1 -o EXPRESIÓN2 | EXPRESIÓN1 \|\| EXPRESIÓN2 | OR: cierto si una de las dos EXPRESIONES son ciertas. | 

### 6.1. Condicionales: id then else

Las condicionales en Bash se materializan con `if then else elif fi` y con `case esac`. Independientemente de uno u otro, consiste en resolver una cuestión final de una comparación.

#### 6.1.1 if
A continuación se muestra un ejemplo en el que se indica una comparación para saber cuál de los argumentos de entrada `1` o `2` es mayor y si son iguales.

```Bash
#!/bin/bash

if test $1 -gt $2
then
    echo "La variable de entrada 1 es mayor."
elif test $1 -eq $2
then
    echo "Las variables de entrada son idénticas."
else
    echo "La variable de entrada 2 es mayor."
fi
```
o
```Bash
#!/bin/bash

if [[ $1 -gt $2 ]]
then
    echo "La variable de entrada 1 es mayor."
elif [[ $1 -eq $2 ]]
then
    echo "Las variables de entrada son idénticas."
else
    echo "La variable de entrada 2 es mayor."
fi
```

Donde en ambos casos se obtiene como resultado: 

![imagif1](/Imagenes/if.png)

#### 6.1.2 case

En el caso de que se desee comparar diversos supuestos y que no se convierta en algo muy tedioso, podremos usar `case` que nos ayudará a que nuestro código sea más legible.

La sintaxis será:

```Bash
#!/bin/bash

case <expresión> in
    <patrón 1>)
        comandos
        ;;
    <patrón 2>)
        comandos
        ;;
    *)
        comandos
        ;;
esac
```

## Comandos en Bash

En este apartado se pretende ir anexando aquellos comandos que se están utilizando en cada uno de los script que vamos utilizando.

### 1. Comando echo

En Linux, se utiliza para imprimir por la salida estándar, la pantalla por defecto, el texto introducido al comando `echo`.

**Ejemplo sintáctico**: 
```bash  
echo "Hola mundo"
```

**Salida del comando**:

   ![imagEcho1](/Imagenes/echo-salida.png)
