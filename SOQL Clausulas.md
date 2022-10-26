# SOQL Cláusulas

## HAVING

La cláusula **HAVING** puede filtrar valores agrupados. También permite filtrar por cualquier campo especificado en la clausula **GROUP BY**. 

Para filtrar por cualquier otro campo es necesario agregar la clausula **WHERE**.

```Apex
SELECT LeadSource, COUNT(Name)
FROM Lead
GROUP BY LeadSource
HAVING COUNT(Name) > 100 and LeadSource > 'Phone'
```
## GROUP BY ROLLUP

Esta cláusula permite agregar subtotales sobre valores agrupados. Se pueden especificar hasta 3 campos como subtotales. 

```Apex
SELECT Autor__r.Name,IP_Disponible__c, count(Id) FROM libro__c
GROUP BY ROLLUP(Autor__r.Name,IP_Disponible__c)
```
