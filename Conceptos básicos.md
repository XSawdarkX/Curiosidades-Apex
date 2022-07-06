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

## ¿Dónde puedo ejecutar Apex?

Apex puede ser escrito en varios entornos de desarrollo. Sin embargo, los dos principales son: 

### 1. Developer console

Es el entorno de desarrollo propio de Salesforce, y por lo mismo el más completo a la hora de crear, depurar y probar el código. Este entorno permite dentro de otras cosas:

- Escribir código.
- Compilar el código.
- Autocompletar el código.
- Depurar el código.
- Ejecutar pruebas unitarias y de integración
- Analizar el rendimiento del programa
- Ejecutar consultas a la base de datos

Pasos para acceder a la Developer console:

1. Dar clic en el icono de **Setup** ubicado en la parte superior derecha y seleccionar, manteniendo oprimida la tecla **ctrl**, la opción Developer console o
Consola de desarrollador.  

![image](https://user-images.githubusercontent.com/100179095/177469334-7fa265d1-23ae-4a0f-9dd6-dab0e8b389d0.png)

Una vez se abra el entorno vera algo como esto:

![image](https://user-images.githubusercontent.com/100179095/177469542-402a43cf-bfed-494e-8e75-9b4b72d02806.png)

### 2. Visual Studio Code

Visual Studio Code es un editor de código creado por Microsoft para desarrollar en casi cualquier lenguaje de programación. Su flexibilidad para instalar extensiones 
lo convierten en un entorno muy completo para redactar código. Precisamente, a través del paquete [Salesforce Extensions], es posible comenzar a escribir Apex.

Una ventaja importante de VSC sobre la Developer console, es la creación de LWC (Tema que trataremos más adelante en otro modulo), ya que solo es posible su creación por medio del editor. 

### 3. Interfaz de usuario

Antes de explicar esta opción, es preciso aclarar que los términos resaltados se explicaran más adelante en otro modulo. 

Por último, aunque no es un entorno de desarrollo, haciendo uso de la interfaz de usuario de Salesforce, es posible editar y crear **Clases de apex** y **Triggers**.

#### Creación/Edición de Trigger

1. Ingresar a Configuraciones/Setup
2. Dar clic en la opción Gestor de objetos/Object Manager ubicada en la parte superior izquierda
3. Dar clic en el objeto que se desee 
4. En la parte izquierda, buscar la opción Desencadenadores/Triggers  
5. Dar clic en Nuevo/New, o en su defecto Modificar/Edit si ya existe uno.

![image](https://user-images.githubusercontent.com/100179095/177475453-b60e9ebc-26a4-4588-98b6-fbb9a357e233.png)

#### Creación/Edición de una Clase Apex

1. Ingresar a Configuraciones/Setup
2. Buscar la opción Clases de Apex/Apex classes en el cuadro de búsqueda rápida. 
5. Dar clic en Nuevo/New, o en su defecto Modificar/Edit si ya existe una.

## Qué no se puede hacer en Apex

- Crear una interfaz gráfica. Únicamente mensajes de error. 
- Cambiar funcionalidad estándar. Apex solo puede evitar que ocurra la funcionalidad o agregar funcionalidad adicional. 
- No permite hilos como su lenguaje hermano Java. 

## Referencias

1. [Introducing Apex](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_intro.htm)
2. [Apex Development Process](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_dev_process_chapter.htm)

