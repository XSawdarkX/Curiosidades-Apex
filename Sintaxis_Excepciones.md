
# Sintaxis

Este módulo tiene como propósito explicar la sintaxis básica de Apex, lo que incluye:

- [Definición y asignación de variables](https://github.com/XSawdarkX/Curiosidades-Apex/edit/main/Sintaxis_Variables.md) 
- [Constantes](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Constantes.md)
- [Comentarios](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Constantes.md)
- [Mensajes de depuración](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Constantes.md)
- [Colecciones](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Colecciones.md)
- [Condicionales](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Condicionales.md)
- [Ciclos](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_Ciclos.md)
- Manejo de excepciones
- [Definición de clases y métodos](https://github.com/XSawdarkX/Curiosidades-Apex/blob/main/Sintaxis_ClasesMetodos.md)

## Excepciones

Las excepciones son sentencias cuyo objetivo es permitir capturar errores que interrumpen el flujo normal de un proceso. 

Su sintaxis básica es: 

try {
 code_block
} catch (exceptionType variableName) {
 code_block
}

Una excepción se divide en tres partes:

1. **Try:** Permite identificar un bloque de código en el que posiblemente pueda ocurrir una disrupción del flujo. 
2. **Catch:** Permite capturar las excepciones que se generen en el bloque Try. De esta manera el proceso puede continuar su flujo normal. Es posible tener varios catch, pero cada uno debe corresponder con un Tipo de excepción diferente. 
3. **Finally:** Esta sentencia se ejecuta independientemente de si ocurre o no una excepción. Se usa generalmente para liberar recursos o limpiar el código. 

Tanto la sentencia Finally como la sentencia Catch son opcionales, pero al menos una debe acompañar al Try. 

Aquí algunos Ejemplos: 

### Bloque Try/Catch


```Apex
try{

	Integer valorA = 5;
	Integer valorB;

	Integer resultado = valorA + valorB;
      
}catch(Exception e){
   System.debug('Ha ocurrido una Excepción: '+e); 
}

Result Ha ocurrido una Excepción: System.NullPointerException: Attempt to de-reference a null object
``` 
En este caso, al intentar realizar una operación aritmética entre el valor 5 y un null, se produce una excepción de tipo **NullPointerException**. 


## Referencias
m
1. [ReferOne]()
