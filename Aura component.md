# Aura Component

PROBAR CON EL COMPONENTE **AuraHelloWorld**

## ¿Que es?

Es un framework que permite crear interfaces de usuario para el desarrollo de aplicaciones web en móviles y escritorios. 

Es un conjunto de código y servicios que facilitan la creación de aplicaciones web. 

Son unidades de una aplicación que se pueden reutilizar.

El framework se basa en etiquetas, similar a HTML. De hecho es posible usar HTML, Css, y Js, aunque ya se cuenta con etiquetas o componentes propios de Salesforce.

## ¿Como funciona?

Los componentes Aura manejan Js en el lado del cliente y Apex en el lado del servidor. 

![image](https://user-images.githubusercontent.com/100179095/188726622-c86c4c1f-72c7-4517-a8db-595c5ca00806.png)

## ¿Donde se puede usar?

Un Aura component se puede usar en:

- Para personalizar sus aplicaciones de Salesforce, ya se agregandolo cp,p Home page, o App page.
- Como record page.
- Como una acción rápida o acción global.
- Como fichas
- Para sustituir acciones estándar.  
- En comunidades
- Crear aplicaciones independientes alojadas en Salesforce pero que se ejecutan en otro contexto

Lightning Out es una función que amplía aplicaciones Lightning. Actúa como un puente para hacer aflorar componentes Lightning en cualquier contenedor Web remoto. Es
decir, pueso usar mis componentes en sistemas externos. 

Un componente Lightning puede ser ejecutada o llamada desde una Visualforce.

## ¿Desde donde se puede crear?

Loa componentes aura se pueden crear desde : 

- Desde la Developer Console
- Desde Visual Studio Code

Aparte de dar un nombre al comonente, adicionalmente se puede seleccionar si se desea crear para usar en un Tab, Lightning page, Lightningrecord page o Lightning Communities page. 

Cuando recien se crea el componente, realmente se da vida a un Paquete de componente, el cual se puede entender como una carpeta.
podemos apreciar que al costado derecho se ven una serie de opciones. Estas opciones se conocen como recursos, que se pueden entender como archivos Dentro de la carpeta.

Todos los recursos están conectados automaticamente entre sí y cada uno tiene su propia función. En total son 8 recursos. 

Un componente Aura se encuentra contenido en las etiquetas **<aura:component>**. 

### Recursos

- **Component**: Es la definición del componente. La parte visual. La interfaz en sí. 
- **Controller**: el controlador del componente o archivo principal de JavaScript.Contiene los métodos que me van a gestionar los eventos disparados por el usuario final. La idea es que el Controller se dedice exclusivamente a llamar los métodos del helper. 
- **Helper**: el auxiliar del componente o archivo secundario de JavaScript. Contiene los métodos que van a ser llamados por el Controller.
- **Style**: Define los estilos del componente
- **Documentation**: Para documentar el componente con una pequeña descripción o algunos códigos de ejemplo. 
- **Rendered**: Permite configurar un renderizador de parte del cliente que sobreescribe el renderizado por defecto de un componente.
- **Design**: Es un recurso requerido cuando el componente se va a usar en Lightning App Builder, Lightning pages, Experience Builder, or Flow Builder.
- **SVG**: Recurso para configurar iconos personalizados para componentes usados en Lightning App Builder or Experience Builder.

### Previsualización

Lamentablemente, a diferencia de una Visualforce, no se puede previsualizar el aspecto del componente hasta que no se encuentre dentro de un contenedor. Una manera rápida de probar el componente es crear una aplicación Lightning desde la **Developer console** --> **Nuevo** --> **Lightning application** y llamar al componente de la siguiente forma. 

```Apex
<aura:application >
	<c:NombreDelComponente/>
</aura:application>
```
En el costado derecho de la aplicación hay una opción de preview.

### Aplicación vs componente

- Puede llamar un componente desde una aplicación. Pero no una aplicación desde otra aplicación, o una aplicación desde un componente.
- Una aplicación tiene una dirección URL independiente a la que puede acceder durante la prueba y que puede publicar para sus usuarios.
- No puede agregar aplicaciones a Lightning Experience o la aplicación Salesforce: solo puede agregar componentes.
- Las aplicaciones Componentes Lightning son un tipo de contenedor para nuestros Componentes Lightning.
- Puede anidar componentes dentro de otros. Cuando llama un componente desde otro, es como si estuviera instanciándolo en el otro componente. 


