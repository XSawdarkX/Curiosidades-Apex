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

### De cara al usuario final

```Apex
@future
public static void myFutureMethod(){   
  System.debug('Este es un método futuro');
}
```
