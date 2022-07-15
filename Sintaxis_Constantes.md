# Sintaxis

Este módulo tiene como propósito explicar la sintaxis básica de Apex, lo que incluye:

- [Definición y asignación de variables](https://github.com/XSawdarkX/Curiosidades-Apex/edit/main/Sintaxis_Variables.md) 
- Constantes
- Comentarios
- Mensajes de depuración
- [Colecciones](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Colecciones.md)
- [Condicionales](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Condicionales.md)
- [Ciclos](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Ciclos.md)
- [Manejo de excepciones](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Excepciones.md)
- [Definición de clases y métodos](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_ClasesMetodos.md)

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

Los mensajes de depuración permiten imprimir valores y cadenas de texto con el fin de probar y encontrar errores dentro del código. Estos mensajes son invisibles de cara al usuario final. 

Para definir un mensaje de depuración en Apex, se usa el método **debug()** de la clase estándar **System**.

```Apex
Integer edad = 15;
System.debug('Mi edad es: '+edad);
``` 
También es posible especificar el nivel de depuración bajo el cual se quiere mostrar el mensaje, si bien este es un tema que se tratara con más detalle en otro modulo, 
el nivel de depuración me indica la cantidad de información que quiero visualizar sobre una determinada categoría, como el código Apex. 

Para definir el nivel de depuración se hace uso del Enum estándar **LoggingLevel**

```Apex
Integer edad = 15;
System.debug(logginglevel.INFO,'Mi edad es: '+edad);
``` 
### Niveles de depuración

![image](https://user-images.githubusercontent.com/100179095/178518876-911e25ae-25c2-4e0c-bc62-e324bd94afac.png)

## Referencias

1. [Constantes](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_constants.htm)
2. [Comentarios](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_expressions_comments.htm)
3. [Clase System](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_system.htm)
4. [Niveles de depuración](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_enum_System_LoggingLevel.htm)







