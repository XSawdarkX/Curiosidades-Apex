# Visualforce

## ¿Que es?

Es un framework que permite a los desarrolladores crear interfaces graficas.Entiendase por Framework un conjunto de convenciones, estandares, paradigmas, buenas practicas y funcionalidades costosas o complejas ya desarrolladas.

A diferencia de una libreria que solo es un conjunto de funciones.

Ejemplo hamburguesa:

Receta, es el framework.
Salsa de tomate, es la libreria.

Las páginas de Visualforce tiene elementos HTML,Js y Css tal como una aplicación web estándar, pero también tiene elementos propios de Salesforce. 

De los elementos más comunes están **<apex:pageBlock>** que agrupa elementos relacionados, y **<apex:pageBlockSection>** que representa secciones desplegables dentro del bloque.  La segunda etiqueta siempre debe ir dentro de la primera. 

Una pagina de visualforce se compone de dos elementos:

- El enmarcado: la parte visual
- El controlador: La lógica del lado del servidor. Conjunto de instrucciones que se ejecuta cuando un usuario interactua con algún componente del enmarcado.

## ¿Donde se puede usar?

-	Como pestaña dentro de una aplicación 
-	Dentro de un formato de página estándar a través del generador de aplicaciones 
-	Como acción personalizada o acción rápida 
-	Reemplazando la función de algún botón o vinculo estándar 

## ¿Como esta diseñado?

### De cara al desarrollador

