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

- **Add()** : Permite agregar un elemento en la lista. Se puede especificar o no la posición de la lista en la que se desea agregar el elemento, si no se especifica se agrega en la última posición.

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


## Referencias

1. [Listas]()
2. [Sets]()
3. [Maps]()
4. 
