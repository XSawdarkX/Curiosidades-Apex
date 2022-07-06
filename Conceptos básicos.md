# Conceptos básicos

## ¿Qué es Apex?

Apex es un lenguaje de programación orientado a objetos y de tipificación fuerte. Muy similar a Java. 
Es el lenguaje propio de Salesforce que permite automatizar procesos del sistema.

Cuando se usa Apex es importante tener en cuenta que, imitando a su contraparte funcional, al estar integrado dentro de un CRM que funciona y se ejecuta en
la nube, está sujeto a un conjunto de limites cuyo proposito es evitar la monopolización de los recursos. 

## ¿Cuándo debo usar Apex?

- Realizar validaciones complejas sobre varios objetos.
- Crear procesos comerciales que no pueden ser implementados a través de Process builder o Flow.
- Ejecutar una lógica personalizada cuando un usuario realice alguna acción sobre un registro. 
- Consumir o exponer servicios Web. 
- Crear servicios de correo electrónico.  

## ¿Cómo funciona Apex?

![image](https://user-images.githubusercontent.com/100179095/177459890-ccf0b760-e2ad-41a9-9cfa-886c4bffd30b.png)

1. El desarrollador escribe el código y lo guarda. 
2. El servidor de Salesforce **compila** el código, es decir, traduce el lenguaje de Apex que entiende el desarrollador a un lenguaje que solo entiende la máquina.  
3. El código compilado se guarda como un metadato en la base de datos. 

Cuando un usuario final activa la ejecución de Apex, independientemente de la acción, ocurre lo siguiente:

1. El servidor de Salesforce recupera el código compilado.
2. A través del **interprete**, cuyo objetivo es procesar el código maquina durante el tiempo de ejecución, se efectúan las instrucciones.  

## Qué no se puede hacer en Apex

- Crear una interfaz gráfica. Únicamente mensajes de error. 
- Cambiar funcionalidad estándar. Apex solo puede evitar que ocurra la funcionalidad o agregar funcionalidad adicional. 
- No permite hilos como su lenguaje hermano Java. 

## Referencias

1. [Introducing Apex](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_intro.htm)

