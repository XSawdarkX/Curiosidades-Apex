# Triggers

Los triggers son acciones personalizadas que se ejecutan antes o después de los cambios en los registros de Salesforce.  

un Trigger se ejecuta después de aplicar alguna de las siguientes operaciones:

- insert
- update
- delete
- merge
- upsert
- undelete, no sepuede usar en before

Se pueden definir Triggers para objetos estándar y personalizados.

Hay dos tipos de triggers: 

- **Before Triggers:** Son usados para validar o actulizar valores antes de que el registro se guarde en la base de datos. 
- **After Triggers:** Son usados para acceder a valores que ya se encuentran persistidos en la base de datos. También para hacer cambios en otros registros diferentes a los que dispararon el trigger.

Los registros que disparan el trigger, son de solo lectura en un after. No es posible aplicar un dml sobre el mismo registro que disparo un trigger en el before.

```Apex
List<Libro__c> lstLibros = Trigger.new; 
for(Libro__c objLibro : lstLibros){
   objLibro.Name = 'Alicia en el país de ls maravillas';
}

update lstLibros;
```

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

Estructuras mal optimizdas:

```Apex
if(Trigger.isbefore && Trigger.isInsert){
        
}
    
if(Trigger.isAfter && Trigger.isInsert){
        
}
```

```Apex
if(Trigger.isbefore && Trigger.isInsert){
        
}
    
if(Trigger.isAfter && Trigger.isInsert){
        
}
```
```Apex
if(Trigger.isInsert){
   if(Trigger.isbefore){

   }

   if(Trigger.isAfter){

   } 
}
```
Estructura correcta:

```Apex
if(Trigger.isbefore){
    if(Trigger.isInsert){
      System.debug('Entro en el before Insert');
  }

    if(Trigger.isUpdate){
      System.debug('Entro en el before update');
  }

    if(Trigger.isDelete){
      System.debug('Entro en el before delete');
  }

}

if(Trigger.isAfter){
    if(Trigger.isInsert){
      System.debug('Entro en el after Insert');
  }

    if(Trigger.isUpdate){
      System.debug('Entro en el after update');
  }

    if(Trigger.isDelete){
      System.debug('Entro en el before delete');
  }

    if(Trigger.isUndelete){
      System.debug('Entro en el before undelete');
  }
}
```

- **New:** Retorna una lista con la nueva versión de los registros. Solo se puede usar en las operaciones insert, update y undelete.  Y los registros solo pueden ser modificados en los before insert. Si se usa en una operación que no es valida no arroja error, pero tampoco se imprime nada. 

```Apex
List<Libro__c> lstLibrosVN = Trigger.new; 
System.debug('lstLibrosVN: '+lstLibrosVN[0]);
```

- **old:** Retorna una lista con la vieja versión de los registros. Solo se puede usar en las operaciones update, delete.


```Apex
List<Libro__c> lstLibrosVN = Trigger.new; 
List<Libro__c> lstLibrosVV = Trigger.old; 

Decimal cantidadNueva = lstLibrosVN[0].IP_Cantidad__c;
Decimal cantidadVieja = lstLibrosVV[0].IP_Cantidad__c;

System.debug('cantidadNueva: '+cantidadNueva);
System.debug('cantidadVieja: '+cantidadVieja);
```
- **newMap:** Retorna una mapa con la nueva versión de los registros. La llave es el Id del registro. Solo se puede usar en before Update, after insert, after update,after undelete.

```Apex
Map<Id,Libro__c> mapIdxLibro = Trigger.newMap;

for(Id idLibro :mapIdxLibro.keySet()){
   System.debug('Name book: '+mapIdxLibro.get(idLibro).Name);
}
```

- **oldMap:** Retorna una mapa con la vieja versión de los registros. La llave es el Id del registro. Solo se puede usar en el update y en el delete.

```Apex
List<Libro__c> lstLibros = Trigger.new; 
Map<Id,Libro__c> mapIdxLibro = Trigger.oldMap;

for(Libro__c objLibro : lstLibros){
   System.debug('New Name book: '+objLibro.Name);
   System.debug('Old Name book: '+mapIdxLibro.get(objLibro.Id).Name);
}
```
Si yo quiero usar el camopo de mi registro padre, si o si debo realizar una consulta en el contexto after. 

Si yo intento hacer esto a través de la variable de entorno Trigger.new no es posible

```Apex
List<Libro__c> lstLibros = Trigger.new;
System.debug('Entro en el before update : '+lstLibros[0].Autor__r.Name);
```