![image](https://user-images.githubusercontent.com/100179095/188042625-bcb7019b-a885-4420-bbc4-4cff1775d2ad.png)

1. El desarrollador escribe y guarda una pagina visualforce.
2. El servidor intenta compilar la pagina
3. Si la compilación devuelve errores, se cancela el guardado y los incidentes se retornan al desarrollador
4. Si no se generan errores, las instrucciones o la pagina, se guardan en el repositorio de metadatos y se envian al renderizador que termina
actualizando la vista del desarrollador

### De cara al usuario final

![image](https://user-images.githubusercontent.com/100179095/188042910-b6fdcc3b-adc0-43df-b6e6-13afe600c9ba.png)

1. El usuario final solicita una pagina de visualforce
2. Como lapagina ya esta compilada, el servidor simplemente recupera la metadata y renderiza la pagina

## ¿Cuando debo usarlo?


## Creación de una visualforce

Para crear una visualforce se pueden implementar diferentes métodos.

1. Desde configuraciones en Visualfoce
2. Desde la Developer console
3. Si se tiene acivado el modo de desarrollador, con colocar una url como la siguiente, el sistema detecta si ya existe o no y me permite crearla de una vez. Esta forma funciona en Salesforce Classic. 

**https://globant-63c-dev-ed.lightning.force.com/apex/HelloWorldTwo**

```Apex
<apex:page>
    <h1>Hello World</h1>
</apex:page>
```

Para depurar y previsulizar la página se puede usar:

1.  La developer console. COn el boton de **Peview**
2.  Agregando la página al lugar donde va a quedar
3.  Ejecutando el siguiente comando en la consola de Google. Esto para que funcione en lightning.En classic solo basta con colocar una url como la de arriba.
 
```Apex
$A.get("e.force:navigateToURL").setParams(
    {"url": "/apex/pageName"}).fire();
```

Importante no moverse de la pestaña donde ejecute el comando, de lo contrario tocaría volver a ejecutar el código. 

## Ejemplo Css y  Js

```Apex
<apex:page>

    <style>
    	h1{
        	color : blue;
        }
    </style>
    
    <h1>Hello World</h1>
    
    <script>
        window.onload = function() {
            alert('Page is loaded');
        };
    </script>
    
</apex:page>
```

## Expresiones

Las expresiones se usan para mostrar información dinámica; como datos recuperados de la base de datos o un servicio web. Estos datos pueden ser cálculos, propiedades estándar, o variables globales.

Una expresión usa la siguiente sintaxis: {! expression }

No se tienen en cuenta los espacios ni las mayúsculas o minúsculas.

### variables globales

Las variables globales se usan para mostrar recursos del sistema.

```Apex
<apex:page >
     
    <h1>Hello World dd</h1>
    
    <p> Buenos días {! $User.FirstName } {! $User.LastName}, tú username es: {! $User.username}</p>
    
    <p> Probando etiquetas personalizadas: {!$Label.CantidadLibrosLibreria}</p>
    
    <p> Permisos sobre el objeto Lead: {!$ObjectType.Lead.accessible}</p>
    
</apex:page>
```
Para probar el siguiente ejemplo usar el siguiente enlace:

https://globant-63c-dev-ed--c.vf.force.com/apex/HelloWorld?edad=30&peso=60

```Apex
     <p>Mi edad es: {!$CurrentPage.parameters.edad}, pero mi peso es: {!$CurrentPage.parameters.peso}</p>
```

### Formulas

Hay diferentes fórmulas estándar que puede usar en las expresiones como & para concatenar o TODAY() para obtener la fecha actual

```Apex
<apex:page >
     
    <h1>Hello World dd</h1>
    
    <p> Buenos días {! $User.FirstName & ' ' & $User.LastName } </p>
    
    <p> Today's Date is {! TODAY() } </p>
    
    <p> The year today is {! YEAR(TODAY()) } </p>
    
</apex:page>
```
### Condicionales

Puede usar condicionales dentro de las expresiones

```Apex
<p>{! IF( CONTAINS('salesforce.com','force.com'),'Yep', 'Nope') }</p>
```

## Controlador estandar

La Visualforce usa la modelo vista controlador, y proporciona controladores estándar que permiten usar acciones estándar y acceso a datos de manera rápida. El controlador se encarga de proporcionar funcionalidad a la página. Por ejemplo, el controlador puede contener la lógica que se ejecutará cuando se haga clic en un botón

La mayoría de los objetos estándar y todos los personalizados tienen controladores estándar que se pueden usar para interactuar con los datos asociados con el objeto, por lo que no es necesario que escriba el código para el controlador usted mismo. Puede ampliar los controladores estándar para agregar nuevas funciones o crear controladores personalizados desde cero.

Para que el controlador estandar funcione debe usar el atributo **standardController** en la etiqueta principal, aquí se debe especificar el nombre
Api del objeto. También es importante pasar el Id del registro por la url.

https://globant-63c-dev-ed--c.vf.force.com/apex/HelloWorld?id=a018X00000YPQ5tQAH

Cada controlador estandar incluye un método getter que retorna el registro especificado por el id de la url. Es importante que el registro corresponda con un id del objeto configurado como controlador estandar, de lo contrario el sistema arrojara un error.

Para acceder a los campos del registro utilizo la siguiente expresión: {!object}

Con la notación de punto puedo acceder hasta 5 niveles hacia arriba.

```Apex
<apex:page standardController="Libro__c">
     
    <h1>Hello World dd</h1>
    
    <p> <strong>Nombre del libro: </strong> {!Libro__c.Name}</p>
    <p> <strong>Nombre del Autor: </strong> {!Libro__c.Autor__r.Name}</p>
    <p> <strong>Nombre del propietario del Autor: </strong> {!Libro__c.Autor__r.owner.Name}</p>
    
</apex:page>
```

Además con la notación de puntos puedo acceder un nivel hacia mi objeto hijo.

```Apex
<apex:page standardController="Libro__c">
    <p> <strong>Compra libros: </strong> {!Libro__c.Compra_Libros__r}</p>
</apex:page>
```
El controlador estándar también cuenta con acciones predeterminadas que permiten crear, modificar y eliminar información. 

## Componentes de salida

Le permiten mostrar la información. Hay componentes que muestran un conjunto más amplio de información, como el elemento:  **<apex:detail/>** que muestra tal cual la página de detalles de un registro con sus listas relacionadas. Para ver en funcionamiento esta etiqueta necesita pasar el Id del registro en la url de la página.

A través del atributo **relatedList** puede hacer que no se imprima ninguna lista relacionada, y luego con el componente **<apex:relatedList>** Agregar las listas que desee. 

```Apex
<apex:page standardController="Libro__c">
    <apex:detail/>
    
    <apex:detail relatedList="false"/>
    <apex:relatedList list="Compra_Libros__r" pageSize="5"/>

</apex:page>
```
Hay otros components que permiten mostrar información en campo individuales, como <apex: outputField>.

```Apex
<apex:page standardController="Libro__c">
    
    <!--Ejemplo 1-->
    <apex:outputField value="{! Libro__c.Name }"/>
    
    <!--Ejemplo 2-->
    <apex:pageBlock title="Libro Summary">
         <apex:outputField value="{! Libro__c.Name }"/>
    </apex:pageBlock>
     
     <!--Ejemplo 3-->
     <apex:pageBlock title="Libro Summary">
         <apex:pageBlockSection >
             <apex:outputField value="{! Libro__c.Name }"/>
         </apex:pageBlockSection>
     </apex:pageBlock>
      
</apex:page>
```

Para que la información se muestre con el formato de Salesforce, procure que su elemento **<apex: outputField>** se encuentre dentro de las etiquetas de bloque que vimos anteriormente, de lo contrario se imprimirán como texto normal. 

Otro componente útil es **<apex:pageBlockTable>** que permite como su nombre lo indica generar una tabla. Es bastante funcional a la hora de querer mostrar una lista de registros relacionados, por ejemplo.

```Apex
<apex:page standardController="Libro__c">
     
     <apex:pageBlock title="Libro Summary">
         <apex:pageBlockSection >
             <apex:outputField value="{! Libro__c.Name }"/>
         </apex:pageBlockSection>
     </apex:pageBlock>
     
     <apex:pageBlock title="Compras Libros">
       <apex:pageBlockTable value="{!Libro__c.Compra_Libros__r}" var="compraLibro">
          <apex:column value="{!compraLibro.Name}"/>
          <apex:column value="{!compraLibro.IP_Valor_Unitario__c}"/>
          <apex:column value="{!compraLibro.IP_Cantidad__c}"/>
          <apex:column value="{!compraLibro.IP_Valor_Compra__c}"/>
       </apex:pageBlockTable>
    </apex:pageBlock>
      
</apex:page>
```

## Componentes de entrada

## Controlador de lista estandar

## Recursos estaticos

## Controlador personalizado

## extensiones

