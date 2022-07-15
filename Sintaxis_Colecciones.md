# Sintaxis

Este módulo tiene como propósito explicar la sintaxis básica de Apex, lo que incluye:

- [Definición y asignación de variables](https://github.com/XSawdarkX/Curiosidades-Apex/edit/main/Sintaxis_Variables.md) 
- [Constantes](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Constantes.md)
- [Comentarios](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Constantes.md)
- [Mensajes de depuración](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Constantes.md)
- Colecciones
- [Condicionales](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Condicionales.md)
- [Ciclos](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Ciclos.md)
- [Manejo de excepciones](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Excepciones.md)
- [Definición de clases y métodos](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_ClasesMetodos.md)

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

#### Listas con notación de Array

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

### Set

Un Set es una colección desordenada de elementos. Esto quiere decir que ningún elemento corresponde con alguna posición. Tampoco admite valores duplicados como si lo hace una Lista. 

Para definir un set se usa la siguiente sintaxis

Set\<Tipo de dato\> [nombreVariable] = new Set\<Tipo de dato\>(); 

```Apex
Set<String> colores = new Set<String>();
colores.add('Rojo');

Set<String> colores = new Set<String>{'Rojo','Verde','Morado'};
``` 
El set tiene una clase propia con sus respectivos métodos, y de hecho comparte muchos de ellos con la lista, como: **add()**,**clear()**,**isEmpty()**,**contains()**,y el **size()**. 

Sin embargo, aquellos métodos que vimos anteriormente y que involucraban la posición del elemento, se modifican un poco o por fuerza ni siquiera existen, como el caso del método **get()**,**set()**, y la segunda forma del método **add()**. El método **remove()** existe, pero en vez de especificar la posición se usa el elemento literal.

```Apex
Set<String> colores = new Set<String>{'Rojo','Verde','Morado'};
//Result: Rojo,Verde,Morado

colores.remove('Verde');
//Result: Rojo,Morado
``` 
El método **sort()** no existe ya que por defecto un set ordena todos los elementos de manera ascendente. 

```Apex
Set<String> colores = new Set<String>{'Rojo','Verde','Morado'};
//Result: Morado,Rojo,Verde
``` 
### Map

Un Map es una colección de elementos que funciona con una combinación **llave-valor**. Tanto las llaves como los valores aceptan básicamente cualquier tipo de dato.
Las llaves no se pueden repetir. 

Para definir un Mapa se usa la siguiente sintaxis:

Map\<Tipo de dato llave,Tipo de dato valor\> [nombreVariable] = new Map\<Tipo de dato llave,Tipo de dato valor\>(); 

```Apex
Map<String, String> country_currencies = new Map<String, String>();
``` 
Al igual que las anteriores colecciones, el mapa también cuenta con su propia clase y métodos.

Dentro de los métodos principales del mapa están: 

- **put()** : Permite agregar un elemento al mapa. 

```Apex
Map<String, String> country_currencies = new Map<String, String>();
country_currencies.put('Colombia','COP');

//Result Colombia:COP
```   
También es posible precargar valores en el mapa.

```Apex
Map<String, String> country_currencies = new Map<String, String>{'Colombia' => 'COP'};
//Result Colombia:COP
```   
Debido a que la llave debe ser única, cuando intentamos insertar un nuevo elemento al mapa con una llave que ya existe, simplemente se sobrescribe el valor.

```Apex
Map<String, String> country_currencies = new Map<String, String>{'Colombia' => 'COP'};
country_currencies.put('Colombia','EUR');

//Result Colombia:EUR
```   

- **containsKey()** : Permite saber si una llave en especifico esta contenida en el mapa. Devuelve un **true** si lo esta, y un **false** si no.

```Apex
Map<String, String> country_currencies = new Map<String, String>{'Colombia' => 'COP'};
Boolean existeValor = country_currencies.containsKey('Colombia');

//Result true
```  

- **get()** : Permite obtener un valor a partir de la llave.

```Apex
Map<String, String> country_currencies = new Map<String, String>{'Colombia' => 'COP'};
String pesoColombiano = country_currencies.get('Colombia');

//Result COP
```  

- **keySet()** : Devuelve un Set con las llaves del mapa. Debido a que las llaves funcionan como un set, estas se ordenan de manera ascendente.

```Apex
Map<String, String> country_currencies = new Map<String, String>{'Colombia' => 'COP','España' => 'EUR','EEUU' => 'US'};
Set<String> lstCountries = country_currencies.keySet();

//Result Colombia,EEUU,España
```  
- **values()** : Devuelve una lista con los valores del mapa.

```Apex
Map<String, String> country_currencies = new Map<String, String>{'Colombia' => 'COP','España' => 'EUR','EEUU' => 'US'};
List<String> lstCurrencies = country_currencies.values();

//Result COP,EUR,US
```  

### Cosas a tener en cuenta

- Todas las colecciones pueden contener lo que se conoce como **nested collections**, es decir, es posible tener Listas,Sets y Mapas anidados unos dentro de otros hasta una profundidad de 8 contando con la definición original, por lo que las siguientes sentencias son validas.

```Apex
List<List<List<List<List<List<List<List<String>>>>>>>> nestedList = new List<List<List<List<List<List<List<List<String>>>>>>>>();

Set<Set<Set<Set<Set<Set<Set<Set<String>>>>>>>> nestedSet = new Set<Set<Set<Set<Set<Set<Set<Set<String>>>>>>>>();

Map<String,Set<Set<Set<Set<Set<Set<Set<String>>>>>>>> nestedMap= new Map<String,Set<Set<Set<Set<Set<Set<Set<String>>>>>>>>();

Map<String,List<Set<Map<Integer,Integer>>>> nestedMapListSet = new Map<String,List<Set<Map<Integer,Integer>>>>();
``` 

## Referencias

1. [Listas](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_collections_lists.htm)
2. [List Class](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_list.htm#apex_System_List_sort)
3. [Sets](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_collections_sets.htm)
4. [Set Class](https://developer.salesforce.com/docs/atlas.en-us.238.0.apexref.meta/apexref/apex_methods_system_set.htm)
5. [Maps](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_collections_maps.htm)
6. [Map Class](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_map.htm)
