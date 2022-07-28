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
 
Es necesario tener presente cómo funciona la referencia a los campos primitivos y no primitivos dentro de un método. Cuando uso datos primitivos como parámetros, estos solo perduran en el scope del método, una vez el método finalicee su ejecución, cualquier cambio que se haya hecho sobre la variable se pierde. 
 
```Apex 
public class PassPrimitiveTypeExample {
    public static void debugStatusMessage() {
        String msg = 'Original value';
        processString(msg);
        System.assertEquals(msg, 'Original value');
    }
    
    public static void processString(String s) {
        s = 'Modified value';
    }
}
```
 
Por el contrario, cuando uso un dato no primitivo, como un sobject o una colección, su referencia se mantiene a través de los métodos, por lo que cualquier cambio   que se le haya hecho se mantiene una vez finalizada la ejecución del método.  
 
```Apex 
public class PassNonPrimitiveTypeExample {
    
    public static void createTemperatureHistory() {
        List<Integer> fillMe = new List<Integer>();        
        
        reference(fillMe);
        System.assertEquals(fillMe.size(),5);        
        
        List<Integer> createMe = new List<Integer>();
        referenceNew(createMe);
        System.assertEquals(createMe.size(),0);     
    }
            
    public static void reference(List<Integer> m) {
        m.add(70);
        m.add(68);
        m.add(75);
        m.add(80);
        m.add(82);
    }    
        
    public static void referenceNew(List<Integer> m) {
        m = new List<Integer>{55, 59, 62, 60, 63};
    }    
}
``` 

Si no se especifica un modificador de acceso a la hora de definir una variable o un método, por defecto se marca como private.

### Constructores

Un constructor es un método especial que se invoca o ejecuta cuando instanciamos un objeto de la clase. Este método se identifica porque se llama igual que la clase, y no se especifica con un tipo de dato de retorno, ni siquiera con un void. También es importante definirlo como Public. 

Por defecto todas las clases cuentan con un Constructor intrínseco, el cual no recibe argumentos. Sin embargo, se pueden definir diferentes constructores haciendo uso del polimorfismo. 

Un constructor tiene como objetivo inicializar los atributos de una clase. 

```Apex 
public class TestObject {
   
   public Integer size;
   
   public TestObject() {
      this.size = 5;
   }
  
   public TestObject(Integer size) {
      this.size = size;
   }
}
``` 

Para instanciar un objeto de la clase se usa la siguiente sintaxis:

```Apex 
TestObject myObject1 = new TestObject();
TestObject myObject2 = new TestObject(10);

System.debug('Size: '+myObject1.size);
System.debug('Size: '+myObject2.size);

//Result Size: 5
//Result Size: 10
``` 

### Modificadores de Acceso 

**private:** El atributo o el método solo son accesibles a través de la misma clase donde se definen.

**protected:** El atributo o el método solo son accesibles por las subclases o por las clases que extienden de la clase principal donde fueron definidos.

**publico:** El atributo o el método son accesibles desde cualquier clase del mismo paquete. 

**global:** El atributo o el método son accesibles desde cualquier clase del mismo paquete o desde un paquete/aplicación externa. 

Entiendase por paquete la misma instancia. 

Una aplicación externa puede representar otra instancia o otro sistema que intenta acceder al nuestro a través de un servicio web por ejemplo. 






## Referencias

1. [ReferOne]()
