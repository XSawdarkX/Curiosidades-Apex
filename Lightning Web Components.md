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
    
Ejemplo Label
    
Js
   
```Apex
import { LightningElement } from 'lwc';
import labelName from '@salesforce/label/c.CantidadLibrosLibreria';

export default class HelloWorld extends LightningElement {

   cantidad =  labelName;
}
```     
    
HTML
    
```Apex
<template>
    Hay {cantidad} libros en la libreria
</template>
```         
    
Ejemplo recurso estatico
    
Js  
    
```Apex
import { LightningElement } from 'lwc';
import imageCity from '@salesforce/resourceUrl/ImageTest';

export default class HelloWorld extends LightningElement {

   image =  imageCity;
}
```       
    
HTML   
    
```Apex
<template>
    <img src={image}>
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
    
- **@track:** ordena al marco de trabajo que observe los cambios en las propiedades de un objeto o en los elementos de una matriz. Si se produce un cambio, el marco de trabajo vuelve a representar el componente. YA NO ES NECESARIO USARLO    
    
-  **@wire:** ofrece una manera sencilla de obtener y vincular datos desde una organización de Salesforce. 
    
 ## Usando Apex
    
 Puedo llamar clases de apex usando dos formas:
    
 Independientemente de cual forma se utilice, es necesairo primero importar los métodos de apx que vamos a usar. Par ello usamos la siguiente estrutura:
    
 ```Apex   
 import obtenerLibros from '@salesforce/apex/IP_LWC_cls.getBooks';  
 ```  
     
### El decorador wire   
    
El decorador Wire es reactivo, es decir, cada vez que el valor de algún parametro de nuestro método cambia, se ejecuta.   
   
Clase Apex
    
```Apex    
public with sharing class IP_LWC_cls {
   
    @AuraEnabled(cacheable=true)
    public static List<Libro__c> getBooks(String numeroSerie){
        return [Select id,Name,Autor__r.Name from Libro__c where IP_NumeroSerie__c = :numeroSerie];
    }
}
    
```   
Js

```Apex 
import { LightningElement,wire } from 'lwc';
import obtenerLibros from '@salesforce/apex/IP_LWC_cls.getBooks';

export default class HelloWorld extends LightningElement {

    searchKey = '70B';

    @wire(obtenerLibros, { numeroSerie: '$searchKey' })
    libros;  

    handleKeyChange(event) {
        const searchKey = event.target.value;
        this.searchKey = searchKey;
    }

}    
```    
    
HTML  
    
```Apex 
<template>
    <lightning-input type="search"  class="slds-m-bottom_small"  onchange={handleKeyChange} label="Search" value={searchKey}></lightning-input>
    <template if:true={libros.data}>
        <template for:each={libros.data} for:item="Libro">
            <p key={libros.Id}>{Libro.Name}</p>
        </template>
    </template>
</template>    
```       
    
 ### llamarlos de forma imperativa   
    
Esta forma me permite ejecutar un método de Apex a voluntad, como cuando hago clic en algún botón por ejemplo. 
    
Si observamos, esta forma usa Promesas.
    
Una promesa es un objeto que representa un valor que puede que esté disponible «ahora», en un «futuro» o que «nunca» lo esté. Como no se sabe cuándo va a estar disponible, todas las operaciones dependientes de ese valor, tendrán que posponerse en el tiempo. Sigue leyendo para saber cómo funcionan, ya que puede serte de gran utilidad a la hora de crear una web profesional.

JavaScript es «single threaded» (un solo hilo), lo que significa que solo puede ejecutar una acción al mismo tiempo, por lo que utilizar promesas facilita, en buena medida, el control de flujos de datos asíncronos en una aplicación.    
    
```   
Js

```Apex 
import { LightningElement } from 'lwc';
import obtenerLibros from '@salesforce/apex/IP_LWC_cls.getBooks';

export default class HelloWorld extends LightningElement {

    searchKey = '70B';
    libros;
    error;

    handleKeyChange(event) {
        this.searchKey = event.target.value;
    }

    handleSearch() {
        obtenerLibros({ numeroSerie: this.searchKey })
            .then((result) => {
                this.libros = result;
                this.error = undefined;
            })
            .catch((error) => {
                this.error = error;
                this.libros = undefined;
            });
    }

}
```    
    
HTML  
    
```Apex 
<template>
    <lightning-card title="ApexImperativeMethodWithParams" icon-name="custom:custom63"
    >
        <div class="slds-var-m-around_medium">
            <lightning-layout vertical-align="end" class="slds-var-m-bottom_small">
                <lightning-layout-item flexibility="grow">
                    <lightning-input
                        type="search"
                        onchange={handleKeyChange}
                        label="Search"
                        value={searchKey}
                    ></lightning-input>
                </lightning-layout-item>
                <lightning-layout-item class="slds-var-p-left_xx-small">
                    <lightning-button
                        label="Search"
                        onclick={handleSearch}
                    ></lightning-button>
                </lightning-layout-item>
            </lightning-layout>
            <template if:true={libros}>
                <template for:each={libros} for:item="libro">
                    <p key={libro.Id}>{libro.Name}</p>
                </template>
            </template>
        </div>
    </lightning-card>
</template>  
```           
 
## Eventos
  
Los eventos me permiten comunicar información entre componentes. Se puede tener una comunicación de padre a hijo, o viceversa.
    
### Padre a hijo 
    
Invocando una función del componente hijo, desde el componente padre.
    
hijo childLwc
    
Js
 
```Apex     
import { LightningElement } from 'lwc';
import { api } from 'lwc';

export default class ChildLwc extends LightningElement {

   @api message;

   @api
   play(song) {
       console.log('Playing '+song);
   }
}    
```     
    
HTML    
    
```Apex     
<template>
    Componente hijo: {message}
</template>    
```     
 
Padre helloWorld
    
Js
 
```Apex     
import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {

    handlePlay() {
        this.template.querySelector('c-child-lwc').play('without you');
     }
}
```     
    
HTML    
    
```Apex     
<template>
   <p>Componente Padre</p>

   <button onclick={handlePlay}>Play Song</button>
   <c-child-lwc message='Avicii'></c-child-lwc>
</template>   
```         
   
### Hijo a padre
    
El componente secundario envía el evento y el componente principal lo escucha. Al enviar el evento, se crea un objeto de evento que el componente secundario puede pasar al principal. El componente principal tiene un gestor para responder al evento.
    
Hijo childLwc

Js
 
```Apex     
import { LightningElement } from 'lwc';

export default class ChildLwc extends LightningElement {

    playSong() {
        const event = new CustomEvent('song', {
            detail: 'nice to meet you '
        });
        this.dispatchEvent(event);
    }

}    
```     
    
HTML    
    
```Apex     
<template>
    <div>
        Componente hijo: 
        <button onclick={playSong}>Play Song</button>
    </div>
</template>
```
    
Padre helloWorld
    
Js
 
```Apex     
import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {

    song;

    handlePlay(evt) {
        this.song = evt.detail;
     }
}
```     
    
HTML    
    
```Apex     
<template>
   <div> 
   <p>Componente Padre</p>
   La canción es: {song}
   </div> 

   <c-child-lwc onsong={handlePlay}></c-child-lwc>
   
</template>
```             
    
