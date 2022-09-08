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

- Para personalizar sus aplicaciones de Salesforce, ya se agregandolo a una Home page, o App page.
- Como record page.
- Como una acción rápida o acción global.
- Como fichas
- Para sustituir acciones estándar.  
- En comunidades
- Crear aplicaciones independientes alojadas en Salesforce pero que se ejecutan en otro contexto

A diferencia de Visualforce, no se pueden crear botones, solo acciones.

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

```Apex
p.THIS{
    color:blue;
}
```

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

## Expresiones

La expresiones nos permiten mostrar información dinamica. 

La sintaxis de una expresión es {!$Profile.Name}. 

### Variables globales

De acuerdo a la documentación de las variables globales, solo la de Label esta disponible en Aura component.

```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global" >
    <p>Hello world</p>
    <p>La cantidad de libros en la Libreria es:  {!$User.c.CantidadLibrosLibreria}</p>
</aura:component>
```

### Formulas

Ejemplos:

**add:** Suma dos numeros

```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global" >
    <p>Hello world</p>
    <p>1 + 2 = {!add(1,2)}</p>
</aura:component>
```

**concat:** Concatena dos argumentos

```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global" >
    <p>Hello world</p>
    <p>Bienvenido {!concat('Daniel ','Junca')}!</p>
</aura:component>
```

**lessthan:** retorna true si el primer argumento es menor que el segundo

```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global" >
    <p>Hello world</p>
    <p>¿5 es menor que 10?: {!lessthan(5,10)}</p>
</aura:component>
```

**and:** Evalua si las dos argumentos se cumplen

```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global" >
    <p>Hello world</p>
    <p>{!and(true,true)}</p>
</aura:component>
```

## Atributos

Los componentes pueden tener atributos o variables. Se usan para almacenar datos que cambian. Se comportan similar a los atributos o propiedades de una clase,
pero a diferencia de una visualforce, yo no puedo acceder directamente a las propiedades de la clase Apex o Controlador. La manera de utilizar atributos de apex
en mi componente es creando mis propios atributos en mi componente y llenandolos desde el Controlador Js o el Helper.

Un atributo se define utilizando una etiqueta **<aura:attribute>**, que requiere valores para los atributos **name** y **type**, y acepta estos atributos opcionales: **default**, **description**, **required** o **access**.

```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global" >
    <p>Hello world</p>
    
    <!--Mal-->
    <aura:attribute/>
    
    <!--Mal-->
    <aura:attribute name='message'/>
    
    <!--Bien-->
    <aura:attribute name='message' type='String'/>
    
</aura:component>
```

Si coloco un atributo como obligatorio y mi componente ya esta contenido en uno de los posibles entornos, menos en la aplicación que creamos al comienzo, el sistema
me pedira que utilice el atributo **default** para darle un valor por defecto a mi variable.

Para probar utilicé la pagína de registro de la Cuenta, agregando y desagregando el componente **AuraHelloWorld**. 

Se puede acceder a la variable a través de su **name**. El **Type** es obligatorio porque debemos saber que tipo de información almacenara el atributo, es decir,
es de tipado fuerte.

### posibles tipos de datos

- **String**

```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global" >

    <aura:attribute name='message' type='String' default='everybody lies'/>
    
    <p>{!v.message}</p>
    
</aura:component>
```

- **Integer**. Todos los valores por defecto, independientemente del tipo, deben ir entre comillas. También se puee observar que en la expresión del **Resultado**
solo es necesario usar una vez el simbolo **!**

```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global" >
    <aura:attribute name='valor1' type='Integer' default='5'/>
    <aura:attribute name='valor2' type='Integer' default='6'/>
    
    <p>Valor 1: {!v.valor1}</p>
    <p>Valor 2: {!v.valor2}</p>
    <p>Resultado: {!add(v.valor2,v.valor1)}</p>
</aura:component>    
```

- **Date**. Siempre en formato YYYY-MM-DD

```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global" >
    
    <aura:attribute name="startDate" type="Date" default='2022-09-20'/>
    
    <p>startDate: {!v.startDate}</p>
    
</aura:component>
```

