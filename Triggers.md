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

- Before Triggers: Son usados para validar o actulizar valores antes de que el registro se  guarde en la base de datos. 
- After Triggers: Son usados para acceder a valores que ya se encuentran persistidos en la base de datos. Tambipen para hacer cmabios en otros registros diferentes a los que dispararon el trigger.

Los registros que disparan el trigger, son de solo lectura en un after. 


```Apex
public class Vehiculo {

}
```
