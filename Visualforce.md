# Visualforce

## ¿Que es?

Es un framework que permite a los desarrolladores crear interfaces graficas.Entiendase por Framework un conjunto de convenciones, estandares, paradigmas, buenas practicas y funcionalidades costosas o complejas ya desarrolladas.

A diferencia de una libreria que solo es un conjunto de funciones.

Ejemplo hamburguesa:

Receta, es el framework.
Salsa de tomate, es la libreria.

Las páginas de Visualforce tiene elementos HTML,Js y Css tal como una aplicación web estándar, pero también tiene elementos propios de Salesforce. 

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

```Apex
<apex:page>
    <h1>Hello World</h1>
</apex:page>
```

## Expresiones

## variables globales

## Formulas

## Condicionales

## Controlador estandar

## Componentes de salida

## Componentes de entrada

## Controlador de lista estandar

## Recursos estaticos

## Controlador personalizado

## extensiones

