# Sintaxis

Este módulo tiene como propósito explicar la sintaxis básica de Apex, lo que incluye:

- [Definición y asignación de variables](https://github.com/XSawdarkX/Curiosidades-Apex/edit/main/Sintaxis_Variables.md) 
- [Constantes](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Constantes.md)
- [Comentarios](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Constantes.md)
- [Mensajes de depuración](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Constantes.md)
- [Colecciones](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Colecciones.md)
- [Condicionales](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Condicionales.md)
- [Ciclos](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Ciclos.md)
- [Manejo de excepciones](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Excepciones.md)
- Definición de clases y métodos

## Ejemplos Clases

### Prueba variables y métodos

Usar la clase **IP_Calculadora_cls**. 

```Apex
IP_Calculadora_cls objCalculadora = new IP_Calculadora_cls();
System.debug('resultado inicial: '+objCalculadora.resultado);

Integer resultadoSuma = objCalculadora.suma(2,3);
System.debug('resultado operación 1: '+resultadoSuma);

objCalculadora.suma(objCalculadora.resultado,5);
System.debug('resultado operación 2: '+objCalculadora.resultado);

objCalculadora.resetearResultado();

objCalculadora.suma(1,5);
System.debug('resultado operación 3: '+objCalculadora.resultado);

if(objCalculadora.suma(objCalculadora.resultado,5) > 10)
    system.debug('Es mayor');
else
    system.debug('Es menor');
```

### Probar referencias de métodos


Usar la clase **IP_ReferenceMethodExample_cls**

Scope : es el contexto o el ambito en el cual se ejcuta cierto código. 

```Apex
IP_ReferenceMethodExample_cls objReference = new IP_ReferenceMethodExample_cls();
objReference.debugStatusMessage();

IP_ReferenceMethodExample_cls objReference = new IP_ReferenceMethodExample_cls();
objReference.createTemperatureHistory();
```

### Explicación modificadores de acceso

Los modificadores de acceso son palabras claves que usamos para definir la accesibilidad hacia un miembro de la clase.
Un miembro puede ser un atributo o un método.

```Apex
JAVA         APEX
Default      private
private      protected
protected    public
public       global 

JAVA

Paquete 1
	Clase 1
	Clase 2
Paquete 2
	Clase 3
```

### Ejemplo estatico y constructores

Usar la clase  **IP_Vehiculo_cls**. Para probar ejecutar el código así, y luego colocando el atributo descuento como estatico.

```Apex
IP_Vehiculo_cls objVehiculo1 = new IP_Vehiculo_cls(IP_Vehiculo_cls.tipovehiculo.AEREO,'002','Rojo',6000);
System.debug('objVehiculo1: '+objVehiculo1);

IP_Vehiculo_cls objVehiculo2 = new IP_Vehiculo_cls(IP_Vehiculo_cls.tipovehiculo.ACUATICO,'003','Azul',7000);
System.debug('objVehiculo2: '+objVehiculo2);

IP_Vehiculo_cls objVehiculo3 = new IP_Vehiculo_cls();
System.debug('objVehiculo3: '+objVehiculo3);

System.debug('DESCUENTOS');
System.debug('objVehiculo1 Descuento: '+objVehiculo1.getDescuento());
System.debug('objVehiculo2 Descuento: '+objVehiculo2.getDescuento());
System.debug('objVehiculo3 Descuento: '+objVehiculo3.getDescuento());

System.debug('ANULAR DESCUENTO VEHICULO 1');
objVehiculo1.anularDescuento();
System.debug('objVehiculo1 Descuento: '+objVehiculo1.getDescuento());
System.debug('objVehiculo2 Descuento: '+objVehiculo2.getDescuento());
System.debug('objVehiculo3 Descuento: '+objVehiculo3.getDescuento());
```

### Clases abstractas

Usar las clases **IP_Animal_cls**,**IP_Gato_cls**, y **IP_Pato_cls**. 

Las clases abstractas son similares a las clases convecionales pero su objetivo es definir el que se debe de hacer, dejando a las clases que la extienden que especifiquen el como se debe de hacer. 

De podría decir que son las clases padre.

- No se pueden instanciar.
- Puede tener sus atributos como cualquier otra clase.
- Puede tener métodos normales, métodos abstractos, y métodos virtuales.
- No es obligatorio o no arroja error el no declarar un método abstracto, pero la idea es usarlos.
- Los métodos abstractos solo pueden ser declarados en clases abstractas y no pueden tener cuerpo
- La clases normales pueden extender de las clases abstractas
- Cuando una clase normal extiende de una clase abstracta, debe implementar y sobreescribir todos sus métodos abstractos.
- Un clase no más puede extender de otra clase, pero se pueden hacer extensiones en cascada. La clase de más bajo nivel es la que debe implementar y sobreescribir 
todos los métodos abtractos


```Apex
IP_Animal_cls animal = new IP_Animal_cls();

IP_Gato_cls gato = new IP_Gato_cls();

IP_Animal_cls gato = new IP_Gato_cls();
gato.nombre = 'Pelusa';
gato.imprimirNombre();
gato.caminar();

IP_Animal_cls pato = new IP_Pato_cls();
pato.nombre = 'Donald';
pato.imprimirNombre();
pato.caminar();
```

### Clases virtuales

Usar las clases **IP_Bebida_cls**,**IP_Agua_cls**,**IP_Gaseosa_cls**, y **IP_Jugo_cls**

Usar La clase **IP_Jugo_cls** para probar el modificador de acceso Protected

Las clases virtuales son similares a las abstractas:

- Puede tener sus atributos como cualquier otra clase. 
- La clases normales pueden extender de las clases virtuales
- Un clase no más puede extender de otra clase, pero se pueden hacer extensiones en cascada. La clase de más bajo nivel es la que puede implementar y sobreescribir 
todos los métodos abtractos

pero se diferencian en:

- Solo pueden tener métodos normales y virtuales.
- Los métodos virtuales pueden tener cuerpo
- Yo puedo o no implementar y sobreescribir un método virtual cuando extiendo de una clase virtual
- Las clases virtuales pueden ser instanciadas

```Apex
IP_Bebida_cls agua = new IP_Agua_cls();
agua.nombre = 'Cristal';
agua.imprimirNombre();
agua.obtenerSabor();

IP_Bebida_cls gaseosa = new IP_Gaseosa_cls();
gaseosa.nombre = 'Pepsi';
gaseosa.imprimirNombre();
gaseosa.obtenerSabor();
```

### Interfaces

Usar las clases **IP_Figura_itf**, **IP_Cuadrado_cls**., y **IP_Circulo_cls**

Una interfaz permite es parecida a una clase abtracta pero:

- Una clase puede implementar varias interfaces
- Una interfaz solo puede contener cuerpos sin métodos
- No se puede especificar un modificador de acceso en los métodos
- No se pueden definir atributos

Al igual que la clase abstracta, cuando se implementa una interfaz, se deben implementar todos sus métodos. Sin embargo, no es necesario la palabra override para hacerlo.

```Apex
IP_Figura_itf cuadrado = new IP_Cuadrado_cls(3);
System.debug('Area cuadrado: '+cuadrado.area());

IP_Figura_itf circulo = new IP_Circulo_cls(3);
System.debug('Area cuadrado: '+circulo.area());
```
### Propiedades

Usar la clase **IP_Propiedades_cls**

Las propiedades son similares a las variables, pero permiten agregar una lógica antes de asignarle o obtener un valor de ellas.  

```Apex
IP_Propiedades_cls objPropiedades = new IP_Propiedades_cls();
objPropiedades.edad = 4;
System.debug('Edad: '+objPropiedades.edad);
```

Las pripedades pueden ser de : 

- read only
- write only
- read-write

```Apex
IP_Propiedades_cls objPropiedades = new IP_Propiedades_cls();
objPropiedades.nombre = 'Daniel';

IP_Propiedades_cls objPropiedades = new IP_Propiedades_cls();
objPropiedades.color = 'Rojo';
System.debug('Color: '+objPropiedades.color);

IP_Propiedades_cls objPropiedades = new IP_Propiedades_cls();
objPropiedades.aplicaDescuento = true;
System.debug('¿Aplica descuento?: '+objPropiedades.aplicaDescuento);
```
Los accesores de propiedad pueden tener sus propios modificadores de acceso, pero estos deben ser de un nivel más bajo que el modificador de acceso de la propiedad.

```Apex
IP_Propiedades_cls objPropiedades = new IP_Propiedades_cls();
objPropiedades.descuento = 2.5;
```
### Clases de prueba

Usae la clase de prueba **IP_Calculadora_tst**. 

Son clases que nos permiten comprobar que la aplicación funcione como se espera. 

Para definir una clase de prueba se debe usar la notación @isTest. La clase de prueba puede ser private, public, y global. 

Una clase de prueba tiene métodos de prueba, estos métodos también deben contar con la anotación @isTest, aunque es posible usar la palabara clave **testmethod**, según la documentación de Salesforce, esta forma ya es obsoleta y recomiendan siempre usar la anotación. [documentación](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_annotation_isTest.htm)

También es posible tener métodos auxiliares que no usan la anotación.

Además, Salesforce recomienda validar:

- Con un único registro
- Con multiples registros
- Comportamientos positivos
- Comportamientos negativos como un catch por ejemplo
- Comportamientos restrictivos de usuarios

Si se necesia cubrir métodos o usar atirbutos privados de la clase que se esta cubriendo, es necesario usar la anotación @TestVisible en ellos.

Por defecto las clases de prueba no pueden ver los registros de los objetos estandar o personalizados. Solo aquellos objetos estandar que son usados para gestionar la organización o la metadata, como :

- Usuario
- Perfil
- Recortype

Para visualizar los datos de la instancia es necesario usar la anotación IsTest(SeeAllData=true), aunque se recomienda, en lo posible, crear la información que se va a usar en la misma clase de prueba. 

Esta anotación puede usarse a nivel de la clase, para que aplique a todos los métodos, o a nivel de una función especifica. 

También es posible cargar datos desde un recurso estatico.

```Apex
List<sObject> ls = Test.loadData(Account.sObjectType, 'myResource');
```

#### Recomendaciones

1. Usar una Tets utily class o Test data factory. Esta clase se va a encargar de crear los registros de la mayoria de los objetos custom o estandar, para poder usarlos como insumo en las clases de prueba
2. utilizar un método principal con la anotación @testSetup, en este método se va a llamar a la Tets utily class para crear toda la información. Y después cada método de la clase de prueba puede acceder a esta información si necesidad de crear la data en cada método. Si se usa la anotación IsTest(SeeAllData=true), este método no puede ser declarado. 
3. Se recomienda usar el método assertEquals de la clase System para comrpobar que el método hace lo que tiene que hacer. 


## Referencias

1. [ReferOne]()