- **Decimal**. Se puede especificar con puntos o comas.

```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global" >
    
    <aura:attribute name='valor1' type='Decimal' default='5,5'/>
    <aura:attribute name='valor2' type='Decimal' default='6.4'/>
    
    <p>Valor 1: {!v.valor1}</p>
    <p>Valor 2: {!v.valor2}</p>
    <p>Resultado: {!add(v.valor2,v.valor1)}</p>
    
</aura:component>
```

- **DateTime**. Siempre en formato YYYY-MM-DDTHH:MM:SSZ

```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global" >
    
    <aura:attribute name="lastModifiedDate" type="DateTime" default='2022-08-30T10:25:10Z'/>
    
    <p>lastModifiedDate: {!v.lastModifiedDate}</p>
    
</aura:component>
```

- **Tenemos las colecciones:** List, Set, Map

```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global" >
    
    <aura:attribute name="colorPalette" type="List" default="['red', 'green', 'blue','red']"/>
    
    <p>colorPalette: {!v.colorPalette[0]}</p>
    
    <p>colorPalette cantidad elementos: {!v.colorPalette.length}</p>
    
    <aura:attribute name="collection" type="Set" default="['red', 'green', 'blue','red']"/>
    
    <p>collection cantidad elementos: {!v.collection.length}</p>
    
    <aura:attribute name="sectionLabels" type="Map" default="{ a: 'label1', b: 'label2' }" />
    
    <p>sectionLabels1: {!v.sectionLabels.a}</p>
    <p>sectionLabels2: {!v.sectionLabels.b}</p>
    
</aura:component>
```

- **Objectos estándar y Custom**. Si solo imprimo el objeto con un valor por defecto se mostrata **[object,object]**, pero yo puedo acceder a un campo en 
especifio a través de la notación de puntos.

```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global" >
    
    <aura:attribute name="acct" type="Account"/>
    
    <aura:attribute name="objLibro" type="Libro__c"/>
    
    <aura:attribute name="objLibro" type="Libro__c" 
                    default="{
				'Name': 'La quinta ola',
        			'IP_Cantidad__c': '5',                                                
                	        'IP_NumeroSerie__c ': '300B'}"/>
    
    <p>objLibro: {!v.objLibro}</p>
    
    <p>objLibro: {!v.objLibro.Name}</p>
        
</aura:component>
```

- **Clases de Apex**
 
```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global" >
    
 	<aura:attribute name="claseTest" type="IP_AuraController_cls"/>
    
</aura:component>
```

## Proveedor de valores

Los proveedores de valores son una forma de agrupar, encapsular y acceder a los datos relacionados. **v** es un proveedor de valores para la vista.

Piense en **v** como una variable automática que está disponible para su uso.

