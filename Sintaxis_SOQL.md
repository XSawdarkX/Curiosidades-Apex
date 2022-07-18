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

## SOQL

SOQL es un lenguaje propio de Salesforce que permite realizar consultas en la base de datos. De hecho, sus siglas significan Salesforce Object Query Language.

Su sintaxis es similar al lenguaje SQL.

SELECT [campos] FROM [objeto] 

La palabra **SELECT** me permite especificar a que información quiero acceder (Campos), mientras que la palabra **FROM** me indica de que Tabla(Objeto) voy a obtener la información. 

```Apex
List<Account> lstAccount = [SELECT Id, Name FROM Account];
``` 
En el ejemplo de arriba estoy accediendo a los campos Id y Name del objeto Account. Los resultados de una consulta se pueden almacenar en una Lista o en un Mapa. 

```Apex
//List container
List<Account> lstAccount = [SELECT Id, Name FROM Account];

//Map container
Map<Id,Account> objAccount = new Map<Id,Account>([SELECT Id, Name FROM Account]);
``` 
También es posible guardar el resultado de una consulta en un objeto. Sin embargo, para ello es necesario asegurar que la consulta me devuelva un único registro. 
Esto se puede indicar con la palabra **LIMIT** seguido del número de registros máximos que quiero retornar en la consulta, en este caso 1. 

```Apex
Account objAccount = [SELECT Id, Name FROM Account LIMIT 1];
``` 
Es importante que la consulta retorne un registro. En dado caso que no exista ninguno, el sistema arrojara un error. Por eso se recomienda siempre almacenar los resultados en una lista. 

Teniendo en cuenta los ejemplos anteriores, podemos obtener como conclusión, que una consulta a la base de datos se puede almacenar en:

1. Un Objeto.
2. Una Lista.
3. Un Mapa.
4. Un Entero.

Para obtener como resultado de una consulta un número entero usamos el método **COUNT()** entre el SELECT y el FROM, es importante que solo se especifique el método sin ningún campo. Esto nos retorna la cantidad de registros que devuelve la consulta. 

```Apex
Integer cantCuentas = [SELECT COUNT() FROM Account];
``` 

## Referencias

1. [ReferOne]()
