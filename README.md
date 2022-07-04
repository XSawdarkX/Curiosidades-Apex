# Curiosidades Apex

Este repositorio tiene como objetivo consignar funciones útiles que se pueden usar cuando nos encontramos desarrollando con el Lenguaje de programación Apex.

## Dynamic Apex 

Dynamic Apex permite a los desarrolladores crear aplicaciones más flexibles con la ayuda de las siguientes hablididades:

### 1. Acceder a los metadatos correspondientes a la definición de un objeto y sus campos. 

Esto se puede lograr a través de dos maneras: 

#### 1. Tokens

Es una referencia ligera y serializable a un sObject o un campo que se valida en tiempo de compilación.
     
El token de un sObject o un campo se puede obtener ya sea de una **member variable** o del método **getSObjectType()** / **getSObjectField()**

```apex
//obtener token con member variable 
Schema.sObjectType tokenMemberVariable = Account.sObjectType;
System.debug('Sobject Account token: '+tokenMemberVariable);
```
  
#### 2. Usando describeSObjects Schema method

     Es un método de la clase Schema