![image](https://user-images.githubusercontent.com/100179095/188964140-5edfde26-2d68-4ce1-9cad-90ecfccad150.png)

Cuando el atributo de un componente es un objeto u otros datos estructurados (o sea, no un valor primitivo), acceda a los valores de ese atributo empleando la misma notación de punto. Por ejemplo, {!v.account.Id} accede al campo Id de un registro de cuenta.

## Condicionales

Permiten evaluar una condición y hacer algo si se cumple o no. A diferencia de los if normales, en el aura el **else** no esta al mismo nivel, si no que se encuentra
al interior del if, lo que puede llegar a ser un poco confuso.

```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global" >
    
    <aura:attribute name="Edad" type="Integer" default='16'/>
    
    <aura:if isTrue="{!v.Edad >= 18}">
        
        Es mayor de Edad
        
        <aura:set attribute="else">
           No es menor de Edad 
        </aura:set>
     </aura:if>
    
</aura:component>
```

Ejemplo else if. El operador **<** y **<=** no se puede usar, sine embargo podemos usar el método **lessthan**. 

También reclarcalar que el **&&** tampoco funciona como **and**, en su lugar usamos: **&amp;&amp;**.

```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global" >
    
    <aura:attribute name="Edad" type="Integer" default='5'/>
    
  	<aura:if isTrue="{! v.Edad >= 1 &amp;&amp; lessthan(v.Edad,12)}">
        
       		Soy un niño
        
        	<aura:set attribute="else">
           		<aura:if isTrue="{! v.Edad >= 13 &amp;&amp; lessthan(v.Edad,18)}">
        
        			Soy un adolescente
        
                		<aura:set attribute="else">
                    			Soy un adulto T-T
                		</aura:set>
    			</aura:if>
        	</aura:set>
    	</aura:if>
    
</aura:component>
```

## Iterador

Me permite recorrer o Iterar un conjunto de valores.

```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global" >
    
    <aura:attribute name="colorPalette" type="List" default="['red', 'green', 'blue','red']"/>
    
    <aura:iteration var="color" items="{!v.colorPalette}">
        <p>{!color}</p>
    </aura:iteration>
    
</aura:component>
```

## Algunos componentes preconstruidos o etiquetas propias de Aura

```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global" >
    
    <lightning:card footer="Card Footer" title="Hello">
        
    </lightning:card>    
    
</aura:component>
```

```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global" >
    
    <lightning:avatar src="/bad/image/url.jpg" initials="" fallbackIconName="standard:avatar"  alternativeText="Bob Wilson" class="slds-m-right_small"/>
    
</aura:component>
```

```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global" >
    
    <lightning:button variant="brand" label="Brand" title="Brand action" onclick="{! c.handleClick }" />
    
</aura:component>
```

```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global" >
    
    <h2>
        Basic Input Date
    	<lightning:helptext content="La fecha debe pertencer a este mes"/>
    </h2>
    
    <lightning:input type="date" name="inputDate"/>
    
</aura:component>
```

```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global" >
    
    <lightning:progressBar value="50" size="large" />
    
</aura:component>
```

## Controlador Js

Los controladores permiten que los componentes sean interactivos. Un controlador es básicamente un conjunto de código que define el comportamiento de su aplicación cuando “suceden cosas”. A través de la definición del componente se puede hacer referencias a métodos o funciones construidas en el controlador. Para ello se usa el proveedor de valores del controlador del lado del cliente c. En el ejemplo de abajo se llama la función handleClick por medio del atributo onclick del botón. 

```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global" >
    
     <aura:attribute name='message' type='String'/>
    
     <p>Message of the day: {!v.message}</p>
    
     <div>
         <lightning:button label="You look nice today." onclick="{!c.handleClick}"/>
        
         <lightning:button label="Today is going to be a great day!" onclick="{!c.handleClick}"/>
	 </div>	
    
</aura:component>
```
Por lo tanto, **{!c.handleClick}** es una referencia a un gestor de acciones o método en el controlador del componente.

Tomando como referencia el patrón MVC. Lightning components sería más bien Vista-Controlador-Controlador-Base de datos. Ya que este marco de trabajo tiene un controlador del lado del cliente con Js, y un controlador del lado del servidor con Apex. 

Ejemplo controlador Js

```Apex
({
	handleClick : function(component, event, helper) {
        
   	let btnClicked = event.getSource();    
        let btnMessage = btnClicked.get("v.label"); 
        
        component.set("v.message", btnMessage);     
	}
})
```

Los recursos de controlador tienen un formato interesante. Son objetos de JavaScript que contienen un mapa de pares de nombre-valor, donde el nombre es el nombre del gestor de acciones y el valor es la definición de una función. El gestor de acciones, para que se entienda mejor, es básicamente un método. El controlador puede tener un sinfín de métodos, cada uno separado por coma. 

Los métodos pueden definirse sin parametro alguno

```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global">
     
     <lightning:button label="Get All Books" onclick="{!c.getBooks}"/>
    
</aura:component>
```

```Apex
getBooks : function() { 
     	console.log('Entro getBooks');  
	}
```

Pero, por regla general, independientemente si no se usa uno de ellos, cuenta con tres parámetros. Los parametros pueden tener el nombre que quieran,
pero es importante siempre agregar los tres, ya que el primero siempre representa al componente, el segungo al Evento, y el tercero al Helper.

- **Component:** El componente
- **Event:** El evento que causo la llamada del gestor de acciones
- **Helper:** Otro recurso Js para definir métodos reutilizables. 

Puede llamar get() en cualquier componente y proporcionar el nombre del atributo que desea recuperar, en el formato v.attributeName. El resultado es el valor del atributo.

Existe la contraparte del get(), y es el set() para modificar el valor de un atributo definido en el componente. component.set("v.message", ‘Nuevo valor’);  

Ejemplo método get y Helper

```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global" >
    
     <aura:attribute name='message' type='String' default='Lindo día'/>
    
     <p>Message of the day: {!v.message}</p>
    
     <lightning:button label="You look nice today." onclick="{!c.handleClick}"/>
    
</aura:component>
```

Controlador Js
```Apex
({
	handleClick : function(component, event, helper) {        
        	helper.helperMethod(component,event);
	}
})
```

Helper
```Apex
({
	helperMethod : function(component, event) {
		let defaultMessage = component.get("v.message");     
        
        	console.log('defaultMessage: '+defaultMessage);
        
       		let btnClicked = event.getSource();  
        	let btnMessage = btnClicked.get("v.label"); 
        
        	let finalmessage = defaultMessage + '/' + btnMessage;
        
        	component.set("v.message", finalmessage);     
	}
})
```

## Controlador Apex

Los controladores del lado del servidor no son más que clases de apex que interactúan directamente con la base de datos. En estas clases se puede crear métodos para usar por el controlador Js. Estos métodos siempre deben ser globales o públicos, deben ser estáticos, y deben estar acompañados del tag **@AuraEnabled**

Las llamadas de servidor son caras, y pueden tardar un poco de tiempo.

La solución para mantener la capacidad de respuesta mientras se espera es que las respuestas de servidor se gestionan de forma **asíncrona**. Lo que esto significa es que cuando hace clic en el botón get Books, su controlador del lado del cliente desencadena una solicitud de servidor y sigue procesando. No solo no espera al servidor, ¡olvida que realizó la solicitud!

Para conectar el componente con el controlador de apex no más hace falta usar el parámetro **controller** en la etiqueta de apertura **aura:component**

```Apex
<aura:component controller="IP_AuraController_cls">
```

Ejemplo llamada método apex sin parametros:

Componente

```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global" 
                controller='IP_AuraController_cls'>
    
     <aura:attribute name='books' type='Libro__c[]'/>
    
     <h1>Books</h1>
    
	 <aura:iteration var="book" items="{!v.books}">
        <p>{!book.Name}</p>
     </aura:iteration>    
    
     <lightning:button label="Get All Books" onclick="{!c.getBooks}"/>
    
</aura:component>
```

Controlador Js

```Apex
({
	getBooks : function(component,event,helper) { 
        	helper.getBooksHelper(component,event);
	}
})
```

Helper

```Apex
({
	getBooksHelper : function(component,event) {
        
         let action = component.get("c.getBooks");
        
         action.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.books", response.getReturnValue());
            }else {
                console.log("Failed with state: " + state);
            }
        });

		$A.enqueueAction(action);
	}
})
```

Controlador Apex

```Apex
public class IP_AuraController_cls {

    @AuraEnabled
    public static List<Libro__c> getBooks() {
        return [SELECT Name FROM Libro__c];
    }
}
```

1. Lo primero que se debe hacer es un llamado al método:  

```Apex
let action = component.get("c.getBooks");
```

2. La siguiente línea que se ejecuta es **$A.enqueueAction(action);**

$A es una variable global de marco que proporciona un número de importantes funciones y servicios. $A.enqueueAction(action) agrega la llamada del servidor que acabamos de configurar a la cola de solicitudes del marco de componentes Aura. Esta, junto con otras solicitudes de servidor pendientes, se enviará al servidor en el siguiente ciclo de solicitudes.

3. El llamado a los métodos de Apex funciona de manera asíncrona. 

**this** es el ámbito en el que se ejecutará la devolución de llamadas; aquí this es la función del gestor de acciones en sí. Piense en él como una dirección, o quizá un número. La función es a lo que se llama cuando se devuelve la respuesta del servidor.

**function(response) { ... });** es una función de devolución que se encarga de gestionar la repuesta del servidor. 

