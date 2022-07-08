# Sintaxis

Este módulo tiene como propósito explicar la sintaxis básica de Apex, lo que incluye definición de variables, asignaciones, constantes, comentarios, mensajes de depuración, colecciones, condicionales, ciclos y manejo de excepciones.

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






