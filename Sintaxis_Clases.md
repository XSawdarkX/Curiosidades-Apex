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

### Variables y Métodos

Las variables, como se explicó en su modulo, son elementos que nos permiten guardar información. Estos se definen siguiendo la siguiente sintaxis:

[Modificador de acceso] [Tipo de dato] nombre de la variable;

```Apex
private Integer edad; 
```

Los métodos por su lado pueden entenderse como un bloque que recibe unos elementos de entrada llamados **Parámetros**, y retorna un resultado.

La sintaxís para crear un método es:

[modificador de acceso] [Tipo de dato de retorno] nombre del método (Parametro1, Parametro2,..){código}

```Apex
public Integer getEdad() { 
     return edad; 
}
```

Como se ve en el ejemplo anterior, cuando un método retorna un resultado se usa la palabra clave **return** al final de este. Sin embargo, un método también puede no retornar algo, en ese caso, se debe especificar la palabra **void** en su definición en vez del tipo de dato. 

```Apex
public void printMessage() { 
    System.debug('Este es un método que no retorna nada'); 
}
```

Aquí un método que representa una suma y que recibe dos valores Enteros como parámetros para su operación. Este método devuelve el resultado de la suma. Es importante especificar el tipo de dato en cada parámetro del método.

```Apex
public void suma(Integer valorA, Integer valorB) { 
    return valorA + valorB;
}
```

Los parámetros en un método, así como el resultado, son opcionales. Además, se pueden especificar hasta 32 parámetros. 

Los métodos también pueden ser polimórficos, esto quiere decir que puedo tener más de un método con el mismo nombre, pero con diferentes parámetros.

```Apex
public void printMessage() { 
    System.debug('Este es un método que no retorna nada'); 
}

public void printMessage(String message) { 
    System.debug('Este es un método que no retorna nada: '+message); 
}
```
Cuando un método retorna algún valor, este puede guardarse en alguna variable, o usarse simplemente como una sentencia. 

```Apex
public void mainMethod() { 
    Integer resultadoSuma = suma(1,3);
    
    if(esMayorCero(resultadoSuma)){
       System.debug('El número es mayor a 0'); 
    }
    
}

public void suma(Integer valorA, Integer valorB) { 
    return valorA + valorB;
}

public Boolean esMayorCero(Integer resultado) { 
    return resultado > 0;
}
```
 
 Es necesario tener presente como funciona la referencia a los campos primitivos y no primitivos dentro de un método. 
 
 

### Modificadores de Acceso 

## Referencias

1. [ReferOne]()
