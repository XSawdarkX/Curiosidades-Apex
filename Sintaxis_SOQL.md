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
List<Account> aa = [SELECT Id, Name FROM Account];
``` 

En el ejemplo de arriba estoy obteniendo accediendo a los campos Id, y Name del objeto Account. 

## Referencias

1. [ReferOne]()
