# Metadata personalizada

Un Custom metadata Type es un objeto, o un conjunto de objetos de metadatados, desde la definición del objeto, sus campos, sus formato de pagina, hasta los mismos registros son tratados como metadata. 

Cuando pasas un Custom metadata Type por conjunto de cambios, este incluye los registros. 

El nombre API de un Custom metadata Type termina con **mdt**, además este tipo de objeto puede tener su propios campos custom, puede tener relaiones con otros objetos de metadata, tiene su propio formato de pagina, y sus propias reglas de validación. 

Una metadata personalizada se puede consultar a través de SOQL. Sin embargo, dicha consulta no cuenta para los Limites de Salesforce, por lo que aunque no es recomendado, el código de abajo no genera error.

```Apex
for(Integer i = 0; i < 105; i++){
    List<Wiki_Autor__mdt> wikiDeAutor = [Select id, MasterLabel, pagwiki__c 
                                         FROM Wiki_Autor__mdt]; 
}

System.debug('Cantidad consultas: '+Limits.getQueries());
```

Se pueden construir funcionalidades cuyo comportamiento es determinado por los registros de estos objetos. 

Los registros de estos objeto se pueden leer, insertar y modificar, para estas dos última soperaciones es necesario usra la interface **DeployCallback**

```Apex
//This code generate error
Wiki_Autor__mdt objWiki = new Wiki_Autor__mdt();
objWiki.MasterLabel = 'Test';
insert objWiki;
```

Los Custom metadata Type se pueden usar en:

- Flujos
- Reglas de validación
- Process builder
- Campos formula
- Como valores por defecto
- En Apex

Casos de uso:

- Controlar información de manera dinamica y fácil sin tener que ajustar el código. Como crear pdfs
- Para guardar información sensible que solo usuarios especiales pueden manipular. Como los datos de conexíón a un servicio web
- Ejemplo Creditcorp homologación valores

# Custom Settings

Los Custom Settings son similares a los objetos personalizados. Son un conjunto de datos asociados a una organización, un perfil, o un usuario especifico.
