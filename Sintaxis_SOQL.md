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

## SOQL

SOQL es un lenguaje propio de Salesforce que permite realizar consultas en la base de datos. De hecho, sus siglas significan Salesforce Object Query Language.

Su sintaxis es similar al lenguaje SQL.

SELECT [campos] FROM [objeto] 

La palabra **SELECT** me permite especificar a que información quiero acceder (Campos), mientras que la palabra **FROM** me indica de que Tabla(Objeto) voy a obtener la información. 

```Apex
List<Account> lstAccount = [SELECT Id, Name FROM Account];
``` 
En el ejemplo de arriba estoy accediendo a los campos Id y Name del objeto Account. Los resultados de una consulta se pueden almacenar en una Lista o en un Mapa. 

```Apex
//List container
List<Account> lstAccount = [SELECT Id, Name FROM Account];

//Map container
Map<Id,Account> objAccount = new Map<Id,Account>([SELECT Id, Name FROM Account]);
``` 
También es posible guardar el resultado de una consulta en un objeto. Sin embargo, para ello es necesario asegurar que la consulta me devuelva un único registro. 
Esto se puede indicar con la palabra **LIMIT** seguido del número de registros máximos que quiero retornar en la consulta, en este caso 1. 

```Apex
Account objAccount = [SELECT Id, Name FROM Account LIMIT 1];
``` 
Es importante que la consulta retorne un registro. En dado caso que no exista ninguno, el sistema arrojara un error. Por eso se recomienda siempre almacenar los resultados en una lista. 

Teniendo en cuenta los ejemplos anteriores, podemos obtener como conclusión, que una consulta a la base de datos se puede almacenar en:

1. Un Objeto.
2. Una Lista.
3. Un Mapa.
4. Un Entero.

Para obtener como resultado de una consulta un número entero usamos el método **COUNT()** entre el SELECT y el FROM, es importante que solo se especifique el método sin ningún campo. Esto nos retorna la cantidad de registros que devuelve la consulta. 

```Apex
Integer cantCuentas = [SELECT COUNT() FROM Account];
``` 

Aparte de las palabras SELECT y FROM, también existe la palabra **WHERE**, que si bien es opcional termina siendo usada casi en el 100% de las consultas. Esta palabra nos permite indicar una o varias condiciones que tienen que cumplir los registros en la base de datos para ser retornados. 

La siguiente consulta por ejemplo, nos retorna las Cuentas cuyo nombre sea **Acme**.

```Apex
List<Account> lstAccount = [SELECT Id, Name FROM Account WHERE Name = 'Acme'];
``` 
Para acceder a un campo es necesario haberlo seleccionado o indicado en la consulta. A continuación, se muestra una serie de ejemplos que muestran como acceder a un campo especifico. 

```Apex

//No generan errores

String nameAccount = [SELECT Id, Name FROM Account LIMIT 1].Name;

String nameAccount  = [SELECT Id, Name FROM Account WHERE Name != null][0].Name;

Account objAccount = [SELECT Id, Name FROM Account LIMIT 1];
String nameAccount = objAccount.Name;

//Genera error

String nameAccount = [SELECT Id FROM Account LIMIT 1].Name;
``` 
Él único campo que no es necesario indicar en la consulta es el Id, ya que siempre se retorna por defecto.

```Apex
//Este ejemplo funciona sin ningún problema
String idAccount = [SELECT Name FROM Account LIMIT 1].Id;
``` 
Si yo realizo una consulta para obtener un registro con el fin de modificarlo, es decir, para actualizar el valor de un campo, más no para usar el valor de este, no es necesario indicarlo en la consulta. Por lo tanto este ejemplo es valido.

```Apex
Account objAccount = [SELECT Id FROM Account LIMIT 1];
objAccount.Name = 'Toyota';
``` 

## Trabajando con Relaciones

En salesforce, yo puedo relacionar dos objetos a partir de un campo de tipo relación. Dentro de este concepto de conexión, siempre existe un objeto que representa el padre, y un objeto que representa el hijo. 

El objeto hijo es aquel que tiene el campo de tipo relación. 

Por ejemplo, yo tengo un objeto llamado **Autor**. Este objeto tiene como campos un Nombre y una Nacionalidad.

![image](https://user-images.githubusercontent.com/100179095/179629399-5c782ec8-7e6e-46b5-a155-8dabad9325b0.png)

También tengo un objeto llamado **Libro**, el cual, aparte de la información como el Nombre o la Fecha de lanzamiento, también tiene asociado un **Autor**. 
Es decir, a nivel del objeto Libro es necesario crear un campo de tipo relación hacia el objeto Autor, lo que significa que el Libro vendría siendo el objeto hijo. 

![image](https://user-images.githubusercontent.com/100179095/179629695-d8bb0f2a-4047-4f2e-a88f-4ddff4eaefe4.png)

Además es importante aclarar que un registro hijo no más puede estar asociado con un registro padre, pero un registro padre puede tener relacionados muchos hijos.
Siguiendo nuestro ejemplo, podríamos expresar que un Autor puede tener varios libros, pero un libro no más puede tener un Autor. 

### Hijo - Padre

### Padre - Hijos


## Cosas a tener en cuenta


## Referencias

1. [ReferOne]()
