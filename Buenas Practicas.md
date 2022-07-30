# Buenas practicas programación

Las buenas practicas de programación con un conjunto de tecnicas, métodologias, recomendaciones que deben adoptar, y aplicar los desarrolladores para que sus aplicaciones 
sean más eficientes. 

## Beneficios

- El código se vuelve más legible
- El código se vuelve escalable
- El código se vuelve más seguro
- Genera menos estres
- Permite realizar cambios más rápido
- Ayuda a reducir o eliminar errores
- En el caso especifico de Apex permite controlar los limites

## Ejemplos

### Priorizar la legibilidad

Colocar nombre a las variables y métodos que tengan sentido. Con tan solo leer su nombre yo ya debo comprender que va dato almacena y cual es su proposito en el caso de los métodos.

Siempre iniciando los nombres con minuscula y utilizando la estructura Camel Case. 

```Apex
//Bad practices
Integer a = 500;
Integer B = 5;
Integer c = a - ( (a * b) / 100);

//Good practices
Integer precioBaseCarro = 500;
Integer descuentoCarro = 5;
Integer precioFinalCarro = precioBaseCarro- ( (precioBaseCarro * descuentoCarro) / 100);
```

```Apex
//Bad practices
public List<Integer> getNumeros(List<Integer> numeros){

    List<Integer> result = new List<Integer>(); 
    for(Integer numero : numeros){
        if(math.mod(numero,2) == 0){
            result.add(numero);
        }
    }

    return result;
}

//Good practices
public List<Integer> getNumerosPares(List<Integer> lstNumerosOriginales){
   
    List<Integer> lstNumerosPares = new List<Integer>(); 
    for(Integer numero : lstNumerosOriginales){
        if(math.mod(numero,2) == 0){
            lstNumerosPares.add(numero);
        }
    }

    return lstNumerosPares;
}
```

### Identar

Siempre respetar los espacios para entender la jerarquía del código y entender que contiene a que. 

```Apex
//Bad practices
String colorRojo='Rojo';
if(Color=='Rojo'){
System.debug('El color es rojo');    
}

//Good practices
String colorRojo = 'Rojo';

if(Color == 'Rojo'){
   System.debug('El color es rojo');    
}
```

### Insertar comentarios

Evitar en lo posible usar comentarios. Un buen código se lee por si mismo. 

Solo usar comentarios para documentar las clases. O para explicar cosas especificas del contexto (La instancia), no del código. 

```Apex
/* **************************************************************************************************************
* Globant 
* @author           Daniel Junca <Daniel.junca@globant.com>
* Proyect:          AfapSura
* Description:      ........
*
* -------------------------------------
*           No.     Fecha           Autor                   Descripción
*           -----   ----------      --------------------    ---------------
* @version   1.0    29/12/20167     Joseph Ceron JC          Class creation
************************************************************************************************************* */
```

### Nomenclatura

Salesforce siempre recomienda colocar un sufijo y prefijo. 

```Apex
cls : Clase
tst : Clase de prueba
tgr : Trigger
bch : Batch
sch : Schedule
lst : Lista
set : Set
map : Map
obj : Objeto
```

### No reproducir fragmentos idénticos de código

Usar la clase **IP_BuenasPracticas_cls**.

```Apex
 public static void obtenerIdcreadorContacto(Contact objContacto){
       System.debug('El Id del creador del Contacto es: '+objContacto.CreatedById);
    }
    
    public static void obtenerIdcreadorLibro(Libro__c objLibro){
       System.debug('El Id del creador del Libro es: '+objLibro.CreatedById); 
    }
    
    public static void obtenerIdcreadorRegistro(Sobject registro){
       System.debug('El Id del creador del registro es: '+registro.get('CreatedById')); 
    }
```

