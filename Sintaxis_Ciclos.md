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

En cada iteración del for se asigna momentáneamente un elemento de la colección a la variable hasta que se recorran todos los valores o se rompa el ciclo. 

El siguiente ejemplo es el equivalente al del for tradicional que vimos previamente. 

```Apex
Integer[] lstValores = new Integer[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

for (Integer valor : lstValores) {
    System.debug(valor);
}

//Result 1,2,3,4,5,6,7,8,9,10
``` 
Es importante tener presente que la variable debe ser del mismo tipo que la colección.  

### SOQL For

Este tipo de for es propio de Apex. Su propósito es recorrer o iterar sobre un conjunto de registros pertenecientes a un objeto estándar o personalizado. 

Su sintaxis es similar a un for each:

for (variable : [soql_query]) {
    code_block
}

o

for (variable_list : [soql_query]) {
    code_block
}

Es importante mencionar que tanto la variable como la lista deben ser del mismo objeto sobre el cual estoy haciendo la consulta.

```Apex
for (Account a : [SELECT Id, Name from Account where Name = 'Facebook']) {
    System.debug('Account Name:'+ a.Name);
}

//Result Account Name: Facebook
``` 

En el ejemplo de arriba, el sistema ejecuta la consulta a la base de datos y retorna todas las cuentas que cumplan con la condición. Cada cuenta se almacena momentáneamente en la variable **a**. 

También es posible hacer la consulta previamente y almacenarla en una lista para luego recorrerla con un for each. 

```Apex
List<Account> lstAccount = [SELECT Id, Name from Account where Name = 'Facebook'];

for (Account a : lstAccount) {
    System.debug('Account Name:'+ a.Name);
}

//Result Account Name: Facebook
```
A primera vista los dos ejemplos anteriores son equivalentes. Sin embargo, se recomienda usar el SOQL for cuando se va a consultar una cantidad de registros muy amplia. Esto porque está mejor optimizado de cara al **Total heap size**. Este término hace referencia a la cantidad de información que se puede almacenar en memoria durante una transacción. 

#### SOQL For Format

Cuando hacemos uso de este for, podemos utilizar dos formatos como se muestra en la sintaxis definida previamente. Podemos usar una variable o una lista para ir almacenando los registros a medida que los recorremos. 

Cuando usamos el formato de lista, el for iterara cada 200 registros. Si usamos la variable normal, el for iterara por cada registro.

```Apex
//Supongamos que la consulta retorna 50 registros

//Variable format

Integer cantRecords = 0;
for (Account a : [SELECT Id, Name from Account where Name = 'Facebook']) {
    cantRecords++;
}

//Result 50

//List format

Integer cantRecords = 0;
for (List<Account> a : [SELECT Id, Name from Account where Name = 'Facebook']) {
    cantRecords++;
}

//Result 1
``` 
Se recomienda usar el formato de lista cuando se deben hacer transacciones sobre la base de datos dentro del for, ya que con esto evitamos el límite de operaciones sobre la base de 100 por proceso. 

### While

Este ciclo permite ejecutar repetidamente un bloque de código hasta que deje de cumplirse una condición.

Su sintaxis es: 

while (condición) {
    bloque de código
}

```Apex
Integer i = 0;

while (i < 10) {
     System.debug(i+1);
     i++;
}

//Result 1,2,3,4,5,6,7,8,9,10
```

### Do While

El Do while maneja la misma lógica del While, con la diferencia que este ciclo se ejecuta al menos una vez.

Su sintaxis es: 

do {
   code_block
} while (condition);

```Apex
Integer i = 0;

do {
  System.debug(i+1);
  i++;
} while (i < 1);

//Result 1
```

Cuando se ejecuta este tipo de while, el sistema ejecuta una vez lo que está dentro del **do**. Luego continúa funcionando normalmente evaluando en cada iteración si se sigue cumpliendo la condición o no para volver a ejecutar el código dentro del do. 

### Consideraciones ciclos

En todos los tipos de ciclos es posible utilizar las siguientes dos palabras reservadas:

- **Break:** Rompe o finaliza el ciclo.
- **Continue:** Se salta la iteración actual del ciclo. 

```Apex
for (Integer i = 0, j = 10; i < j; i++) {
    
    if ( i == 5)
        break;
        
    System.debug(i+1);
}

//Result 1,2,3,4,5
``` 

```Apex
for (Integer i = 0, j = 10; i < j; i++) {
    
    if ( i == 5)
        continue;
        
    System.debug(i+1);
}

//Result 1,2,3,4,5,7,8,9,10
``` 
También es importante tener cuidado a la hora de manipular las variables que permiten la repetición en los ciclos, ya que se pueden generar iteraciones infinitas, lo que causaría un error en el límite de tiempo de la cpu. Aquí unos ejemplos de ciclos infinitos.

```Apex
Integer i = 0;

while (i < 10) {
     System.debug(i+1);
}
``` 

```Apex
Integer[] lstValores = new Integer[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

for (Integer valor : lstValores) {
    System.debug(valor);
    lstValores.add(1);
}
``` 

## Referencias

1. [For tradicional](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_loops_for_traditional.htm)
2. [List and Set For](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_loops_for_lists.htm)
3. [SOQL For](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_loops_for_SOQL.htm)
4. [While](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_loops_while.htm)
5. [Do While](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_loops_do_while.htm)
