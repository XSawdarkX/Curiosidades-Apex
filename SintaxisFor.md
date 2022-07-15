# Sintaxis

Este módulo tiene como propósito explicar la sintaxis básica de Apex, lo que incluye:

- [Definición y asignación de variables]() 
- [Constantes]()
- [Comentarios]()
- [Mensajes de depuración]()
- [Colecciones]()
- [Condicionales]()
- Ciclos
- [Manejo de excepciones]()
- [Definición de clases y métodos]()

## Ciclos

Un ciclo es una sentencia que permite ejecutar en repetidas ocasiones un bloque de código hasta que deje de cumplirse una condición.

Los ciclos que maneja Apex son:  

- For tradicionales
- For each
- SOQL For
- While
- Do while

### For tradicionales

La estructura de un for tradicional es la siguiente: 

for (variable; condicion; incremento) {
    bloque de código
}

El for tradicional se ejecuta en el siguiente orden:

1. **Variable:** Se define la o las variables con las que vamos a operar el for.
2. **Condición:** Se evalúa la condición. Esta condición es la que determina si se sigue repitiendo o no el bloque de código. 
3. **Bloque de código:** conjunto de instrucciones que ejecuta el sistema si se cumple la condición.
4. **Incremento:** Aumenta el valor de mi variable inicial en +1 para que eventualmente deje de cumplirse la ejecución y haya un número finito de repeticiones. 
5. Se ejecuta todo nuevamente desde el paso **2**. 

```Apex
for (Integer i = 0, j = 10; i < j; i++) {
    System.debug(i+1);
}

//Result 1,2,3,4,5,6,7,8,9,10
``` 
En el ejemplo de arriba se imprimen los números del 1 al 10, ya que cuando la variable **i** alcanza el valor de 10 gracias al incremental, la condición deja de cumplirse.

### For each

Este tipo de for permite recorrer una lista o un set de elementos. No existe una condición explicita, pero se podría tomar el tamaño o la cantidad de elementos como la condición a cumplir. Es decir, si la lista tiene 3 elementos, el for se ejecutará 3 veces. 

La estructura de un for each es la siguiente: 

for (variable : lista_or_set) {
     bloque de código
}

En cada iteración del for se asigna momentáneamente un elemento de la colección a la variable, hasta que se recorran todos los valores o se rompa el ciclo. 

El siguiente ejemplo es el equivalente al del for tradicional que vimos previamente. 

```Apex
Integer[] lstValores = new Integer[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

for (Integer valor : lstValores) {
    System.debug(valor);
}

//Result 1,2,3,4,5,6,7,8,9,10
``` 
Es importante tener presente que la variable debe ser del mismo tipo de la colección.  

## Referencias

1. [For tradicional]()
2. [List and Set For]()