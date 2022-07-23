# Sintaxis

Este módulo tiene como propósito explicar la sintaxis básica de Apex, lo que incluye:

- [Definición y asignación de variables](https://github.com/XSawdarkX/Curiosidades-Apex/edit/main/Sintaxis_Variables.md) 
- [Constantes](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Constantes.md)
- [Comentarios](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Constantes.md)
- [Mensajes de depuración](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Constantes.md)
- [Colecciones](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Colecciones.md)
- [Condicionales](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Condicionales.md)
- Ciclos
- [Manejo de excepciones](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Excepciones.md)
- [Definición de clases y métodos](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_ClasesMetodos.md)

## Clases

Una clase, partiendo de la base del paradigma Orientado a objetos, se podría definir como una plantilla o molde, bajo el cual se pueden crear objetos. Una clase
consta de propiedades/atributos, y métodos. 

Para definir una clase se usa la siguiente sintaxis básica:

[Modificador de acceso] Class [Nombre de la clase] {}


```Apex
public class Vehiculo {

}
```

También se puede definir una clase dentro de otra, las clases internas son conocidas como **inner Class**, mientras que las clases principales suelen llamarse **top-level class**.

```Apex
public class Vehiculo {

    class Motor{
        
    }
}
```

Es importante tener presente que las top-level class solo pueden usar los modificadores de acceso Public y Global. Mientras que las inner Class pueden usar también el modificador Private. 

No es necesario indicar el modificador de acceso en las inner Class, ya que por defecto tienen un valor de Private. Además, solo se permite un nivel de profundidad, es decir, no puedo crear una inner Class dentro de otra inner Class. 

Si una inner Class es definida como Global, la clase principal también debe serlo. 

### Modificadores de Acceso 

## Referencias

1. [ReferOne]()
