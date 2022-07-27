
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
    List<Libro__c> lstLibro = [SELECT Name FROM Libro__c WHERE Name = 'Test'];
    System.debug(lstLibro.size());
    
    Libro__c objLibro = [SELECT Name FROM Libro__c WHERE Name = 'Test' LIMIT 1];
} catch(QueryException qe) {
    System.debug('The following exception has occurred: ' + qe.getMessage());    
}
``` 
8. **SObjectException:** Ocurre cuando se genera un error manipulando un sObject, como intentar utilizar un campo de un objeto cuando este no se declaró en la consulta. 

```Apex
try {
    Libro__c objLibro = new Libro__c(Name = 'New Book', IP_NumeroSerie__c = '7B');
    insert objLibro;
    
    Libro__c objLibroQuery = [SELECT Name FROM Libro__c WHERE Id = :objLibro.Id];
    String numeroSerie = objLibroQuery.IP_NumeroSerie__c;
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
    Libro__c objLibro = [SELECT Id FROM Libro__c LIMIT 1];
    String nombreLibro = objLibro.Name;
} catch(Exception e) {
    System.debug('Exception type caught: ' + e.getTypeName());    
    System.debug('Message: ' + e.getMessage());    
    System.debug('Cause: ' + e.getCause());    
    System.debug('Line number: ' + e.getLineNumber());    
    System.debug('Stack trace: ' + e.getStackTraceString());    
}

//Result Exception type caught: System.SObjectException
//Result Message: SObject row was retrieved via SOQL without querying the requested field: Libro__c.Name
//Result Cause: null
//Result Line number: 5
//Result Stack trace: AnonymousBlock: line 5, column 1
``` 

**Exception** es un tipo genérico de excepción que permite capturar todos los errores de cualquier otro tipo de excepción.  

### Excepciones personalizadas

Es posible crear, lanzar, y capturar excepciones personalizadas.

Las excepciones personalizadas pueden ser clases de alto nivel, es decir, pueden tener variables, constructores y métodos, así como implementar interfaces.
 
La Sintaxis básica para crear una excepción personalizada es:

[scope] class [nombre de la clase] extends Exception {}

```Apex
public class MyException extends Exception {}
``` 
Hay que tener en cuenta dos cosas importantes:

1. La clase que representa la excepción personalizada debe extender de la clase **Exception**
2. El nombre de la clase debe finalizar con la palabra **Exception**

Para lanzar una excepción se usa la palabra reservada **throw**.

```Apex
public class MyException extends Exception {}

throw new MyException();
```
Para capturar una excepción personalizada se usa el **catch** especificando el nombre de la clase.

```Apex
public class MyException extends Exception {}

try {
    throw new MyException();
} catch(MyException e) {
    System.debug('The following exception has occurred: ' + e.getMessage());
}

//Result Script-thrown exception
```

Existen cuatro formas estandar (constructores de la clase Exception) de lanzar una  excepción personalizada. 

1.  **throw new MyException(); :** Es la forma más básica de lanzar la excepción. Cuando usamos el método **getMessage()** nos devuelve el mensaje estándar "Script-thrown exception". 
2.  **throw new MyException('Esto es malo'); :** Permite especificar un mensaje más legible. Este se obtiene precisamente con el método **getMessage()**. 
3.  **throw new MyException(e); :** Permite especificar la causa del error. Este tipo de throw solo se puede usar dentro de una sentencia catch. 
4.  **throw new MyException('Esto es malo',e); :** Permite especificar un mensaje y la causa del error. Este tipo de throw solo se puede usar dentro de una sentencia catch. 

```Apex
public class MyException extends Exception {}

try {
    throw new MyException('Esto es malo');
} catch(MyException e) {
    System.debug('The following exception has occurred: ' + e.getMessage());
}

//Result Esto es malo
```
### Relanzamiento de excepciones

Cuando se captura una excepción es posible volver a lanzar otra en el bloque del catch. Esto es útil si el método donde se genera el error está siendo llamado por otro método, y queremos delegar el manejo de la excepción al método principal.

```Apex
public class My1Exception extends Exception {} 
public class My2Exception extends Exception {} 

try { 
    throw new My1Exception('First exception'); 
} catch (My1Exception e) { 
    throw new My2Exception('Thrown with inner exception', e);
}
```

### Excepcione heredadas

Siguiendo un poco el ejemplo anterior, aquí se puede apreciar un escenario más completo:

```Apex
public class IP_TestException_cls {
    
