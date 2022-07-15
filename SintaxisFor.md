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

1. variable: Se define la variable con la que vamos a operar el for
2. condición: Se evalúa la condición. Esta condición es la que determina si se sigue repitiendo o no el bloque de código. 
3. bloque de código: conjunto de instrucciones que ejecuta el sistema si se cumple la condición.
4. incremento: Aumenta el valor de mi variable inicial en +1 para que eventualmente deje de cumplirse la ejecución y haya un número finito de repeticiones. 
5. Se ejecuta 

## Referencias

1. [For tradicional]()
2. [List and Set For]()
