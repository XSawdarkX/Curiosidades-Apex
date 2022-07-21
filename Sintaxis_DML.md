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
- Converting Leads

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


## Referencias

1. [DML]()
