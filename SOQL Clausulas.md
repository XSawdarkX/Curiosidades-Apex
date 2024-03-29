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

## OFFSET

Esta cláusula permite saltarse x cantidad de registros sobre el resultado de una consulta. Máximo se pueden saltar 2000 registros. 

Se recomienda usar junto a las cláusulas **ORDER BY** y **LIMIT**.

```Apex
SELECT Name from Libro__c ORDER BY Name LIMIT 14 OFFSET 1
```
Siempre va a lo último de la consulta.

También es posible usarlo dandole un sentido de rango. Es decir, puedes obtener los 100 primeros registros, y luego los siguientes 100, y así sucesivamente.

Obtenemos los primeros 100 registros.

```Apex
SELECT Name, Id
FROM Merchandise__c
ORDER BY Name
LIMIT 100
OFFSET 0
```

obtenemos los registros del 101 al 201. 

```Apex
SELECT Name, Id
FROM Merchandise__c
ORDER BY Name
LIMIT 100
OFFSET 0
```
## WITH SECURITY_ENFORCED

Esta cláusula da la posibilidad de evaluar la seguridad a nivel de campo y a nivel de objeto. 

Apex generalmente corre en modo sistema, es decir, tiene permisos sobre todos los campos de todos los objetos. Para forzar la seguridad sobre dichos items, se utiliza la cláusula **WITH SECURITY_ENFORCED**. Esta solo tiene encuenta lo especificado en las cláusulas **SELECT** y **FROM**.

Se debe ubicar depués de las cláusulas **FROM**  o **WHERE**, y antes de **ORDER BY**, **LIMIT**, O **OFFSET**.

```Apex
List<Libro__c> lstLibros = [SELECT id,Name,IP_Cantidad__c FROM Libro__c WITH SECURITY_ENFORCED];
```

Si el usuario que ejecuta el código no tiene permisos sobre alguno de los campos, o sobre el objeto, el sistema arrojara un error de permisos insuficientes. 

