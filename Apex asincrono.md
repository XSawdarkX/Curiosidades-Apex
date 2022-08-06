# Apex asincrono

Apex asincrono hace referencia a la capacidad de ejecutar los procesos de forma asincrona. Esto significa que una tarea no se ejecuta de manera inmediata, 
como normalmente funciona en un contexto sincrono. 

Cuando se ejecuta un proceso asincrono, lo primero que hace salesforce es agregarlo a una cola. Posteriormente, el CRM comienza a ejecutar todos los procesos encolados 
a medida que se van liberando los recursos. 

Este tipo de procesamiento es útil cuando tenemos una tarea cuyo resultado no es necesario tenerlo de manera inmediata,
o cuando existe un proceso demasiado extenso que puede bloquear la transacción entera. 

Además, una de las ventajas más importantes a la hora de usar este tipo de procesamientos es que los limites de Apex aumentan. Como el limite de consultas SOQL que
pasa de 100 a 200.

Salesforce ofrece tres tipos de procesamiento asincrono:

## Future Methods

Usar la clase **IP_MetodosFuturos_cls**
Un método futuro permite ejecutar una función en segundo plano.

Se usa cuando necesitamos ejecutar operaciones de larga duración, como llamadas a servicios externos o cualquier operacion que
queramos corra en su propio hilo, en su propio contexto.

También es útil cuando se quiere realizar operaciones DML Mixed. 

Para definir un método futuro usamos la anotación **@future** arriba de su definición

```Apex
@future
public static void myFutureMethod(){   
  System.debug('Este es un método futuro');
}
```

Estos métodos deben ser estaticos y no pueden retornar nada. Adicionalmente, solo soportan datos primitivos y colecciones de datos 
primitivos, como parametros. No se pueden usar parametros de datos complejos como sobjects.

La razón por la que no se permiten sobjects es porque los registros pueden cambiar durante el tiempo que demora en ejecutarse
el método, por lo que estariamos usando una verisón vieja de los registros. Una manera de trabajar con registros es pasando
como parametro el id de los mismos o cualquier otro dato que permita hacer una consulta sobre ellos.

```Apex
@future
public static void processRecords(List<ID> recordIds){   
    List<Account> accts = [SELECT Name FROM Account WHERE Id IN :recordIds];
}
```

Para poder ejecutar un callout dentro de un método furuto, es necesario usar la anotación **@future(callout=true)**

No es posible llamar un método futuro dentro de un método futuro.

Para ejecutar un método futuro desde una clase de prueba se debe hacer el llamado dentro de los métodos **startTest()**, **stopTest()** de 
la clase Test. Ya que de esta forma, el procesamiento se vuelve sincrono. 

```Apex
Test.startTest();        
  IP_MetodosFuturos_cls.myFutureMethod();
Test.stopTest();
```

## Queueable Apex

Usar la clase **IP_ClaseEncolable_cls**

Podriamos definir un encolable como una versión mejorada de los métodos futuros. 

Para definir un encolable se debe crear una clase e implementar la interface **Queueable**. Esta interfaz me permite encolar procesos 
asincronos y monitorear el estado de cada uno.

Cuando usamos la interfaz Queueable, de manera obligatoria debemos implementar el método **execute**. 

```Apex
public class AsyncExecutionExample implements Queueable {
    public void execute(QueueableContext context) {
        Account a = new Account(Name = 'Test Account Quequeable',Phone = '(415) 555-1212');
        insert a;        
    }
}
```

Para ejecutar o encolar una clase encolable se usa el método **enqueueJob** de la clase System.

```Apex
ID jobID = System.enqueueJob(new IP_ClaseEncolable_cls());
```

Cuando encolo una clase, salesforce me devuelve un Id de trabajo, este Id lo puedo usar para monitorear el proceso haciendo
una consulta sobre el objeto **AsyncApexJob**.

```Apex
AsyncApexJob jobInfo = [SELECT Status,NumberOfErrors FROM AsyncApexJob WHERE Id=:jobID];
```

También es posible revisar el estado del proceso desde configuraciones en **Apex Jobs**.

A diferencia de los métodos futuros, una clase encolable te permite usar atributos con tipos de datos complejos, así como encadenar varios encolables ejecutando uno dentro de otro. 

```Apex
public class AsyncExecutionExample implements Queueable {
    public void execute(QueueableContext context) {
        System.enqueueJob(new SecondJob());
    }
}
```
Solo se puede ejecutar una clase encolable dentro de otra.

