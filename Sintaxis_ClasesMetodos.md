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

```Apex
IP_Vehiculo_cls objVehiculo = new IP_Vehiculo_cls(IP_Vehiculo_cls.tipovehiculo.AEREO,'002','Rojo',6000);
System.debug('objVehiculo: '+objVehiculo);
```





## Referencias

1. [ReferOne]()