Las funciones de devolución de llamadas toman un único parámetro, response, que es un objeto opaco que proporciona los datos devueltos, si los hubiera, y varios detalles sobre el estado de la solicitud.

Ejemplo llamada método apex con parametros. En este ejemplo no se controlan los errores, por lo que si no se coloca nada en el input o se coloca un numero de serie 
que no existe, el componente arrojara un error.

Componente:

```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global" 
                controller='IP_AuraController_cls'>
    
     <aura:attribute name='numeroSerie' type='String'/>
     <aura:attribute name='nombreLibro' type='String' default = 'Fake book'/>

     <lightning:input name="nombreLibro" value="{! v.numeroSerie}" placeholder="Escribe el código del libro" label="Book code" />
    
     <div>
     	<h1>Book</h1>
    
     	<p>{!v.nombreLibro}</p>
     </div>
    
     <lightning:button label="Get All Books" onclick="{!c.getBook}"/>
    
</aura:component>
```

Controlador Js

```Apex
({
	getBook : function(component,event,helper) { 
        helper.getBookHelper(component);
	}
})
```

Helper

```Apex
({
	getBookHelper : function(component) {
        
        	
         let numeroSerie = component.get("v.numeroSerie");
         let action = component.get("c.getBookName");
        
         action.setParams({
            "numeroSerie": numeroSerie
         });

         action.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.nombreLibro", response.getReturnValue());
            }else {
                console.log("Failed with state: " + state);
            }
        });

		$A.enqueueAction(action);
	}
})
```

