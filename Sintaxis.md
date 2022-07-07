# Sintaxis

Este módulo tiene como propósito explicar la sintaxis básica de Apex, lo que incluye definición de variables, asignaciones, constantes, colecciones, condicionales, ciclos y manejo de excepciones.

## Variables

Las variables se pueden considerar perfectamente como el corazón de la programación, representan la materia prima, pues son al fin y al cabo las que almacenan los datos con los cuales trabajamos.
Las variables, hablando técnicamente, se entienden como un espacio en memoria cuyo periodo de vida dura lo mismo que la ejecución del programa. 

Sin embargo, explicándolo en términos más sencillos, podríamos decir que una variable es un contenedor que permite guardar un valor.

![image](https://user-images.githubusercontent.com/100179095/177684361-e557a97f-0971-4840-87cd-5716088e9e26.png)

Además, como su mismo nombre lo indica, las variables pueden cambiar su valor a lo largo de una transacción. 

## Asignación de variables

Debido a que Apex es un lenguaje de tipificación fuerte, es necesario siempre indicar el tipo de dato a la hora de definir una variable. 

Dentro de los tipos de datos que se pueden encontrar en Apex estan:

- Tipos de datos **primitivos** como: Integer, String, Boolean, Id, Date, entre otros. 
- El tipo de dato **sObject**
- El tipo de dato **Object**
- El tipo de dato **Enum**

### Datos primitivos

Para definir una variable no más basta con colocar el tipo de dato seguido del nombre de la variable. 
