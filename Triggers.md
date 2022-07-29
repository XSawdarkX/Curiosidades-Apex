# Triggers

Los triggers son acciones personalizadas que se ejecutan antes o después de los cambios en los registros de Salesforce.  

un Trigger se ejecuta después de aplicar alguna de las siguientes operaciones:

- insert
- update
- delete
- merge
- upsert
- undelete

Se pueden definir Triggers para objetos estándar y personalizados.

Hay dos tipos de triggers: 

- **Before Triggers:** Son usados para validar o actulizar valores antes de que el registro se guarde en la base de datos. 
- **After Triggers:** Son usados para acceder a valores que ya se encuentran persistidos en la base de datos. También para hacer cambios en otros registros diferentes a los que dispararon el trigger.

Los registros que disparan el trigger, son de solo lectura en un after. No es posible aplicar un dml sobre el mismo registro que disparo un trigger en el before.

Si necesito hacer un callout en un Trigger, este se debe ejecutar en un contexto asincrono para no bloquear el proceso.  

Para que se ejecute la lógica en una operación dml especifica, se debe agregar esa operación con su tipo en la definición del trigger.

```Apex
trigger IP_Libro_tgr on Libro__c (before insert,after insert,before update,after update) {

}
```
Un trigger puede tener atributos y métodos, pero no es una clase, es decir, no se puede instanciar.

Si la ejecución del trigger resulta exitosa, se hace un commmit automaticamente sobre los cambios. Por el contrario, si en algún punto el proceso falla, se hace un rollback sobre los cambios.

## Variables de contexto

Para identificar que operación esta disparando nuestro trigger, así como obtener el o el conjunto de registros que lo estan disparando, usamos lo que se conoce como variables de contexto, todas contenidad}s en la clase **System.trigger** 

- **operationType:** Retorna un Enum correspondiente a la operación actual. 
- **Size** : Permite saber la cantidad de registros que disparo la operación. 

```Apex
System.debug('Operación: '+Trigger.operationType);
System.debug('Número registro: '+Trigger.size);
```
- **isInsert:** Esta variable me retorna un true si el trigger se esta disparando por una operación de insert. Cada operación tiene su propia variable. 

```Apex
System.debug('¿La operación es insert?: '+Trigger.isInsert);
System.debug('¿La operación es update?: '+Trigger.isUpdate);
```

- **isBefore y isAfter:** Me permiten saber si el trigger se esta ejecutando en un contexto de Before o After. 

```Apex
System.debug('¿La operación esta en un Before?: '+Trigger.isBefore);
System.debug('¿La operación esta en un After?: '+Trigger.isAfter);
```
