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
