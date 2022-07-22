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

## DML

DML es el lenguaje propio de Salesforce para realizar operaciones sobre la base de datos. Sus siglas significan Data Manipulation lenguage. 

Estas operaciones se pueden hacer sobre uno o varios registros al tiempo. Su sintaxis es la siguiente:

[Tipo de operación] [registro/Lista de registros]

Dentro de las operaciones que yo puedo realizar se encuentran:

- Insert
- Update
- Upsert
- Delete
- Undelete
- Merge

Una cosa importante a tener en cuenta es que solo se pueden realizar 150 operaciones por transacción, razón por la cual no es recomendado ejecutar dichas actividades dentro de un ciclo. 

Aquí un par de ejemplos utilizando la operación update:

```Apex
//Bad practices
List<Contact> conList = [Select Department , Description from Contact];
  
for(Contact badCon : conList) {
    if (badCon.Department == 'Finance') {
        badCon.Description__c = 'New description';
    }
    update badCon;
}

//Good practices
List<Contact> updatedList = new List<Contact>();
List<Contact> conList = [Select Department , Description from Contact];
  
for(Contact con : conList) {
    if (con.Department == 'Finance') {
        con.Description = 'New description';
        updatedList.add(con);
    }
}

update updatedList;
```   

Es importante tener presente que si hago una operación sobre una lista de registros, y alguno de ellos falla por algún motivo, se hace un **rollback** sobre toda la transacción. 

Además, como se mencionó anteriormente, es posible insertar una lista de registros, pero estos pueden ser de cualquier objeto, por lo tanto, el siguiente fragmento d código es válido.

```Apex
List<Sobject> lstRecords = new List<Sobject>();
    
Libro__c objLibro = new Libro__c();
objLibro.Name = 'Frankkenstein III';

lstRecords.add(objLibro);

Autor__c objAutor = new Autor__c();
objAutor.Name = 'Mary';
objAutor.Nacionalidad__c = 'Colombia';

lstRecords.add(objAutor);    

insert lstRecords;
```  

### Relacionar un registro padre con un registro hijo a través de un Id externo
  
Para llevar a cabo el enunciado y relacionar un registro padre con un registro hijo, normalmente se realizan los siguientes pasos:

1. Se consulta el registro padre. 
2. Se crea el registro hijo y se asocia al registro padre usando el Id retornado por la consulta del punto 1.
3. Se inserta/actualiza el registro hijo.

Sin embargo, si el registro padre tiene un campo marcado como **Id externo**, es posible evitar su consulta. Solo basta con usar el nombre de la relación entre los dos objetos, y el campo Id externo, para establecer la conexión entre ambos registros.

En el siguiente ejemplo se muestran las dos formas. Tener presente que el campo **N_mero_de_documento__c** en el objeto Autor esta marcado como Id externo.

```Apex
//Forma convencional

Autor__c objAutor = [SELECT id FROM Autor__c WHERE N_mero_de_documento__c = '1020658977' limit 1];

Libro__c objLibro = new Libro__c();
objLibro.Name = 'Los amigos del hombre';
objLibro.Autor__c = objAutor.Id;
objLibro.N_mero_de_serie__c = '10B';
    
insert objLibro;

//Forma con un Id externo

Libro__c objLibro = new Libro__c();
objLibro.Name = 'Los amigos del hombre II';
objLibro.Autor__r = new Autor__c(N_mero_de_documento__c = '1020658977');
objLibro.N_mero_de_serie__c = '09B';
    
insert objLibro;
``` 

Cabe mencionar que cuando un campo se marca o configura como Id externo, no quiere decir que sea obligatorio o único. Por lo tanto, siguiendo el ejemplo, si se especifica un número de documento que no existe, o uno que se repite más de una vez, el sistema arrojara un DMLException. 

### Crear un registro padre y un registro hijo en la misma transacción.

Continuando  con la lógica del punto anteior, también es posible, a través de un Id externo, crear un registro padre y un registro hijo con una sola operación DML.

Normalmente se tendrían que hacer los siguientes pasos:

1. Crear e insertar el registro Padre.
2. Consultar el registro Padre creado en el punto 1.
3. Crear el registro hijo asociándolo con el registro padre a través del Id devuelto por la consulta del punto 2.
4. Insertar el registro hijo.

Pero con el Id externo es posible realizar lo siguiente:

```Apex
List<Sobject> lstRecords = new List<Sobject>();
    
Autor__c objAutor = new Autor__c();
objAutor.Name = 'Shelley';
objAutor.Nacionalidad__c = 'Colombia';
objAutor.N_mero_de_documento__c = '10206589778';

lstRecords.add(objAutor);

Libro__c objLibro = new Libro__c();
objLibro.Name = 'Los amigos del hombre III';
objLibro.Autor__r = new Autor__c(N_mero_de_documento__c = '10206589778');
objLibro.N_mero_de_serie__c = '08B';

lstRecords.add(objLibro);
    
insert lstRecords;
``` 

### Operación Upsert

Esta operación permite insertar o actualizar un registro dependiendo si este ya existe o no en la base de datos. 

Para determinar si el registro ya existe, se pueden usar alguna de estas llaves:

- Id del registro. Es la llave por defecto.
- Un campo marcado como Id externo
- Un campo estándar marcado como true en el atributo idLookup 

Si la llave se encuentra más de una vez, el sistema arroja un error. 