Controlador Apex

```Apex
public class IP_AuraController_cls {

    @AuraEnabled
    public static String getBookName(String numeroSerie) {
        return [SELECT Name FROM Libro__c where IP_NumeroSerie__c = :numeroSerie].Name;
    }
}
```


Solo debe usar action.setParams y pasar los parámetros en formato Json. “numeroSerie” debe coincidir con el nombre del parámetro definido en el método apex.

### Grafica funcionamiento en conjunto

![image](https://user-images.githubusercontent.com/100179095/189189417-3947c107-f9a5-4ef9-8c43-1840a2c94c3a.png)

## Eventos

El marco utiliza eventos para comunicar datos entre componentes. Los eventos generalmente se desencadenan por una acción del usuario.

La forma correcta de crear una aplicación es crear componentes independientes y luego agruparlos para crear nuevas funciones de más alto nivel.

Existen dos maneras principales de afectar o interactuar con otro componente:

1. Establecer atributos en la etiqueta del componente. Los atributos públicos de un componente constituyen una parte de su API. <c:helloMessage message="{!v.customMessage}"/>

2. A través de eventos. Del mismo modo que los atributos, los componentes declaran los eventos que envían y los eventos que pueden gestionar. Al igual que los atributos, estos eventos públicos constituyen una parte de la API pública del componente.

Los componentes no envían eventos a otro componente. Esa no es la manera de funcionar de los eventos. Los componentes difunden eventos de un tipo en particular. Si hay un componente que responde a ese tipo de evento, y si ese componente “escucha” su evento, actuará sobre él.

Su componente enciende la radio y envía un mensaje. ¿Hay alguien ahí con un aparato de radio encendido y sintonizado en la frecuencia correcta? Su componente no tiene manera de saberlo, de modo que debe redactar sus componentes de una forma en que no pase nada si nadie escucha los eventos que difunden. (O sea, puede que las cosas no funcionen, pero nada se bloquea.)

Los componentes no pueden llegar a otros componentes y establecer valores en ellos. No hay forma de decir “Hola jefe, voy a actualizar expenses.” Los componentes son autónomos. Cuando un componente desea que un componente antecesor realice un cambio en algo, lo solicita. Educadamente. Enviando un evento.

### Tipos de evento

Se podría decir que hay tres tipos de eventos:

- Los eventos del navegador, como el onvlick o el onchange.
- Los eventos personalizados.
- Eventos del sistema.


#### Tipos de evento personalizados

Existen dos tipos de eventos: componente y aplicación. Aquí estamos utilizando un evento componente, porque queremos que un componente antecesor capte y gestione el evento. Un antecesor es un componente “por encima” de este en la jerarquía de componentes. Si deseamos un evento del tipo “difusión general”, donde cualquier componente pueda recibirlo, utilizaríamos un evento aplicación en su lugar.

Para estos ejemplos usaremos un poco de SLDS (Salesforce Lightning Design System ), son estilos propios de Salesforce.

Ejemplo Componente event:

El orden para usar un evento es el siguiente:

1. Definir un evento. (**TestEvent**) 

- Desde la developer console creamos un nuevo lightning event.
- Debemos especificar de que tipo sera, y opcionalmente podemos definirle parametros o atributos.

```Apex
<aura:event type="COMPONENT" description="Event template" >
	<aura:attribute name="messageEvent" type="String"/>
</aura:event>
```

2. Registrar un evento en la definición del componente .cmp en el componente hijo. (**AuraHelloWorldChild**)

```Apex
<aura:component >
    
    <aura:registerEvent name="sendMessage" type="c:TestEvent"/>
    
	<div class="slds-box slds-box_small slds-theme_default divChild">
        <p id='headerChild'>Child Component</p>
        <lightning:button label="Enviar Mensaje" onclick="{!c.fireEvent}"/>
    </div>
</aura:component>
```

El **c:** representa el namespace. En el atributo **type** va el nombre del evento que definimos en el primer punto.En el **name** puede ir cualquier cosa.

3. Obtener una instancia del evento y ejecutarlo en el controlador Js del hijo

```Apex
({
	fireEvent : function(component, event, helper) {
		let message = 'Mensaje enviado desde el componente Hijo';
        
        let customEvent = component.getEvent("sendMessage");
        customEvent.setParams({ "messageEvent": message });
        customEvent.fire();
	}
})
```

4. Registrar un “gestor de eventos” en el componente <padre>. El gestor de eventos realmente es manejado por un gestor de acciones en el controlador

Componente:
	
```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global">
    
    <aura:attribute name='message' type='String' default='Default message'/>
    
    <aura:handler name="sendMessage" event="c:TestEvent" action="{!c.listenEvent}"/>
  
    <div class="slds-box slds-box_small slds-theme_shade">
        <p id='header'>Main Component</p>
        <p><Strong>Message: </Strong> {!v.message} </p>
        <br/>
        <c:AuraHelloWorldChild/>
    </div>
    
</aura:component>
```
	
La etiqueta **<aura:handler>** es el modo de decir que un componente puede, bueno, gestiona un evento específico. 

En el parametro **event** debe ir el nombre del evento que definimos en el punto 1. Además en el **name** debe ir el mismo valor que colocamos en el mismo atriuto
del punto 2 a la hora de registrar el evento.
	
	
Controlador Js
	
```Apex
({
	listenEvent : function(component,event,helper) { 
       
        let message = event.getParam("messageEvent");
        component.set('v.message',message);
	}
})
```	
#### Eventos propios del sistema
	
El marco puede activar varios eventos del sistema durante su ciclo de vida.
	
El evento de este tipo más usado es el **init**, que ocurre cuando el componente se crea/instancia o renderiza por primera vez.	

Componente
	
```Apex
<aura:component implements="flexipage:availableForRecordHome,force:hasRecordId" access="global">
    
    <aura:handler name="init" action="{!c.doInit}" value="{!this}"/>

    <p>Main Component</p>

</aura:component>
```		

El **this** hace referencia al componente actual.
	
Controlador Js
	
```Apex
({
	doInit : function(component,event,helper) { 
       	console.log('Entro método doInit');
	}
})		
```		
	
