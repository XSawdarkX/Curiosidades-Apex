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

Es importante aclarar, que el resultado de una condición se devuelve como un true o un false dependiendo de si se cumple o no, en ese sentido la siguiente sentencia es válida. 

```Apex
if(true){
  System.debug('Entro if');
}

//Result Entro if
``` 
Es posible evaluar varias condiciones en diferentes if. Sin embargo, el sistema entrara en todos los if que cumplan la condición. 

```Apex
Integer edad = 15;
String result = '';

if(edad > 16){
  result = 'a';
}

if(edad > 13){
  result = 'b';
}

if(edad > 14){
  result = 'c';
}

//Result c
``` 
En el ejemplo de arriba, el sistema evalúa todos los if independientemente si entra en ellos o no, en nuestro ejemplo el sistema entro en el segundo y tercer if, por lo que el valor de la variable en un momento fue **b**, pero al final es reemplazado por el valor **c**. 

También se puede usar una estructura llamada **else-if** para evaluar diferentes condiciones. 

```Apex
Integer edad = 15;
String result = '';

if(edad > 16){
  result = 'a';
}else if(edad > 13){
  result = 'b';
}else if(edad > 14){
  result = 'c';
}else{
  result = 'No cumplio ninguna condición';
}

//Result b
``` 

A diferencia de la primera forma, en este caso el sistema comienza a evaluar las condiciones, y si se cumple una, ya no evalúa las que están  más abajo. En el ejemplo de arriba, al cumplirse el segundo if, ya no se evalúa el tercero ni el else, por lo que el resultado final es el valor **b**.

Cuando no más debemos realizar una acción dentro del if o el else, y por acción me refiero a tener una sola línea de código, es posible omitir las llaves.

```Apex
Integer edad = 15;

if(edad > 17)
  System.debug('Soy mayor de edad');
else
  System.debug('No soy mayor de edad');


//Result No soy mayor de edad
``` 

El siguiente ejemplo arrojara un error ya que dentro del if hay más de una línea de código, por lo que es necesario usar llaves. 

```Apex
Integer edad = 15;

if(edad > 17)
  System.debug('Soy mayor de edad');
  System.debug('Segunda acción');
else
  System.debug('No soy mayor de edad');


//Result
``` 

## Switch

Un Switch es una declaración que permite comparar una expresión con un conjunto de posibles valores.

Los valores pueden ser 



## Referencias

1. [Condicionales](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_if_else.htm)
2. [Switch](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_switch.htm)
