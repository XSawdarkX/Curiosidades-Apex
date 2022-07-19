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

SOSL es un lenguaje propio de Salesforce que permite consultar un término o una frase en diferentes objetos. SOSL es más útil cuando no sabemos en qué campos y objetos residen nuestros datos.  

La sintaxis básica de este tipo de consultas es:

FIND {SearchQuery} 

El resultado de una consulta SOSL se almacena en una lista de lista de objetos. 

En el siguiente ejemplo se busca el término  "Mundo" en todos los objetos de la instancia. Cualquier objeto estándar o personalizado que contenga esta palabra en alguno de sus campos será  retornado. 

```Apex
List<List<SObject>> searchList = [FIND 'Mundo'];
``` 

## Referencias

1. [ReferOne]()

