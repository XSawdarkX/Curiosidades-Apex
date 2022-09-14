# Lightning Web Components

## ¿Qué es un lightning web component?

Lightning Web Component es un framework o un modelo de programación basado en los estándares web, que permite crear interfaces de usuario. Fue creado en el 2018

Ese nuevo modelo se basa en etiquetas HTML y Js moderno. 

Es importante mencionar que LWC y Aura pueden coexistir en un mismo entorno.

Los Componentes Web Lightning se centran tanto en la experiencia del desarrollador como en la experiencia del usuario. Al abrir la puerta a las tecnologías previamente existentes, podrá utilizar las habilidades desarrolladas fuera de Salesforce para construir componentes web Lightning

Los navegadores modernos se basan en estándares web y estos estándares están en continua evolución mejorando lo que los navegadores pueden presentar a los usuarios. 

Al estar construidos con un código que se ejecuta de manera nativa en los navegadores, los Componentes Web Lightning son ligeros y ofrecen un desempeño excepcional. La mayor parte del código que programa es JavaScript y HTML estándar.

los componentes web no son nada nuevo. De hecho, los navegadores llevan años creándolos. Algunos ejemplos son: <select>, <video>, <input>, así como cualquier etiqueta que sirva como algo más que un contenedor. Estos elementos son en realidad el equivalente de componentes web. 
    
los componentes Aura pueden contener componentes web Lightning (aunque no funciona al revés)    
    
## ¿Cómo funciona?
    
Como este modelo se basa en estandares web, es posible crear componentes que funciones en sistemas externos y que además no tengan nada que ver con Salesforce.
    
No tiene que especializarse en las peculiaridades de un marco de trabajo particular. Simplemente puede crear componentes utilizando HTML, JavaScript y CSS. La creación de componentes web Lightning se hace en un máximo de 3 pasos. No es una exageración. Es realmente así de fácil. Hay que crear (1) un archivo JavaScript, (2) un archivo HTML y, opcionalmente, (3) un archivo CSS.

- El archivo HTML suministra la estructura para su componente.
- El archivo JavaScript define la lógica de negocio principal y la gestión de eventos.
- El archivo CSS aporta la apariencia y la animación a su componente.    
    
El archivo JS es el encargado de comunicarse con el servidor.    
    
