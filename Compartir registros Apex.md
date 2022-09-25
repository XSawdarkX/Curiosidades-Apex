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
