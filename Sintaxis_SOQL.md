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

![image](https://user-images.githubusercontent.com/100179095/179630279-313f7bff-2973-4c00-91de-66e2189ac396.png)

Además es importante aclarar que un registro hijo no más puede estar asociado con un registro padre, pero un registro padre puede tener relacionados muchos hijos.
Siguiendo nuestro ejemplo, podríamos expresar que un Autor puede tener varios libros, pero un libro no más puede tener un Autor. 

### Hijo - Padre

Es posible acceder a campos del objeto padre a través de una consulta en el objeto hijo por medio de la **notación de puntos**.

Antes de presentar un ejemplo, es necesario aclarar que cuando se crea un campo de tipo de relación, por debajo, Salesforce maneja dos representaciones del mismo.

Como se sabe, cada vez que yo creo un registro de algún objeto, bien sea estándar o personalizado, por defecto ese registro nace con un Id único que permite diferenciarlo de cualquier otro registro. 

Pues bien, una de las representaciones de un campo tipo relación, a nivel de SOQL, es precisamente la del ID del registro relacionado. La otra representación consiste en un punto de acceso directo al registro relacionado, sobre el cual puedo obtener cualquier campo de dicho objeto. 

```Apex
//Representación id registro relacionado
Libro__c objLibro = [SELECT Id,Name,Autor__c FROM Libro__c LIMIT 1];
Id idAutor = objLibro.Autor__c;

//Representación punto de acceso
Libro__c objLibro = [SELECT Id,Name,Autor__r.Name, Autor__r.Nacionalidad__c FROM Libro__c LIMIT 1];
String nombreAutor = objLibro.Autor__r.Name;
String nacionalidadAutor =  objLibro.Autor__r.Nacionalidad__c;  
``` 

En el ejemplo anterior obtenemos el nombre y la nacionalidad del Autor asociado a un Libro. 

Además, aunque el registro hijo se encuentre huérfano, y yo intente acceder a un campo del registro padre, Salesforce no genera ningún tipo de error. 

### Padre - Hijos

Para obtener los registros del objeto hijo realizando una consulta sobre el objeto Padre, se debe realizar una **subconsulta**.

```Apex
Autor__c  objAutor = [SELECT Id,Name,(SELECT Name FROM Libros__r) FROM Autor__c  LIMIT 1];
String nombreLibro = objAutor.Libros__r[0].Name;
``` 

## Trabajando con Funciones de agregación

Las funciones de agregación permiten obtener información resumida en nuestras consultas. Para hacer uso de estas funciones, es necesario usar la cláusula **GROUP BY**.

Cuando se trabaja con este tipo de funciones, el resultado se guarda en una Lista de tipo **AggregateResult**. 

AggregateResult es un objeto estándar de solo lectura que únicamente se usa para guardar los resultados en este tipo de escenarios. 

```Apex
List<AggregateResult> groupedResults = [SELECT Nacionalidad__c, COUNT(Id) cant from Autor__c group by Nacionalidad__c ];
    
for(AggregateResult objResult :groupedResults){
    System.debug('Nacionalidad: '+objResult.get('Nacionalidad__c'));
    System.debug('Cantiad: '+objResult.get('cant'));
}
``` 

Después de la cláusula GROUP BY es necesario colocar el nombre del campo por el cual vamos a agrupar la información, este mismo campo se debe colocar antes de la función de agregación que usemos. 

Es importante saber, que no se pueden colocar más campos dentro de la consulta, únicamente por el que se va a agrupar. Sin embargo, si es posible usar más de una función de agregación en la misma consulta.

```Apex
List<AggregateResult> groupedResults = [SELECT Nacionalidad__c, COUNT(Id) cant,COUNT(Name) cantName from Autor__c group by Nacionalidad__c ];
    
for(AggregateResult objResult :groupedResults){
    System.debug('Nacionalidad: '+objResult.get('Nacionalidad__c'));
    System.debug('Cantiad: '+objResult.get('cant'));
    System.debug('Cantiad Name: '+objResult.get('cantName'));
}
``` 

También es pertinente aclarar, que es posible dar un alias a las funciones de agregación, este alias se usa posteriormente para acceder al valor de la función. 
Si no se especifica uno, por defecto Salesforce agrega como alias "expri", donde la i representa el orden de la función agregada que no cuenta con un alias personalizado. La i comienza en 0. 

```Apex
List<AggregateResult> groupedResults = [SELECT Nacionalidad__c, COUNT(Id) from Autor__c group by Nacionalidad__c ];
    
for(AggregateResult objResult :groupedResults){
    System.debug('Nacionalidad: '+objResult.get('Nacionalidad__c'));
    System.debug('Cantiad: '+objResult.get('expr0'));
}
``` 

## Consultas más eficientes

Para realizar búsquedas más eficientes, Salesforce recomienda usar **consultas selectivas**. De hecho, si ejecutamos una consulta no selectiva en el contexto de un Trigger, sobre un objeto que tiene más de 1 millón de registros, el sistema arrojara un error.

Una consulta es selectiva cuando se usan **campos indexados** en la cláusula WHERE , y cuando los filtros permiten reducir el número de registros retornados por la misma bajo un **umbral definido por Salesforce**. 

Un campo indexado se puede identificar entrando a la configuración del objeto. 

![image](https://user-images.githubusercontent.com/100179095/179641897-dbb28203-1e64-4469-af70-afc0002605e6.png)

Los campos que por defecto se marcan como indexados son:

- Campos que actuan como llaves primarias: Id, Name, and OwnerId 
- Campos de tipo relación
- El campo CreatedDate 
- El campo Tipo de registro para los objetos estandar que lo tengan configurado
- Campos personalizados que estan configurados como id externos o únicos.

Salesforce constantemente detecta campos que se usan de manera repetida para marcarlos como indexados y optimizar las consultas.También es posible escalar un caso a Salesforce para solicitar indexar un campo. 

```Apex
SELECT Id FROM Account WHERE Id IN (<list of account IDs>)
``` 
Otra manera de mejorar el rendimiento de una consulta es filtrando los valores nulos.

```Apex
List<String> lstNacionalidades = new List<String>{'Colombia','México'};
List<Autor__c> lstAutores = [SELECT Id,Name,Nacionalidad__c FROM Autor__c where Nacionalidad__c IN: lstNacionalidades
                            AND Nacionalidad__c != null];    
``` 

## Trabajando con relaciones polimorficas

Una relación polimorfica es una relación entre objetos donde el objeto que se esta referenciando puede ser de diferentes tipos. 

### Ejemplos de relaciones polimorficas

- Campo WhatId en el objeto Task o Event
- Campo OwnerId en cualquier objeto estándar o personalizado.

Es posible hacer consultas filtrando los tipos de objetos con el calificador **Type**.

```Apex
//Me retorna los eventos asociados a Cuentas y Oportunidades
List<Event> events = [SELECT Description FROM Event WHERE What.Type IN ('Account', 'Opportunity')];

//Me retorna los Autores donde el propietario sea un Usuario
List<Autor__c> lstAutores = [Select id,Name from Autor__c where Owner.Type = 'User'];   
``` 

También se puede usar la Clausula **TYPEOF** para especificar los campos que quiero traer por cada tipo de objeto.

```Apex
List<Event> events = [SELECT TYPEOF What 
                      WHEN Account THEN Phone 
                      WHEN Opportunity THEN Amount 
                      END 
                      FROM Event WHERE What.Type IN ('Account', 'Opportunity')];
                      
//Verificar primero con qué tipo de objeto esta asociado cada registro
Opportunity objOpp = events[0].What;
Account objAct = events[1].What;

System.debug('events Opportunity: '+objOpp.Amount);    
System.debug('events Account: '+objAct.Phone);            
``` 
Incluso, a través de la palabra reservada **instanceof**, la cual permite identificar si un objeto es una instancia de una clase particular, se puede dar una lógica diferente a cada tipo de objeto.

```Apex
Event myEvent = [SELECT Description FROM Event WHERE What.Type IN ('Account', 'Opportunity') LIMIT 1];
if (myEvent.What instanceof Account) {
    // myEvent.What references an Account, so process accordingly
} else if (myEvent.What instanceof Opportunity) {
    // myEvent.What references an Opportunity, so process accordingly
}
``` 
## Usando Expresiones Bind

Es posible usar variables de Apex para interactuar con las consultas SOQL, solo necesitan ir presedidas por **:**

```Apex
List<String> lstObjetos = new List<String>{'Account', 'Opportunity'};
List<Event> lstEvents = [SELECT Description FROM Event WHERE What.Type IN :lstObjetos];
``` 
Las variables solo se pueden usar con las cláusulas:

- FIND 
- WHERE
- LIMIT
- OFFSET
- WITH DIVISION
- IN, NOT IN

## Consultar todos los registros

Con la cláusula **ALL ROWS** es posible consultar todos los registros de un objeto, incluso aquellos que se encuentran en la papelera de reciclaje.

```Apex
List<Event> lstEvents = [SELECT Description FROM Event WHERE What.Type IN :lstObjetos ALL ROWS];
``` 

## Cosas a tener en cuenta

1. A la hora de realizar consultas se debe usar el nombre API de los campos y del objeto. 
2. Cuando se usa la notación de puntos en una consulta para acceder a campos del registro padre, se usa el nombre api del campo tipo relación, pero terminado en __r.

- **nombre API del campo normal:** Autor__c
- **nombre que se usa para la notación de puntos:** Autors__r.

3. Cuando se realiza una subconsulta se usa el nombre del objeto hijo. Si el objeto hijo es estándar se usa el mismo nombre pero en plural, si el objeto es personalizado, se usa el mismo nombre en plural, y además se añade __r 

- **Objetos estandar:** Contact (Nombre normal) - Contacts (Nombre que se debe usar para una subconsulta)
- **Objetos personalizados:** Autor__c (Nombre normal) - Autors__r (Nombre que se debe usar para una subconsulta)

4. El operador **LIKE** permite realizar una busqueda parcial sobre el objeto.

```Apex
//Retorna todos los libros cuyo nombre inicie con la palabra Daniel
List<Libro__c> lstLibros = [Select id,Name,Autor__c from Libro__c where Name like 'Daniel%'];

//Retorna todos los libros cuyo nombre finalice con la palabra Daniel
List<Libro__c> lstLibros = [Select id,Name,Autor__c from Libro__c where Name like '%Daniel'];

//Retorna todos los libros cuya palabra Daniel este contenida en el nombre
List<Libro__c> lstLibros = [Select id,Name,Autor__c from Libro__c where Name like '%Daniel%'];
``` 
5. La cláusula **ORDER BY** permite ordenar los resultados en base a un campo. Por defecto el resultado se ordena de manera ascendente, es decir, de menor a mayor. Para cambiar esto se pueden usar las palabras **ASC ** o **DESC**. 

Si la consulta retorna valores nulos, se puede especificar si se imprimen de primeras o de últimas con **NULLS FIRST** o **NULLS LAST**. Por defecto se imprimen de primeras.

Para el siguiente ejemplo supongamos que existen dos autores: Julio Verne y Daniel. También que hay un libro que aún no tiene asociado un autor. 

```Apex
List<Libro__c> lstLibros = [Select id,Name,Autor__r.Name from Libro__c ORDER BY Autor__r.Name];
//Result Null,Daniel,Julio Verne

List<Libro__c> lstLibros = [Select id,Name,Autor__r.Name from Libro__c ORDER BY Autor__r.Name ASC];
//Result Null,Daniel,Julio Verne

List<Libro__c> lstLibros = [Select id,Name,Autor__r.Name from Libro__c ORDER BY Autor__r.Name DESC];
//Result Null,Julio Verne,Daniel

List<Libro__c> lstLibros = [Select id,Name,Autor__r.Name from Libro__c ORDER BY Autor__r.Name NULLS FIRST];
//Result Null,Daniel,Julio Verne

List<Libro__c> lstLibros = [Select id,Name,Autor__r.Name from Libro__c ORDER BY Autor__r.Name DESC NULLS LAST];
//Result Julio Verne,Daniel,Null
``` 

## Referencias

1. [SOQL](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_SOQL.htm)
2. [Algunas Clausulas](https://developer.salesforce.com/docs/atlas.en-us.soql_sosl.meta/soql_sosl/sforce_api_calls_soql_select_examples.htm)