![image](https://user-images.githubusercontent.com/100179095/189915826-506d3849-d70b-4b3a-8566-064ec628a661.png)
    
## ¿Dónde se puede usar?
    
- Salesforce Mobile App
- Lightning App Builder
- Experience Builder sites
- Utility Bars
- Quick Actions
- Custom Tabs
    
No se pueden usar para
    
- Standard Action Overrides, Global Actions    
    
Antes existian los sites y las comunidades, ahora salesforce homologo esos terminos y a todo lo llama sitios de experiencia.
    
## ¿Desde donde se puede crear?
    
Un LWC solo se puede crear a través de un entorno de desarrollo, Salesforce recomienda Visual studio code.  
    
Para integrar Salesforce con VS se puede seguir este tutorial: 
    
[https://trailhead.salesforce.com/es-MX/content/learn/projects/quick-start-lightning-web-components/set-up-salesforce-dx] (Salesforce DX )
    
Una vez se haya hecho la integración podemos crear el LWC de dos formas:
    
- Por la paleta de comandos: ctrl + shift + p. Aquí escribimos SDFX: Create Lightning Web Component
- Por la terminal:
    
 Con este comando
  
```Apex    
 sfdx force:lightning:component:create --type lwc -n helloWorld -d force-app/main/default/lwc
```    
    
O primero ubicandonos en la carpeta del lwc 
    
```Apex    
cd force-app/main/default/lwc
```
    
Y luego
    
```Apex     
sfdx force:lightning:component:create --type lwc -n helloWorld
```    
    
Cuando recien se crea el componente este contiene tres archivos. 
    
- Un archivo html
    
- Un archivo Js
    
-   Un archivo XML de metadata: Aquí podemos usar ciertas etiquetas que nos permitiran dentro de otras cosas, exponer nuestro componente a los diferentes
    contenedores
    
Podemos adicionalmente crear un archivo css o svg,  pero estos deben llamarse igual que el html y el Js, de lo contrario no funcionara.
    
Para exponer un LWC a algún contenedor seteamos la propiedad **isExposed** a true, y utilizamos la propiedad **target para indicarle el contenedor**. Esto se hace en el archivo XML.
    
Posibles valores para el contenedor: (Targets)[https://developer.salesforce.com/docs/component-library/documentation/en/lwc/lwc.reference_configuration_tags]   
    
```Apex   
 <?xml version="1.0" encoding="UTF-8"?>
<LightningComponentBundle xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>55.0</apiVersion>
    <isExposed>true</isExposed>
    <targets>
        <target>lightning__UtilityBar</target>
    </targets>
</LightningComponentBundle>   
```     
### Explicación archivo JS
    
La declaración import indica que el código de JavaScript utiliza la función **LightningElement** del módulo lwc.

```Apex      
import { LightningElement } from 'lwc';
export default class MyComponent extends LightningElement {
}
``` 
    
LightningElement es la clase base para los componentes web Lightning, lo que nos permite utilizar el método connectedCallback() por ejemplo.
    
connectedCallback() : método que se activa cuando se inserta un componente en el Document Object Model (DOM)
    
La declaración export define una clase que amplía la clase LightningElement. Se recomienda poner el mismo nombre a la clase que al archivo de la clase de JavaScript, aunque no es un requisito obligatorio.
 
## Expresiones
    
Las expresiones siguen eel siguiente formato: {}
    
No es necesairo usar el caracter "!", ni un proovedor de valores como en Aura.
    
Js
    
```Apex
import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {

 message = 'Hello world';

}
``` 
    
HTML   
    
```Apex
<template>
    <p>{message}</p>
</template>    
```     

Ejemplo función
  
Js  
    
```Apex
import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {

    message = 'Hello world';

    translateMessage(){
        this.message = 'Hola Mundo';
    }

}   
```       
    
HTML   
    
```Apex
<template>
    <p>{message}</p>
    <button onclick='{translateMessage}'>Translate</button>
</template>   
``` 
    
## Condicional

Permite evaluar una condición. No existe como tal una figrua de else. Solo existe el **template if:true** y el **template if:false**
    
Js  
    
```Apex
import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {

    mostrarMensaje = false;

}
```       
    
HTML   
    
```Apex
<template>
    <template if:true={mostrarMensaje}>
        <div class="slds-m-vertical_medium">
            Hello world
        </div>
    </template>

    <template if:false={mostrarMensaje}>
        <div class="slds-m-vertical_medium">
            mensaje Oculto
        </div>
    </template>
</template>
```     
    
## Iterador

Me permite recorrer un conjunto de valores. Cuando utilizo una etiqueta dentro del **template for:each**, es necesario especificar un key para cada elemento.
    
Js  
    
```Apex
import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {

    colores = ['Amarillo','Azul','Rojo'];

}
```   
 
HTML   
    
```Apex
<template>
    <template for:each={colores} for:item="color">
        <p key='{color}'>{color}</p>
    </template>
</template>
```         
    
## Algunos componentes
    
Existen muchos componentes propios de Salesforce que incluso se pueden usar también con Aura. Sin embargo, el LWC se usa el - en vez de los dos puntos, para separar el spacename del nombre del componente.
   
lightning-card
    
```Apex
<template>
    <lightning-card  title="Hello">
        <lightning-button label="New" slot="actions"></lightning-button>
        <p class="slds-p-horizontal_small">Card Body (custom component)</p>
        <p slot="footer">Card Footer</p>
    </lightning-card>
</template>    
```    

lightning-progress-step
    
```Apex
<template>
    <p>
        A progress indicator displays the steps in a process. All steps preceding the step specified by currentStep are marked completed.
    </p>
    <lightning-progress-indicator current-step="3" type="base" has-error="true" variant="base">
        <lightning-progress-step label="Step 1" value="1"></lightning-progress-step>
        <lightning-progress-step label="Step 2" value="2"></lightning-progress-step>
        <lightning-progress-step label="Step 3" value="3"></lightning-progress-step>
        <lightning-progress-step label="Step 4" value="4"></lightning-progress-step>
    </lightning-progress-indicator>
</template>    
```    
    
lightning-button-icon
    
```Apex
<template>
    <h2 class="slds-text-heading_medium slds-m-bottom_medium">
        Button-icons with the <code>variant</code> attribute omitted or set to the default value of <code>border</code>.
    </h2>
    <!-- with border / by default -->
    <div class="slds-p-around_medium lgc-bg">
        <lightning-button-icon icon-name="utility:settings"  alternative-text="Settings" title="Settings"></lightning-button-icon>
    </div>    
</template>
    
```    
lightning-record-view-form
    
```Apex
<template>
    <lightning-record-view-form object-api-name='Libro__c' record-id='a018X00000YPQ60QAH'>
        <lightning-output-field field-name='Name'></lightning-output-field>
    </lightning-record-view-form>
</template>    
```    

lightning-map

Js
    
```Apex
import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {

mapMarkers = [
    {
        location: {
            Street: '1 Market St',
            City: 'San Francisco',
            Country: 'USA',
        },
        title: 'The Landmark Building',
        description:
            'Historic <b>11-story</b> building completed in <i>1916</i>',
    },
];

}   
```   
    
HTML
    
```Apex
<template>
    <lightning-map map-markers={mapMarkers}> </lightning-map>  
</template>   
```      
    
## Decoradores    
  
Se suelen utilizar los decoradores en JavaScript para modificar el comportamiento de una propiedad o una función.

Para utilizar un decorador, impórtelo del módulo lwc y colóquelo antes de la propiedad o la función.
    
Se pueden importar varios decoradores, pero cada propiedad o función concreta solo puede tener un decorador. 
    
- **@api:** marca un campo como público. Las propiedades públicas definen la API de un componente. Un componente propietario que utiliza el componente en su marcado HTML puede acceder a las propiedades públicas del componente. Todas las propiedades públicas son reactivas, lo que significa que el marco de trabajo observa la propiedad buscando cambios. Cuando los valores de la propiedad cambian, el marco de trabajo reacciona y vuelve a representar el componente.  

Utilizar ambos componentes **helloWorld** y **childLwc** 
    
childLwc Js. Para probar este decorador, ejecutarlo primero sin usarlo, y luego usandolo. Para ello debe importar y colocar a la propiedad message.
    
```Apex
import { LightningElement } from 'lwc';

export default class ChildLwc extends LightningElement {
    message;
}
```
childLwc HTML
    
```Apex
<template>
    Componente hijo: {message}
</template>
```
 
helloWorld HTML    
   
```Apex
<template>
    <p>Componente padre</p>

    <c-child-lwc message='Hello'></c-child-lwc>
</template>
```    
