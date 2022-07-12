# Sintaxis

Este módulo tiene como propósito explicar la sintaxis básica de Apex, lo que incluye:

- Definición y asignación de variables 
- [Constantes]()
- [Comentarios]()
- [Mensajes de depuración]()
- Colecciones
- Condicionales
- Ciclos 
- Manejo de excepciones.
- Definición de clases y métodos

## Variables

Las variables se pueden considerar perfectamente como el corazón de la programación, representan la materia prima, pues son al fin y al cabo las que almacenan los datos con los cuales trabajamos.
Las variables, hablando técnicamente, se entienden como un espacio en memoria cuyo periodo de vida dura lo mismo que la ejecución del programa. 

Sin embargo, explicándolo en términos más sencillos, podríamos decir que una variable es un contenedor que permite guardar un valor.

![image](https://user-images.githubusercontent.com/100179095/177684361-e557a97f-0971-4840-87cd-5716088e9e26.png)

Además, como su mismo nombre lo indica, las variables pueden cambiar su valor a lo largo de una transacción. 

## Asignación de variables

Debido a que Apex es un lenguaje de tipificación fuerte, es necesario siempre indicar el tipo de dato a la hora de definir una variable. 

Dentro de los tipos de datos que se pueden encontrar en Apex están:

- Tipos de datos **primitivos** como: Integer, String, Boolean, Id, Date, entre otros. 
- El tipo de dato **sObject**
- El tipo de dato **Object**
- Clases
- El tipo de dato **Enum**

### Datos primitivos

Para definir una variable es nesesario seguir la siguiente estructura:

[Scope] [Tipo de dato] [Nombre de la variable];

El scope es un tema que se explicara más adelante, pero por el momento nos basta con saber que es opcional. También es importante aclarar que, como en la mayoría de lenguajes, cada declaración termina con un **;**

Teniendo en cuenta esto, un ejemplo de una declaración seria:

```Apex
Integer edad;
``` 
Para asignar un valor a una variable usamos el signo **=** 

```Apex
Integer edad;
edad = 15;
``` 
También es posible definir una variable y asignarle un valor al mismo tiempo. 

```Apex
Integer edad = 15;
``` 

Cuando se define una variable y no se le asigna un dato, por defecto queda con un valor de **nulo (vacio)**. El cual también puede ser asignado de forma deliberada cuando se necesite. Por lo que las siguientes dos sentencias son equivalentes.

```Apex
Integer edad;

Integer edad = null;
``` 

Así como es necesario especificar el tipo de dato de una variable, es importante asignarle un valor del mismo tipo. Por ejemplo, la siguiente sentencia no es válida.

```Apex
Integer edad = '15';
``` 

#### Tipo de dato Id

En salesforce, cada vez que se crea un **Registro** de cualquier Objeto, se le asigna un **Id** único que lo identifica de cualquier otro registro. En Apex, existe un tipo de dato primitivo para guardar dicho valor.  

Sin embargo, también es posible guardar un Id en una variable de tipo **String**. El sistema, independientemente de que tipo de dato se haya usado, valida que la estructura del Id sea correcta. Esto quiere decir que ambas sentencias de abajo son válidas.

```Apex
Id idCuenta = '0014P000026NPiEQAW';

String idCuenta = '0014P000026NPiEQAW';
``` 
#### Ejemplos

```Apex
Decimal precioZapatos = 200.20; 

Boolean dolarSubio = true;

String nombre = 'Daniel';

//Año,Mes,Día
Date birthDay = Date.newInstance(2022, 08, 20);

//Año,Mes,Día,Hora,Minuto,Segundo
DateTime medicalAppointment = DateTime.newInstance(2022,08,20,04,20,15);

//Hora,Minuto,Segundo,Milisegundo
Time footballMatch = Time.newInstance(20,4,20,15);
``` 
Para ver la lista completa de Tipos de dato primitivos consultar el siguiente enlace [datos primitivos](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_primitives.htm)

### sObjects

El tipo de dato **sObject (Salesforce Object)** es un tipo de dato genérico que se usa para representar Objetos estándar o personalizados. Es importante aclarar que
los objetos estandar, y cualquier objeto custom que se cree, se pueden utilizar como tipos de datos dentro de Apex, representando uno o varios registros de ese objeto.

Es así como, por ejemplo, podemos utilizar el objeto Account o el objeto Libro__c (Objeto personalizado) como un tipo de dato. 

```Apex
//Representa un registro del objeto Cuenta
Account objAccount = new Account();

//Representa un registro del objeto Libro
Libro__c objLibro = new Libro__c();
``` 
Para declarar una variable de este tipo es necesario usar le palabra **new** después del = , más adelante se ahondará un poco más en este tipo de definiciones. 

El tipo de dato sObject me permite almacenar cualquier registro de cualquier Objeto, es por ello que las siguientes sentencias son validas.

```Apex
sObject s = new Account();

sObject s = new Libro__c();
``` 

También es posible castear o convertir el tipo de dato genérico sObject a un objeto especifico.

```Apex
sObject s = new Account();

//Representa un registro del objeto Cuenta
Account objAccount = (Account)s;
``` 

### Objects

A diferencia del tipo de dato sObject, object es un tipo de dato genérico que sirve para almacenar valores de cualquier otro tipo. También es posible
realizar un Cast cuando sea necesario y convertir una variable de tipo Object en una variable de un tipo de dato especifico. 

```Apex

Object s = new Account();

Object edad = 15;

Object nombre = 'Daniel';
String nombreTexto = (String)nombre; 
``` 

### Clases

Como se mencionó en el módulo de Conceptos básicos, Apex es un lenguaje orientado a objetos, por lo que al igual que Java, se pueden crear Clases con sus respectivas propiedades y métodos. Estas clases terminan siendo otro tipo de datos que se puede usar para definir una variable, o como se conoce técnicamente, para instanciar un objeto. 

Teniendo esto en cuenta, si yo creo una clase llamada **Carro_cls**, la siguiente declaración es válida. Nótese que, al usar la Clase como un tipo de dato, también se usa la palabra **new**.

```Apex
Carro_cls objCarro = new Carro_cls();
``` 
### Enum

Enum es un tipo de dato abstracto que se usa para almacenar un conjunto de valores constantes. Es útil cuando se desea usar un grupo de datos cuyos valores ya se conocen, como **los días de la semana**, **las estaciones del año**, **las posiciones del futbol**, etc.

Para definir un Enum se usa la siguiente sintaxis

[Scope] [Enum] [Nombre de la variable] {valor1,valor2,valor3}

```Apex
enum Season {WINTER, SPRING, SUMMER, FALL}
``` 
Aunque no es obligatorio, por regla general se recomienda que los valores se especifiquen en mayúscula. También es importante tener en cuenta, que aunque se use la palabra reservada **enum**, para definir una variable de este tipo, es necesario utilizar el nombre que se usó para denominar el conjunto de datos, en este ejemplo: **Season**. 

```Apex
//Accedemos a uno de los valores del Enum.
Season invierno = Season.WINTER;
``` 
#### Métodos Enum

Este tipo de dato también cuentan con cuatro métodos que permiten interactuar con los valores. 

- Values() : devuelve la lista de valores del enum.

```Apex
List<Season> values = Season.values();
``` 

- valueOf(String enumValue) : devuelve un valor enum a partir de un valor de tipo string

```Apex
Season seasonValue = Season.valueOf('WINTER');
``` 

- name() : devuelve un valor del enum pero en tipo String

```Apex
String invierno = Season.WINTER.name();
``` 

- ordinal() : devuelve la posición de una valor en especifico. Comenzando desde la posición 0

```Apex
Integer posicion = Season.WINTER.ordinal();
``` 

## Referencias

1. [Datos primitivos](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_primitives.htm)
2. [Sobjects](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_SObject_types.htm)
3. [Enum](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_enums.htm)
4. [Métodos Enum](https://developer.salesforce.com/docs/atlas.en-us.238.0.apexref.meta/apexref/apex_methods_system_enum.htm)
