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
cls : CLase
```

### Evitar SOQL y DML dentro de Fors


```Apex
cls : CLase
```

### Querying Large Data sets

```Apex
cls : CLase
```

### Usar métodos de la clase Limits



### Avoid Harcodings IDs

```Apex
cls : CLase
```

### Manejar excepciones

```Apex
cls : CLase
```

### Escribir código en ingles