    public class accountException extends Exception {}
    
    public static void mainProcessing() {
        try {
            insertAccount();
        } catch(accountException me) {
            System.debug('Message: ' + me.getMessage());    
            System.debug('Cause: ' + me.getCause());    
            System.debug('Line number: ' + me.getLineNumber());    
            System.debug('Stack trace: ' + me.getStackTraceString());    
        }
    }
    
    public static void insertAccount() {
        try {
            Account a = new Account();
            insert a;
        } catch(DmlException e) {
            throw new accountException('Account item could not be inserted.', e);
        }
    }
}
```
En este caso, se puede observar una clase que contiene dos métodos: **mainProcessing()** y **insertAccount()**. El primero llama al segundo. 

En el segundo método ocurre una DmlException, y dentro de su bloque catch lanzamos nuestra excepción personalizada, la cual es capturada por el catch del primer método. Es decir, estamos delegando el manejo de la excepción al método principal.

Para probar este ejemplo es necesaro crear la clase y ejecutar el método principal desde la ventana anonima.

```Apex
IP_TestException_cls.mainProcessing();
```

### Excepción personalizada detallada

Para crear una Excepción personalizada más detallada, podemos crearla en una clase aparte con sus respectivas propiedades y métodos, incluso podemos agregar nuevos constructores. 

Aquí un ejemplo sencillo de una Excepción personalizada con un nuevo constructor, un par de propiedades, y un método.

```Apex
public class MyCustomException extends Exception {
   public String mensaje;
   public Integer prioridadError; 
   
    public MyException(String mensaje, Integer prioridadError){
        this.mensaje = mensaje;
        this.prioridadError = prioridadError;
    }
    
    public String getUppercaseMensaje(){
        return this.mensaje.toUpperCase();
    }
}
```
A partir de esta Excepción personalizada podemos realizar lo siguiente:

```Apex
try{
    throw new MyCustomException('Ocurrio un error',1);
}catch(MyCustomException e){ 
    System.debug('Message: ' + e.mensaje+' prioridad '+e.prioridadError);    
    System.debug('Message en mayuscula: '+e.getUppercaseMensaje());
} 

//Result  Ocurrio un error prioridad 1
//Result  OCURRIO UN ERROR
```

Si intentamos crear un constructor con un solo parámetro String, o con dos parámetros: uno String y el otro de tipo Exception, el sistema arrojara un error debido a que la clase principal Exception ya tiene un constructor con esta estructura, es necesario usar otros tipos de datos, o agregar parámetros adicionales.  

### Cosas a tener en cuenta

1. No se pueden capturar límites. Salesforce, al ser un crm que se ejecuta en la nube, debe compartir recursos con todos sus clientes, lo que conlleva a tener una gran cantidad de límites cuyo objetivo es evitar que una entidad en específico monopolice todos los recursos.

   Estos límites también están presentes en Apex. Por ejemplo, si yo realizo más de 150 operaciones sobre la base de datos en una misma transacción, el sistema        arrojara un error de limite, el cual no puede ser capturado por un bloque catch.  

```Apex
try {
    for(Integer i = 0; i < 160; i++){
    	Libro__c objLibro = new Libro__c();
    	objLibro.Name = 'Harry Potter '+i;
	objLibro.IP_NumeroSerie__c = i+'B';
    	insert objLibro;    
    }
}catch(Exception e) {
    System.debug('The following generic exception has occurred: ' + e.getMessage());
}
```

2.  Tampoco es posible capturar las excepciones generadas por los métodos **Assert** de la clase System.

```Apex
try {
    Integer edad = 15;
    System.assertEquals(14, edad);
} catch(Exception e) {
    System.debug('Error message: ' + e.getMessage());
}
```

3. Si se usan varios bloques **Catch**, y se quiere usar el catch de tipo Exception, se debe colocar de últimas, de lo contrario el sistema arroja error. 

```Apex
try {
    Account a = new Account();
    insert a;
}catch(Exception e) {
    System.debug('Generic Exception: ' + e.getMessage());
}catch(DmlException e) {
    System.debug('DmlException: ' + e.getMessage());  
}
```    
## Referencias
1. [Excepciones](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_exception_definition.htm)
2. [Tipos de Excepciones](https://developer.salesforce.com/docs/atlas.en-us.238.0.apexref.meta/apexref/apex_classes_exception_methods.htm)
3. [Excepciones personalizadas](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_exception_custom.htm)