```Apex
List<Libro__c> lstLibros = new List<Libro__c>();

Libro__c objLibro = new Libro__c();
objLibro.Name = 'Los amigos del hombre IV';
objLibro.N_mero_de_serie__c = '07B';

Libro__c objLibro2 = [Select Id,Name,N_mero_de_serie__c from Libro__c where N_mero_de_serie__c = '08B' limit 1]; 
objLibro2.Name = 'Alicia en el país de las maravillas';

lstLibros.add(objLibro);
lstLibros.add(objLibro2);
 
upsert lstLibros N_mero_de_serie__c;
``` 
En el ejemplo de arriba, el primer registro se crea mientras que el segundo se actualiza. En dado caso de no colocar un campo en la sentencia del upsert, Salesforce 
toma como llave el campo Id por defecto. 

En la sentencia se puede usar solo el nombre del campo **N_mero_de_serie__c**, o también se puede incluir el objeto **Libro__c.N_mero_de_serie__c**. 

### Operación Merge

Esta operación permite unir registros "Duplicados". Es posible unir hasta dos registros en un registro maestro, los otros registros son eliminados de la base de datos.

Todos los registros relacionados que pudieran tener los registros que se eliminan, son pasados al registro maestro.

También es importante aclarar que esta operación solo se puede ejecutar con los objetos estándar: Leads, Contacts, cases, and Accounts. Para el objeto Case es necesario ingresar a configuración y habilitar dicha opción en **Case Merge**.

Los valores que se mantienen son los del regisro maestro, si desea mantener el valor de uno de los registros que se va a unir, debe pasar dicho valor al registro maestro primero.

```Apex
//Supongamos que existen tres Casos que cumplen con esta condición

List<Case> lstCases = [Select id From Case where subject Like 'Test%' order by CaseNumber DESC];

List<Case> lstCasesMerge = new List<Case>{lstCases.get(1),lstCases.get(2)};

merge lstCases.get(0) lstCasesMerge; 
``` 

Por último, los registros involucrados en una operación de merge, no pueden volver a usarse para esta operación.

### Operaciones Delete y Undelete

La operación delete, tal como su nombre lo indica, permite eliminar uno o varios registros de la base de datos. También permite la eliminación en cascada, es decir, si elimino un registro padre, sus hijos correrán la misma suerte siempre y cuando se permita. 

Cuando un registro se elimina, realmente es llevado a la Papelera de reciclaje, donde permanece por 15 días o hasta que esta se llene, antes de eliminarse definitivamente de la instancia. 

En este periodo de tiempo es posible utilizar la operación undetele para recuperar el registro. Es importante tener presente que todas las relaciones lookup en los hijos, se recuperan una vez se restaure el padre siempre y cuando estos no hayan sido reasignados a otro registro. 

Para ejecutar la operación de undelete, la consulta a los registros se debe hacer con la cláusula **ALL ROWS**, la cual permite obtener tanto los datos que aún persisten en la base, como los que se encuentran en la papelera de reciclaje. 

```Apex
Libro__c objLibro = [Select id from Libro__c where N_mero_de_serie__c = '12B' limit 1];
delete objLibro;

Libro__c objLibroUndelete = [Select id from Libro__c where N_mero_de_serie__c = '12B' limit 1 ALL ROWS];
undelete objLibroUndelete;
``` 

## Clase Database

Aparte del lenguaje DML, Salesforce nos ofrece otra forma de interactuar con la base de datos. Se trata de los métodos de la clase Database.

Esta segunda forma es más flexible debido a que permite realizar operaciones parciales, es decir, si por algún motivo uno de los registros que estoy intentando insertar, por ejemplo, falla, el sistema permite insertar los demás normalmente. 

A través de la clase Database, también es posible hacer conversión de Leads, así como limpiar la papelera de reciclaje. Cosas que con el lenguaje DML no es posible. 

El siguiente ejemplo muestra el equivalente de la operación dml **insert**.

```Apex
//Using DML
List<Account> acctList = new List<Account>();
acctList.add(new Account(Name='Acme1'));
acctList.add(new Account(Name='Acme2'));

insert acctList;

//Using Database Class
List<Account> acctList = new List<Account>();
acctList.add(new Account(Name='Acme1'));
acctList.add(new Account(Name='Acme2'));

Database.SaveResult[] srList = Database.insert(acctList, false);

for (Database.SaveResult sr : srList) {
    if (sr.isSuccess()) {
        System.debug('Successfully inserted account. Account ID: ' + sr.getId());
    } else {      
        for(Database.Error err : sr.getErrors()) {
            System.debug('The following error has occurred.');                    
            System.debug(err.getStatusCode() + ': ' + err.getMessage());
            System.debug('Account fields that affected this error: ' + err.getFields());
        }
    }
}
``` 

Aquí hay varias cosas por observar. Primero, la forma de realizar la operación cambia totalmente. En este caso, en vez de usar la palabra reservada **insert**,
usamos el método del mismo nombre de la clase Database, ese método recibe dos parámetros, el registro o la lista de registros que voy a insertar, y un booleano que me indicar si la operación será parcial o no. Si queremos que sea parcial y continue insertando registros, aunque algunos fallen, se debe pasar como **False**.

En segundo lugar, en vez de generar una excepción, el método devuelve una lista de resultados **Database.SaveResult[]**, o un único resultado si solo se insertó un registro. A través de esta información es posible darle un manejo a los errores que se hayan podido generar durante la operación. 

La decisión de utilizar una forma u otra básicamente depende de si queremos realizar una operación parcial, o si queremos generar una excepción cuando algún registro falle. Las excepciones que se pueden generar con DML son de tipo **DMLException**. 

Para finalizar, es importante tener en mente, que cada operación retorna un tipo difetente de dato. Aquí la tabla de los **Result objects** para cada operación:

![image](https://user-images.githubusercontent.com/100179095/180336162-a1a83f08-7565-4dac-80de-34feb9551748.png)

## Referencias

1. [DML](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_dml.htm)
2. [Database methods](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_dml_database_result_classes.htm)
