
# Sintaxis

Este módulo tiene como propósito explicar la sintaxis básica de Apex, lo que incluye:

- [Definición y asignación de variables](https://github.com/XSawdarkX/Curiosidades-Apex/edit/main/Sintaxis_Variables.md) 
- [Constantes](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Constantes.md)
- [Comentarios](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Constantes.md)
- [Mensajes de depuración](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Constantes.md)
- [Colecciones](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Colecciones.md)
- [Condicionales](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Condicionales.md)
- [Ciclos](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Ciclos.md)
- Manejo de excepciones
- [Definición de clases y métodos](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_ClasesMetodos.md)

## Excepciones

Las excepciones son sentencias cuyo objetivo es permitir capturar errores que interrumpen el flujo normal de un proceso. 

Su sintaxis básica es: 

try {
 code_block
} catch (exceptionType variableName) {
 code_block
}

Una excepción se divide en tres partes:

1. **Try:** Permite identificar un bloque de código en el que posiblemente pueda ocurrir una disrupción del flujo. 
2. **Catch:** Permite capturar las excepciones que se generen en el bloque Try. De esta manera el proceso puede continuar su flujo normal. Es posible tener varios catch, pero cada uno debe corresponder con un Tipo de excepción diferente. 
3. **Finally:** Esta sentencia se ejecuta independientemente de si ocurre o no una excepción. Se usa generalmente para liberar recursos o limpiar el código. 

Tanto la sentencia Finally como la sentencia Catch son opcionales, pero al menos una debe acompañar al Try. 

Aquí algunos Ejemplos: 

### Bloque Try/Catch


```Apex
try{

   Integer valorA = 5;
   Integer valorB;
   Integer resultado = valorA + valorB;
   
   System.debug('resultado: '+resultado); 
      
}catch(Exception e){
   System.debug('Ha ocurrido una Excepción: '+e); 
}

//Result Ha ocurrido una Excepción: System.NullPointerException: Attempt to de-reference a null object
``` 
En este caso, al intentar realizar una operación aritmética entre el valor 5 y un null, se produce una excepción de tipo **NullPointerException**. 

Es importante mencionar que cualquier línea de código ubicada después de la sentencia que produce el error, no se ejecuta. Por lo que el mensaje de depuración con el resultado nunca se imprime. 

### Bloque Try con varios Catch

```Apex
try{

   List<String> lstNombres = new List<String>();
   String primerNombre =  lstNombres.get(0);
      
}catch(ListException l){
   System.debug('Ha ocurrido una Excepción de Lista: '+l); 
}catch(Exception e){
   System.debug('Ha ocurrido una Excepción: '+e); 
}
	
//Result Ha ocurrido una Excepción de Lista: System.ListException: List index out of bounds: 0
``` 

Aquí podemos ver un ejemplo de una sentencia Try con varios catch. Cada Catch debe capturar un tipo diferente de error, de lo contrario el sistema no compilara el código. En este caso se genera una excepción de tipo **ListException** porque se esta intentando acceder a una posición dentro de la lista que no existe. 

### Otros ejemplos con Finally

```Apex
try{

   Integer valorA = 5;
   Integer valorB = 6;
   Integer resultado = valorA + valorB;
   
   System.debug('resultado: '+resultado); 
      
}finally {
  System.debug('¿Se produjo algún error? No se');  
}

//Result resultado: 11
//Result ¿Se produjo algún error? No se
``` 

```Apex
try{

   Integer valorA = 5;
   Integer valorB;
   Integer resultado = valorA + valorB;
   
   System.debug('resultado: '+resultado); 
      
}catch(Exception e){
   System.debug('Ha ocurrido una Excepción: '+e); 
}finally {
  System.debug('¿Se produjo algún error? No se');  
}

//Result Ha ocurrido una Excepción: System.NullPointerException: Attempt to de-reference a null object
//Result ¿Se produjo algún error? No se
``` 

Como se puede comprobar, ocurra o no un error, de igual manera se ejecuta el código dentro de la sentencia Finally. Esta siempre debe estar ubicada en la última parte de la estructura. Solo se debe agregar una vez por Try. 

### Tipos de excepción

Existen diferentes tipos de excepción que permiten capturar errores específicos. Dentro de los principales se encuentran: 

1. **DmlException:** Ocurre cuando se genera un error en una sentencia DML, como intentar insertar un registro sin haber llenado todos los campos requeridos.

```Apex
try {
    Account a = new Account();
    insert a;
} catch(DmlException e) {
    System.debug('The following exception has occurred: ' + e.getMessage());
}
``` 

3. **ListException:** Ocurre cuando se genera un error a la hora de operar una lista, como acceder a una posición que no existe. 

```Apex
try {
    List<Integer> li = new List<Integer>();
    li.add(15);
    
    Integer i1 = li[0]; 
    Integer i2 = li[1]; // Causes a ListException
} catch(ListException le) {
    System.debug('The following exception has occurred: ' + le.getMessage());
}
``` 
5. **NullPointerException:** Ocurre cuando intentamos realizar alguna acción con un valor null. 

```Apex
try {
    String s;
    Boolean b = s.contains('abc'); 
} catch(NullPointerException npe) {
    System.debug('The following exception has occurred: ' + npe.getMessage());
}
``` 
7. **QueryException:** Ocurre cuando se genera un error ejecutando una consulta SOQL, como una consulta que no retorna nada y se esta intentando guardar el resultado en un objeto y no en una lista. 

```Apex
try {
    List<Merchandise__c> lm = [SELECT Name FROM Merchandise__c WHERE Name = 'XYZ'];
    System.debug(lm.size());
    
    Merchandise__c m = [SELECT Name FROM Merchandise__c WHERE Name = 'XYZ' LIMIT 1];
} catch(QueryException qe) {
    System.debug('The following exception has occurred: ' + qe.getMessage());    
}
``` 
9. **SObjectException:** Ocurre cuando se genera un error manipulando un sObject, como intentar utilizar un campo de un objeto cuando este no se declaró en la consulta. 

```Apex
try {
    Invoice_Statement__c inv = new Invoice_Statement__c(Description__c='New Invoice');
    insert inv;
    
    Invoice_Statement__c v = [SELECT Name FROM Invoice_Statement__c WHERE Id = :inv.Id];
    String s = v.Description__c;
} catch(SObjectException se) {
    System.debug('The following exception has occurred: ' + se.getMessage());
}
``` 
### Métodos de excepción

Cuando se captura una excepción es posible obtener más información acerca de la misma a través de una serie de métodos. Los métodos que comparten todos los tipos de excepción son: 

- **getCause:** Retorna la causa de la excepción.
- **getLineNumber:** Retorna la línea de código en la que se originó la excepción.
- **getMessage:** Retorna el mensaje de error que el usuario ve en pantalla.
- **getStackTraceString:** Retorna el rastro o la ruta de ejecución desde donde se originó la excepción.
- **getTypeName:** Retorna el tipo de excepción. SObjectException,QueryException,ListException, etc.

```Apex
try {
    Merchandise__c m = [SELECT Name FROM Merchandise__c LIMIT 1];
    Double inventory = m.Total_Inventory__c;
} catch(Exception e) {
    System.debug('Exception type caught: ' + e.getTypeName());    
    System.debug('Message: ' + e.getMessage());    
    System.debug('Cause: ' + e.getCause());    
    System.debug('Line number: ' + e.getLineNumber());    
    System.debug('Stack trace: ' + e.getStackTraceString());    
}

//Result Exception type caught: System.SObjectException
//Result Message: SObject row was retrieved via SOQL without querying the requested field: Merchandise__c.Total_Inventory__c
//Result Cause: null
//Result Line number: 5
//Result Stack trace: AnonymousBlock: line 5, column 1
``` 

**Exception** es un tipo genérico de excepción que permite capturar todos los errores de cualquier otro tipo de excepción.  

### Excepciones personalizadas

Es posible crear, lanzar, y capturar excepciones personalizadas.

Las excepciones personalizadas pueden ser clases de alto nivel, es decir, pueden tener variables, constructores y métodos, así como implementar interfaces.
 
La Sintaxis básica para crear una excepción personalizada es:

[scope] class [nombre de la Exception] extends Exception {}

```Apex
public class MyException extends Exception {}
``` 
Hay que tener en cuenta dos cosas importantes:

1. La clase que representa la excepción personalizada debe extender de la clase **Exception**
2. El nombre de la clase debe finalizar con la palabra **Exception**


## Referencias
1. [Excepciones]()
2. [Tipos de Excepciones](https://developer.salesforce.com/docs/atlas.en-us.238.0.apexref.meta/apexref/apex_classes_exception_methods.htm)
