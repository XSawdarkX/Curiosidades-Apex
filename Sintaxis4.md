# Sintaxis

Este módulo tiene como propósito explicar la sintaxis básica de Apex, lo que incluye:

- [Definición y asignación de variables]() 
- [Constantes]()
- [Comentarios]()
- [Mensajes de depuración]()
- [Colecciones]()
- Condicionales
- [Ciclos]()
- [Manejo de excepciones]()
- [Definición de clases y métodos]()

## Condicionales

Un condicional, como su nombre lo indica, es una sentencia que evalúa una condición. Si la condición se cumple se realiza una acción.

La sintaxis básica de un condicional es: 

if(condición){
  acciones..
}

```Apex
Integer edad = 15;

if(edad > 17){
  System.debug('Soy mayor de edad');
}

//Result 
``` 
En este caso, como la condición no se cumple, simplemente no pasa nada. Sin embargo, también es posible configurar una acción para cuando no se cumple la condición a través de la palabra reservada **else**. 

```Apex
Integer edad = 15;

if(edad > 17){
  System.debug('Soy mayor de edad');
}else{
  System.debug('No soy mayor de edad');
}

//Result No soy mayor de edad
``` 




## Referencias

1. [Condicionales](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_if_else.htm)
2. [Switch](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_switch.htm)
