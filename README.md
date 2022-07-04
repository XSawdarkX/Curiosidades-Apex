# Curiosidades Apex

Este repositorio tiene como objetivo consignar funciones útiles que se pueden usar cuando nos encontramos desarrollando con el Lenguaje de programación Apex.

## Dynamic Apex 

Dynamic Apex permite a los desarrolladores crear aplicaciones más flexibles con la ayuda de las siguientes hablididades:

### 1. Acceder a los metadatos correspondientes a la definición de un objeto y sus campos. 

Esto se puede lograr a través de dos maneras: 

#### 1. Tokens

Es una referencia ligera y serializable a un sObject o un campo que se valida en tiempo de compilación.
     
El token de un sObject o un campo se puede obtener ya sea de una **Member variable** o del método **getSObjectType()** / **getSObjectField()**

```Apex
//OBJETO
        
//obtener Token con member variable 
Schema.sObjectType tokenObjectMV = Account.sObjectType;
System.debug('Sobject Account token: '+tokenObjectMV);

//obtener Token con getSObjectType() / getSObjectField()
Account objAccount = new Account();
Schema.sObjectType tokenObjectGSOT = objAccount.getSObjectType();
System.debug('Sobject Account token: '+tokenObjectGSOT);

//CAMPO

//obtener el Token de un campo
Schema.SObjectField tokenFieldMV = Account.Name;
System.debug('Field Name Account token: '+tokenFieldMV);
```

Apartir de los token, se puede obtener la descripción del Objeto o del Campo con el método **getDescribe()**. El resultado se guardara en el tipo de dato:
**Schema.DescribeSObjectResult** / **Schema.DescribeFieldResult** 

```Apex
//Obtiene el Describe usando Tokens
Schema.DescribeSObjectResult dsrToken = Account.sObjectType.getDescribe();
System.debug('Describe Token Account: '+dsrToken);

Schema.DescribeFieldResult Tokendfr = Account.Description.getDescribe();
System.debug('Describe token Account Description: '+Tokendfr);
```

También se puede obtener la Descripción con una **Member variable**
  
```Apex
//Obtiene el Describe usando una Member variable
Schema.DescribeSObjectResult dsrSchema = Schema.SObjectType.Account;
System.debug('Describe Schema Account: '+dsrSchema);

Schema.DescribeFieldResult dfr = Schema.sObjectType.Account.fields.Name;
System.debug('Describe Schema Account Name: '+dfr);
```  
  
#### 2. Usando describeSObjects Schema method

     Es un método de la clase Schema