De igual manera, tal como en los métodos futuros, para cubrir una clase encolable en una clase de prueba, se deben usar los métodos de la clase Test.

```Apex
Test.startTest();        
   System.enqueueJob(new IP_ClaseEncolable_cls());
Test.stopTest();
```

## Batch Apex

Usar el batch **IP_ActualizarInventario_bch**

El batch es un tipo de proceso asincrono que permite construir y ejecutar un actividad compleja, de larga duración, y lo más importante, que maneja un gran volumen de datos.

Para definir una Batch toca crear una clase e implementar la interfaz **Database.Batchable**. Una vez se implenete dicha interfaz, toca obligatoriamente implenetar sus
tres métodos: 

- **Start:** Este método tiene como objetivo definir el conjunto de registros que va a procesar el batch. Para elllo se utiliza el método **QueryLocator** de la clase Database. Este método solo se ejecuta una vez al comienzo del batch. 

```Apex
public Database.QueryLocator start(Database.BatchableContext bc) {
    return Database.getQueryLocator([Select id from Libro__c where IP_Cantidad__c = 0]);
}
```

El método QueryLocator permite saltarse el limite de registros retornados por una consulta de 50.000m y lo extiende hasta 50 millones.

- **Execute:** Este método se encarga de procesar cada lote de información. Un lote se puede entender como una parte del total de registros obtenidos por el método start. El execute se ejecuta por cada lote de datos. Cada lote tiene su propio contexto de ejeccución y por lo tanto sus propios limites. 

Cantidad de lotes = Número de registros retornados por la consulta del método start / batch size.

El **Batch size** me indica la cantidad de registros que puedo procesar en simultaneo (Maximo 200). Si no se especifica ningún Batch size cuando se ejecuta el batch
por defecto toma 200.

Estes método recibe como parametros una referencia al objeto Database.BatchableContext y una lista de sobjects.

```Apex
public void execute(Database.BatchableContext BC, list<Libro__c> lstLibros){

    for(Libro__c objLibro : lstLibros){
        objLibro.IP_Cantidad__c = 10;
    }

    update lstLibros;
}
```

- **Finish:** Este método solo se ejecuta una vez depués de que terminen todas las ejecuciones de la función execute. Por lo general se usa para hacer operaciones pos
procesamiento como enviar un mail. 

Este método también recibe como parametro la referencia del objeto Database.BatchableContext, el cual podemos usar para conocer el estado de la ejecuión.

```Apex
public void finish(Database.BatchableContext BC){
    System.debug('Termino de ejecutarse el batch');
    AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
              TotalJobItems, CreatedBy.Email
              FROM AsyncApexJob WHERE Id = :BC.getJobId()];
    System.debug('AsyncApexJob: '+a);
}
```

### Ejecución de una Batch

Para ejecutar un batch se usa el método **executeBatch** de la clase Database. Este método recibe como parametro una instancia del batch, y el batch size.

```Apex
ID batchprocessid = Database.executeBatch(new IP_ActualizarInventario_bch(),2);
```

### Hacer Calllouts

Para hacer un Callout en un batch, se debe implementar también la interfaz **Database.AllowsCallouts**

```Apex
public class SearchAndReplace implements Database.Batchable<sObject>, Database.AllowsCallouts{
}
```

### Manteniendo el estado de las  variables

Cada ejeción de un lote es considerada una transacción aparte, por lo que cualquier variable definida a nivel de la clase volvera su valor original después de cada iteración. Para mantener el estado de las variables, es necesario implementar la interfaz **Database.Stateful**

```Apex
public class SearchAndReplace implements Database.Batchable<sObject>, Database.Stateful{
}
```

### Clases de prueba

Al igual que sus procesos asincronos hermanos, se usan los métodos de la clase Test para ejecutar el batch desde la clase de prueba. 

## Apex Scheduler

Usar la clase **IP_ScheduleClass_cls**

Es posible programar una clase de Apex para que se ejecute en determinado periodo de tiempo, y con cierta frecuencia. Para ello, es necesario implementar a interfaz **Schedulable**. Cuando se usa esta interfaz es obligatorio implementar el método execute. 

```Apex
public class IP_ScheduleClass_cls implements Schedulable {

  public void execute(SchedulableContext SC) {

  }
}
```

Para realizar la programación se usa el método **schedule** de la clase system. Este método recibe como parametros  

```Apex

```
