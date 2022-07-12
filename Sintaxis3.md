# Sintaxis

Este módulo tiene como propósito explicar la sintaxis básica de Apex, lo que incluye:

- [Definición y asignación de variables]() 
- [Constantes]()
- [Comentarios]()
- [Mensajes de depuración]()
- Colecciones
- [Condicionales]()
- [Ciclos]()
- [Manejo de excepciones]()
- [Definición de clases y métodos]()

## Colecciones

Las colecciones básicamente son un tipo de variable que permite almacenar un conjunto de valores. Estos valores pueden ser casi de cualquier tipo de dato. No existe un límite en la cantidad de elementos que puede guardar una colección. 

Apex maneja tres diferentes colecciones: List, Set, y Map. 

### List

Una Lista es una colección ordenada de elementos. Esto quiere decir que cada elemento dentro de la lista corresponde con una posición especifica. Las posiciones se comienzan a contar desde 0.

Para definir e inicializar una lista se utiliza la siguiente sintaxis:

list\<Tipo de dato\> [nombreVariable] = new list\<Tipo de dato\>(); 

```Apex
list<String> colores = new list<String>();
``` 
Todas las colecciones en el fondo se pueden entender como Clases, las cuales cuentan con una serie de métodos para interactuar con sus elementos.      

Dentro de los métodos principales de la lista están:

- **add()** : Permite agregar un elemento en la lista. Se puede especificar o no la posición de la lista en la que se desea agregar el elemento, si no se especifica se agrega en la última posición.

```Apex
list<String> colores = new list<String>();
colores.add('Rojo');
colores.add('Azul');    
colores.add(1,'Amarillo');
  
//Result: Rojo,Amarillo,Azul  
``` 
También es posible precargar una lista con valores. 

```Apex
list<String> colores = new list<String>{'Rojo','Verde','Morado'};
``` 
- **size()** : Devuelve la cantidad de elementos que hay en la lista.

```Apex
list<String> colores = new list<String>{'Rojo','Verde','Morado'};
Integer cantidadColores = colores.size();

//Result: 3
``` 
- **get()** : Devuelve un elemento de la lista en base a su posición. 

```Apex
list<String> colores = new list<String>{'Rojo','Verde','Morado'};
String colorRojo = colores.get(0);

//Result: Rojo
``` 
- **set()** : Permite modificar un elemento de la lista en base a su posición.

```Apex
list<String> colores = new list<String>{'Rojo','Verde','Morado'};
//Result: Rojo,Verde,Morado

colores.set(1,'Lila');
//Result: Rojo,Lila,Morado
``` 
- **contains()** : Permite saber si un elemento existe dentro de la lista. Devuelve un **true** si lo contiene y un **false** si no.

```Apex
list<String> colores = new list<String>{'Rojo','Verde','Morado'};
Boolean existeVerde = colores.contains('Verde');

//Result: true
``` 
- **isEmpty()** : Permite saber si la lista contiene al menos un valor. Devuelve un **true** si la lista esta vacía y un **false** si no.

```Apex
list<String> colores = new list<String>{'Rojo','Verde','Morado'};
Boolean listaVacia = colores.isEmpty();

//Result: false
``` 
- **remove()** : Permite eliminar un elemento de la lista en base a su posición.

```Apex
list<String> colores = new list<String>{'Rojo','Verde','Morado'};
//Result: Rojo,Verde,Morado

colores.remove(1);
//Result: Rojo,Morado
``` 
- **clear()** : Permite eliminar todos los elementos de la lista.

```Apex
list<String> colores = new list<String>{'Rojo','Verde','Morado'};
//Result: Rojo,Verde,Morado

colores.clear();
//Result: 
``` 
- **sort()** : Ordena los elementos de la lista en modo ascendente. 

```Apex
list<String> colores = new list<String>{'Rojo','Verde','Morado','Azul'};
//Result: Rojo,Verde,Morado,Azul

colores.sort();
//Result: Azul,Morado,Rojo,Verde
``` 

Si tengo una lista de enteros o fechas se ordenan de menor a mayor. 

### Listas con notación de Array

Es posible crear una lista como normalmente se declara un **array**. El termino para ello es: **one-dimensional lists**. Cuando se define este tipo de lista se especifica la cantidad de elementos que puede contener.

En ese sentido, las siguientes sentencias son válidas. Las dos últimas son equivalentes. 

```Apex
String[] colors = new List<String>();

List<String> colors = new String[1];
String[] colors = new String[1];
``` 

Para agregar un elemento usando este tipo de notación, se usa la siguiente sintaxis.  

```Apex
List<String> colors = new String[1];
colores[0] = 'Green';

Result: Green
``` 

Aunque la lista está definida para contener solo 1 elemento, si se usa el método **add()** este límite no aplica.

## Referencias

1. [Listas](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_collections_lists.htm)
2. [List Class](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_list.htm#apex_System_List_sort)
3. [Sets]()
4. [Maps]()
5. 
