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
