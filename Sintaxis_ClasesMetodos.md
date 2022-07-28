# Sintaxis

Este módulo tiene como propósito explicar la sintaxis básica de Apex, lo que incluye:

- [Definición y asignación de variables](https://github.com/XSawdarkX/Curiosidades-Apex/edit/main/Sintaxis_Variables.md) 
- [Constantes](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Constantes.md)
- [Comentarios](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Constantes.md)
- [Mensajes de depuración](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Constantes.md)
- [Colecciones](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Colecciones.md)
- [Condicionales](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Condicionales.md)
- [Ciclos](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Ciclos.md)
- [Manejo de excepciones](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Excepciones.md)
- Definición de clases y métodos

## Ejemplos Clases

### Prueba variables y métodos

Usar la clase **IP_Calculadora_cls**. 

```Apex
IP_Calculadora_cls objCalculadora = new IP_Calculadora_cls();
System.debug('resultado inicial: '+objCalculadora.resultado);

Integer resultadoSuma = objCalculadora.suma(2,3);
System.debug('resultado operación 1: '+resultadoSuma);

objCalculadora.suma(objCalculadora.resultado,5);
System.debug('resultado operación 2: '+objCalculadora.resultado);

objCalculadora.resetearResultado();

objCalculadora.suma(1,5);
System.debug('resultado operación 3: '+objCalculadora.resultado);

if(objCalculadora.suma(objCalculadora.resultado,5) > 10)
    system.debug('Es mayor');
else
    system.debug('Es menor');
```

### Probar referencias de métodos

Usar la clase **IP_ReferenceMethodExample_cls**

```Apex
IP_ReferenceMethodExample_cls objReference = new IP_ReferenceMethodExample_cls();
objReference.debugStatusMessage();

IP_ReferenceMethodExample_cls objReference = new IP_ReferenceMethodExample_cls();
objReference.createTemperatureHistory();
```

### Explicación modificadores de acceso


```Apex
JAVA         APEX
Default      private
private      protected
protected    public
public       global 

JAVA

Paquete 1
	Clase 1
	Clase 2
Paquete 2
	Clase 3
```

### Ejemplo estatico y constructores

Usar la clase  **IP_Vehiculo_cls**. Para probar ejecutar el código así, y luego colocando el atributo descuento como estatico.

```Apex
IP_Vehiculo_cls objVehiculo1 = new IP_Vehiculo_cls(IP_Vehiculo_cls.tipovehiculo.AEREO,'002','Rojo',6000);
System.debug('objVehiculo1: '+objVehiculo1);

IP_Vehiculo_cls objVehiculo2 = new IP_Vehiculo_cls(IP_Vehiculo_cls.tipovehiculo.ACUATICO,'003','Azul',7000);
System.debug('objVehiculo2: '+objVehiculo2);

IP_Vehiculo_cls objVehiculo3 = new IP_Vehiculo_cls();
System.debug('objVehiculo3: '+objVehiculo3);

System.debug('DESCUENTOS');
System.debug('objVehiculo1 Descuento: '+objVehiculo1.getDescuento());
System.debug('objVehiculo2 Descuento: '+objVehiculo2.getDescuento());
System.debug('objVehiculo3 Descuento: '+objVehiculo3.getDescuento());

System.debug('ANULAR DESCUENTO VEHICULO 1');
objVehiculo1.anularDescuento();
System.debug('objVehiculo1 Descuento: '+objVehiculo1.getDescuento());
System.debug('objVehiculo2 Descuento: '+objVehiculo2.getDescuento());
System.debug('objVehiculo3 Descuento: '+objVehiculo3.getDescuento());
```


## Referencias

1. [ReferOne]()
