# Dynamic Apex 

Dynamic Apex permite a los desarrolladores crear aplicaciones más flexibles con la ayuda de las siguientes hablididades:

## 1. Acceder a los metadatos correspondientes a la definición de un objeto y sus campos. 

Esto se puede lograr a través de dos maneras: 

### 1. Tokens

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
  
### 2. Usando describeSObjects Schema method

Es un método de la clase Schema que permite obtener el Describe de uno o varios Sobjects. 

```Apex
List<String> types = new List<String>{'Account','Book__c'};
Schema.DescribeSobjectResult[] results = Schema.describeSObjects(types); 
System.debug('Describe Schema Account, Book: '+results);
``` 
### Que sigue..     

Una vez se obtiene el Describe de un Objeto o un Campo, se puede acceder a su metadata. 

Para ver algunos pequeños ejemplos de lo que se puede hacer, por favor revisar la clase: 

## 2. Acceder a los metadatos correspondientes a la definición de una App y sus Tab.

También es posible obtener la metadata asociada a las Aplicaciones y a sus Tabs con el Describe. 

El tipo de dato para guardar la información de las Apps es: **Schema.DescribeTabSetResult**

A través del Result de las App, yo puedo acceder a sus correspondientes Tabs con el método **getTabs()**. 
Estas últimas se almacenan con el tipo de datos: **Schema.DescribeTabResult**

```Apex
List<Schema.DescribeTabSetResult> tabSetDesc = Schema.describeTabs();
        
for(DescribeTabSetResult tsr : tabSetDesc) {

  //Label App
  System.debug('Label App: ' + tsr.getLabel());
  List<Schema.DescribeTabResult> tabDesc = tsr.getTabs();

  String tabs = '';
  for(Schema.DescribeTabResult tr : tabDesc){
      //label of each tab belonging to the app
      tabs += tr.getLabel()+',';

  }

  tabs = tabs.removeEnd(',');
  System.debug('Label Tabs: ' + tabs);
}
``` 
