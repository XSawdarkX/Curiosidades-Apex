# Metadata personalizada


Una metadata personalizada se puede consultar a través de SOQL

```Apex
for(Integer i = 0; i < 105; i++){
    List<Wiki_Autor__mdt> wikiDeAutor = [Select id, MasterLabel, pagwiki__c 
                                         FROM Wiki_Autor__mdt]; 
}

System.debug('Cantidad consultas: '+Limits.getQueries());
```
