# Apex managed sharing

Es posible compartir registros de manera dinamica desde **Apex**.

Cuando se comparte un registro, la mayoria de esa información se guarda en los **objetos Sharing**.

Cuando se comparten los registros de esta manera, no importa si el propietario cambia, el acceso se sigue manteniendo.

## Sharing Reason Field

Este campo especifica el tipo de compartimiento usado para un registro. Su nombre Api es **rowCause**.


## Access Levels

Cuando se comparte un registro, también es importante especificar el nivel de acceso que tendran los usuarios con los cuales de compartira. Existen cuatro nieles:

- **private:** Solo el propietario y los que esten por encima de el en la jerarquía pueden ver y editar el registro.
- **Read Only:** El grupo o el usuario especificado solo puede ver el registro.
- **Read/Write:** El grupo o el usuario especificado puede ver y editar el registro.
- **Full Access:**  El grupo o el usuario especificado puede ver, editar, tranferir, compartir y borrar el registro. Este valor solo esta disponible en Sharing Settings.

```Apex

```

## Sharing a Record Using Apex

Para realizar este proceimiento es necesario usar el objeto Sharing correspondiente al objeto del registro que vamos a compartir.

Para objetos estandar el nombre de dicho objeto es el mismo nombre API más la palabra **Share**.Ejemplo: **AccountShare**, **ContactShare**. Para objectos Custom, es el mismo nombre API más **__Share**.Ejemplo:**Libro__Share**. 

Es una relación **Maestro detalle**, los objetos que actuan como hijos no tienen un objeto Sharing, ya que el nivel de acceso depende del objeto Maestro. 

### Compartir el registro manualmente

El siguiente ejemplo es el más básico que podemos tener. Basicmanete se esta compartiendo un registro manualmente. Tal como mencionamos anteriormente, podemos especificar una causa o una razón por la cual se comparte el registro, por defecto esta causa tiene un valor de **Manual**. Por lo que no es necesario especificarlo.


```Apex
// Create new sharing object for the custom object Job.
Libro__Share libroShr  = new Libro__Share();

// Set the ID of record being shared.
libroShr.ParentId = 'a018X00000YPQ5zQAH';

// Set the ID of user or group being granted access.
libroShr.UserOrGroupId = '0058X00000FLXEcQAP';

// Set the access level.
libroShr.AccessLevel = 'Read';

Database.SaveResult sr = Database.insert(libroShr,false);
```

Si se desea especificar tampoco habría problema, se realiza de la siguiente manera:

```Apex
libroShr.RowCause = Schema.Libro__Share.RowCause.Manual;
```

Cuando se comparte el registro de este forma, si el propietario cambia, se pierde el compartimiento. 

Los posibles valores para el campo **AccessLevel** son **read** y **edit**.

### Compartir el registro con Apex sharing reason

Este tipo de compartimiento se mantiene aunque el propietario del registro cambie.

Lo primero que se debe realizar es la creación de las **Apex sharing reason**, para ello es necesario ir a la página de detalles del objeto y buscar la lista relacionada del mismo nombre. Esta lista esta solo disponible desde **classic**. 

![image](https://user-images.githubusercontent.com/100179095/192170717-316e6341-116c-43df-8494-ccbbdc92124a.png)

Las Apex sharing reason son una forma en que los desarrolladores pueden saber el porque ellos compartieron un registro con un grupo de usuarios. También permite compartir el mismo registro varias veces usando diferentes razones.

Para crear una **razon** solo es necesario definir su nombre.

A continuación se muestra como se llama desde apex:

```Apex
Schema.CustomObject__Share.rowCause.SharingReason__c
```

Las listas relacionadas Apex sharing reasons y Apex managed sharing recalculation, solo estan disponibles para objetos custom.

Ejemplo:

```Apex
// Create new sharing object for the custom object Job.
Libro__Share libroShr  = new Libro__Share();

// Set the ID of record being shared.
libroShr.ParentId = 'a018X00000YPeZrQAL';

// Set the ID of user or group being granted access.
libroShr.UserOrGroupId = '0058X00000FLXEcQAP';

// Set the access level.
libroShr.AccessLevel = 'Read';

libroShr.RowCause = Schema.Libro__Share.RowCause.TestReason__c;

insert libroShr;
```

## Recalculating Apex Managed Sharing

Es posible crear un batch cuya función en recalcular los compartimientos hechos con Apex sharing reasons. Este batch se debe asociar a la lista relacionada **Apex Sharing Recalculation** a nivel de la página de detaller del objeto en Salesforce classic.

![image](https://user-images.githubusercontent.com/100179095/192171945-d9fe26eb-41b7-490c-aed0-53320a9a52d6.png)

También es posible ejecutar el btach desde la ventana anonima con el método **execute**.

Basicamente lo que hace la clase es borrar los registros del objeto share y los vuelve a insertar. 

Aquí un ejemplo: (Recalculating Apex)[https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_bulk_sharing_recalc.htm]