```Apex
// bad practice
Contact objContact = [Select id,CreatedById from Contact where Name = 'Test Daniel' limit 1];
IP_BuenasPracticas_cls.obtenerIdcreadorContacto(objContact);

Libro__c objLibro= [Select id,CreatedById from Libro__c where Name = 'El fin del mundo' limit 1];
IP_BuenasPracticas_cls.obtenerIdcreadorLibro(objLibro);

// Good practice
Contact objContact = [Select id,CreatedById from Contact where Name = 'Test Daniel' limit 1];
IP_BuenasPracticas_cls.obtenerIdcreadorRegistro(objContact);

Libro__c objLibro= [Select id,CreatedById from Libro__c where Name = 'El fin del mundo' limit 1];
IP_BuenasPracticas_cls.obtenerIdcreadorRegistro(objLibro);
```

### Realizar control de versiones

----------

###  Bulfiky Apex Code

```Apex
//Bad practice
trigger MyTriggerNotBulk on Account(before insert) {
    Account a = Trigger.New[0];
    a.Description = 'New description';
}

//Good practice
trigger MyTriggerBulk on Account(before insert) {
    for(Account a : Trigger.New) {
        a.Description = 'New description';
    }
}
```

### Evitar SOQL y DML dentro de Fors


```Apex
//Bad practices
Map<String,List<Libro__c>> mapAutorxListaLibros = new Map<String,List<Libro__c>>();
for(Autor__c objAutor : [Select id,Name from Autor__c]){
    List<Libro__c> lstLibrosAutor = [Select id from Libro__c where Autor__c = :objAutor.Id];
    mapAutorxListaLibros.put(objAutor.Name,lstLibrosAutor);
}

for(Integer i = 0 ; i < 105 ; i++){
   List<Libro__c> lstLibrosAutor = [Select id from Libro__c]; 
}

//Good practices

Map<String,List<Libro__c>> mapAutorxListaLibros = new Map<String,List<Libro__c>>();
for(Autor__c objAutor : [Select id,Name,(Select id from Libros__r) from Autor__c]){
    mapAutorxListaLibros.put(objAutor.Name,objAutor.Libros__r);
}
```

```Apex
//Bad practices
for(Integer i = 0 ; i < 200 ; i++){
   Account objAccount = new Account();
   objAccount.Name = 'Pepito '+i;
   insert objAccount; 
}

//Good practices

List<Account> lstAccount = new List<Account>();

for(Integer i = 0 ; i < 200 ; i++){
   Account objAccount = new Account();
   objAccount.Name = 'Pepito '+i;
   lstAccount.add(objAccount); 
}

insert lstAccount;
```

```Apex
Select id,Name from Account where Name like 'Pepito%' 
```

### Querying Large Data sets

```Apex
cls : CLase
```

### Usar métodos de la clase Limits

```Apex
for(Integer i = 0 ; i < 200 ; i++){
   
   if(Limits.getDmlStatements() < Limits.getLimitDMLStatements()){
     Account objAccount = new Account();
   	 objAccount.Name = 'Pepito '+i;
  	 insert objAccount;     
   }
}
```

### Avoid Harcodings IDs

```Apex
//Bad practice
Libro__c objLibro = [Select id from Libro__c where Id = 'a018X00000YPQ5UQAX' limit 1];

//Good Practice
Libro__c objLibro = [Select id from Libro__c where Name = 'El mundo de Sofía' limit 1];
```

### Siempre guardar los registros en una lista

```Apex
//Bad practice
Libro__c objLibro = [Select id from Libro__c where Name = 'El mundo de Sofía II' limit 1];

//Good Practice
List<Libro__c> lstLibro = [Select id from Libro__c where Name = 'El mundo de Sofía II' limit 1];
```

### Manejar excepciones

```Apex
try{

   Integer valorA = 5;
   Integer valorB;
   Integer resultado = valorA + valorB;
   
   System.debug('resultado: '+resultado); 
      
}catch(Exception e){
   System.debug('Ha ocurrido una Excepción: '+e); 
}
```

### Escribir código en ingles

