# Sintaxis

Este módulo tiene como propósito explicar la sintaxis básica de Apex, lo que incluye:

- [Definición y asignación de variables](https://github.com/XSawdarkX/Curiosidades-Apex/edit/main/Sintaxis_Variables.md) 
- [Constantes](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Constantes.md)
- [Comentarios](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Constantes.md)
- [Mensajes de depuración](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Constantes.md)
- [Colecciones](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Colecciones.md)
- [Condicionales](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Condicionales.md)
- Ciclos
- [Manejo de excepciones](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Excepciones.md)
- [Definición de clases y métodos](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_ClasesMetodos.md)

## SOSL

SOSL es un lenguaje propio de Salesforce que permite consultar un término o una frase en diferentes objetos. SOSL es más útil cuando no sabemos en qué campos y objetos residen nuestros datos. Sus siglas significan: Salesforce Object Search Language.  

La sintaxis básica de este tipo de consultas es:

FIND {SearchQuery} 

En el siguiente ejemplo se busca el término  "Mundo" en todos los objetos de la instancia. Cualquier objeto estándar o personalizado que contenga esta palabra en alguno de sus campos será  retornado. 

```Apex
FIND {Mundo}
``` 
También es posible indicar en qué tipo de campos realizar la búsqueda. Si no se especifica este parámetro, por defecto se realiza la búsqueda en todos los campos. Para especificar el tipo de campo usamos la cláusula **IN**.

En el siguiente ejemplo se busca el término "Mundo" en los campos Tipo Name de todos los objetos de la instancia.

```Apex
FIND {Mundo} IN NAME FIELDS
``` 
Los posibles valores como tipo de campo son:

- ALL FIELDS	
- EMAIL FIELDS
- NAME FIELDS
- PHONE FIELDS
- SIDEBAR FIELDS

Incluso, si se desea ser más específico, podemos indicar en que objetos realizar la búsqueda con la cláusula **RETURNING**.

```Apex
FIND {Mundo} IN NAME FIELDS RETURNING Account,Contact
``` 

El ejemplo de arriba busca la palabra "Mundo" en los campos Name de los objetos estándar Account y Contact. 

Además, es posible usar clausulas como LIMIT, ORDER BY, WHERE, y especificar que campos retornar por objeto. Si no se indican los campos, como en los ejemplos anteriores, Salesforce trae por defecto solo el Id. 

Teniendo en cuenta esto, los siguientes ejemplos son validos:

```Apex
FIND {Mundo} IN NAME FIELDS RETURNING Libro__c (Name, IP_NumeroSerie__c ORDER BY Name)

FIND {Mundo} IN NAME FIELDS RETURNING Libro__c (Name LIMIT 3)

FIND {Mundo} IN NAME FIELDS RETURNING Libro__c (Name WHERE Name like '%faro%')
``` 

Si bien la única palabra obligatoria para una consulta SOSL es **FIND**, Apex obliga a precisar en qué objetos buscar, por lo que la cláusula RETURNING también se vuelve obligatoria. 

El resultado de una consulta SOSL se almacena en una lista de lista de objetos. En apex, en vez de colocar el térmmino en llaves {}, se hace en comillas. 

```Apex
List<List<SObject>> searchList = [FIND 'Mundo' IN NAME FIELDS RETURNING Libro__c]; 

for(List<SObject> lstObjetos : searchList){
    for(SObject registro : lstObjetos){
       System.debug('registro: '+registro); 
    }
}
``` 

```Apex
List<List<SObject>> searchList = [FIND 'Mundo' IN NAME FIELDS RETURNING Autor__c(Name),Libro__c(Name)];

List<Autor__c> lstAutor = searchList.get(0);
List<Libro__c> lstLibro = searchList.get(1);

System.debug('Objeto Autor__c');
for(Autor__c objAutor : lstAutor){
    System.debug('Autor__c Name: '+objAutor.Name);
}

System.debug('Objeto Libro__c');
for(Libro__c objLibro : lstLibro){
    System.debug('Libro__c Name: '+objLibro.Name);
}
```

## Referencias

1. [SOSL](https://developer.salesforce.com/docs/atlas.en-us.soql_sosl.meta/soql_sosl/sforce_api_calls_sosl.htm)

