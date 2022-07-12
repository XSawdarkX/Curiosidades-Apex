# Sintaxis

Este módulo tiene como propósito explicar la sintaxis básica de Apex, lo que incluye:

- [Definición y asignación de variables]() 
- Constantes
- Comentarios
- Mensajes de depuración
- [Colecciones]()
- [Condicionales]()
- [Ciclos]()
- [Manejo de excepciones]()
- [Definición de clases y métodos]()

## Constantes

Las contantes son elementos que permiten almacenar un valor que no cambia en el trascurso de la ejecución. Un claro ejemplo para usar una contante es el valor de **PI** cuando se desean hacer operaciones aritméticas. 

Para definir una constante se usa la siguiente sintaxis:

[Scope][final][Tipo de dato][nombre de la constante];

```Apex
final Decimal PI = 3.14;
``` 

Una vez se le asigna un valor a una constante, este ya no se puede cambiar. Además, al igual que los Enum, aunque no es obligatorio, se recomienda llamar a las constantes en mayúscula. 

## Comentarios

Los comentarios son líneas de texto dentro del código, que el compilador ignora. Generalmente se usan para documentar la funcionalidad de nuestra lógica. 

Aunque muchas veces se diga que un código bien escrito se puede leer por sí mismo, no está de más colocar algunos comentarios específicos que permitan aclarar ciertas partes de nuestro proceso. También se usan para anular momentáneamente parte del código. 

Al igual que en otros lenguajes de programación, Apex permite comentarios de una o varias líneas.

```Apex
//Este es un comentario de una línea

/*
Este es 
un comentario
de varias líneas
*/
``` 
## Mensajes de depuración