### Excepciones

Es posible utilizar el método **addError(message)** para imprimir un mensaje de error en pantalla y evitar que la operación dml que estoy haciendo. Cuando la operación es un insert o un update el método funciona en el Trigger.New, cuando es un delete en el Trigger.old.

```Apex
//Before upddate
List<Libro__c> lstLibros = Trigger.new;
            
if(lstLibros[0].IP_Cantidad__c > 10){
   lstLibros[0].addError('El máximo stock de un libro es 10'); 
}
```

```Apex
//Before delete
List<Libro__c> lstLibros = Trigger.old;
            
if(lstLibros[0].IP_Cantidad__c > 0){
    lstLibros[0].addError('No puede eliminar un libro que tiene stock'); 
}
```

Este método solo se puede usar en las variables de contexto new y old. Si yo intento usarlo sobre un registro de una consulta el sistema arroja un error.

```Apex
List<Libro__c> lstLibros = [Select Id,IP_Cantidad__c from  Libro__c where Id IN :Trigger.new];
            
if(lstLibros[0].IP_Cantidad__c > 10){
   lstLibros[0].addError('El máximo stock de un libro es 10'); 
}
```
Los try catch no capturan el método addError. 

```Apex
try{
   List<Libro__c> lstLibros = Trigger.new;

   if(lstLibros[0].IP_Cantidad__c > 10){
     lstLibros[0].addError('El máximo stock de un libro es 10'); 
   }
}catch(Exception e){
   System.debug('Entro catch'); 
}
```

### Consideraciones:

- Cuando elimino un registro de la Papelera de reciclaje, no se me ejecuta el Trigger.
- Siempre diseñar la logica para que funcione masiva y simultaneamente. 
- Tener cuidado con las recursiones

```Apex
if(Trigger.isUpdate){
   System.debug('Entro en el after update');
   List<Libro__c> lstLibros = [Select Id,IP_Cantidad__c from  Libro__c where Id IN :Trigger.new];
   update lstLibros;
}
```
Las recursiones se pueden evitar por medio de condiciones o controlando la ejecución del trigger teniendo en cuenta que cuando se genera una recursion todo se ejecuta en la misma transacicón. Esto se puede comprobar fácilmente haciendo uso de la clase limits para validar el número de dmls que se han hecho.

La profundidad máxima de un trigger es de 15 ejecuciones:

```Apex
 System.debug('Cantidad dml: '+limits.getDmlStatements());
```

Forma 1 de controlar la recursividad:

```Apex
if(IP_TriggerExecutionControl_cls.isTriggerActive('IP_Libro_tgr')){

  if(Trigger.isbefore){
      if(Trigger.isInsert && !IP_TriggerExecutionControl_cls.hasAlreadyDone('IP_Libro_tgr', 'BeforeInsert')){
          System.debug('Entro en el before Insert');
      }

      if(Trigger.isUpdate && !IP_TriggerExecutionControl_cls.hasAlreadyDone('IP_Libro_tgr', 'BeforeUpdate')){
          System.debug('Entro en el before update');
          IP_LibroHandler_cls.onBeforeUpdate(Trigger.New);
      }

      if(Trigger.isDelete && !IP_TriggerExecutionControl_cls.hasAlreadyDone('IP_Libro_tgr', 'BeforeDelete')){
          System.debug('Entro en el before delete');
      }

  }

  if(Trigger.isAfter){
      if(Trigger.isInsert && !IP_TriggerExecutionControl_cls.hasAlreadyDone('IP_Libro_tgr', 'AfterInsert')){
          System.debug('Entro en el after Insert');
      }

      if(Trigger.isUpdate && !IP_TriggerExecutionControl_cls.hasAlreadyDone('IP_Libro_tgr', 'AfterUpdate')){
          System.debug('Entro en el after update');
          //IP_TriggerExecutionControl_cls.setAlreadyDone('IP_Libro_tgr','AfterUpdate');
      }

      if(Trigger.isDelete && !IP_TriggerExecutionControl_cls.hasAlreadyDone('IP_Libro_tgr', 'AfterDelete')){
          System.debug('Entro en el after delete');
      }

      if(Trigger.isUndelete && !IP_TriggerExecutionControl_cls.hasAlreadyDone('IP_Libro_tgr', 'AfterUndelete')){
          System.debug('Entro en el after undelete');
      }
  }
}
```

Forma 2:

```Apex

```

- Manejar la estructura Trigger --> Handler --> Helper
