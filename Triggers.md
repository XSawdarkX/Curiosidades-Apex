# Triggers

Los triggers son acciones personalizadas que se ejecutan antes o después de los cambios en los registros de Salesforce.  

un Trigger se ejecuta después de aplicar alguna de las siguientes operaciones:

- insert
- update
- delete
- merge
- upsert
- undelete

Se pueden definir Triggers para objetos estpandar y personalizados.

Hay dos tipos de triggers: 

- Before Triggers: Son usados para validar o actulizar valores antes de que el registro se guarde en la base de datos. 
- After Triggers: Son usados para acceder a valores que ya se encuentran persistidos en la base de datos. También para hacer cambios en otros registros diferentes a los que dispararon el trigger.

Los registros que disparan el trigger, son de solo lectura en un after. No es posible aplicar un dml sobre el mismo registro que disparo un trrigger en el before.

Si necesito hacer un callout en un Trigger, este se debe ejecutar en un contexto asincrono para no bloquear el proceso.  

Para que se ejecute la lógica en una operación dml especifica, se debe agregar esa operación con su tipo en la definición del trigger.

```Apex
trigger IP_Libro_tgr on Libro__c (before insert,after insert,before update,after update) {

}
```
