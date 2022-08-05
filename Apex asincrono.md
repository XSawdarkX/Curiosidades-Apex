# Apex asincrono

Apex asincrono hace referencia a la capacidad de ejecutar los procesos de forma asincrona. Esto significa que una tarea no se ejecuta de manera inmediata, 
como normalmente funciona en un contexto sincrono. 

Cuando se ejecuta un proceso asincrono, lo primero que hace salesforce es agregarlo a una cola. Posteriormente, el CRM comienza a ejecutar todos los procesos encolados 
a medida que se van liberando los recursos. 

Este tipo de procesamiento es útil cuando tenemos una tarea cuyo resultado no es necesario tenerlo de manera inmediata,
o cuando existe un proceso demasiado extenso que puede bloquear la transacción entera. 

Además, una de las ventajas más importantes a la hora de usar este tipo de procesamientos es que los limites de Apex aumentan. 

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

