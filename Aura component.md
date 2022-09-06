# Aura Component

## ¿Que es?

Es un framework que permite crear interfaces de usuario para el desarrollo de aplicaciones web en móviles y escritorios. 

Es un conjunto de código y servicios que facilitan la creación de aplicaciones web. 

Son unidades de una aplicación que se pueden reutilizar.

El framework se basa en etiquetas, similar a HTML. De hecho es posible usar HTML, Css, y Js, aunque ya se cuenta con etiquetas o componentes propios de Salesforce.

## ¿Como funciona?

Los componentes Aura manejan Js en el lado del cliente y Apex en el lado del servidor. 

![image](https://user-images.githubusercontent.com/100179095/188726622-c86c4c1f-72c7-4517-a8db-595c5ca00806.png)

## ¿Donde se puede usar?


## ¿Desde donde se puede crear?

Loa componentes aura se pueden crear desde : 

- Desde la Developer Console
- Desde Visual Studio Code

Aparte de dar un nombre al comonente, adicionalmente se puede seleccionar si se desea crear para usar en un Tab, Lightning page, Lightningrecord page o Lightning Communities page. 

Cuando recien se crea el componente, podemos apreciar que al costado derecho se ven una serie de opciones. Estas opciones se conocen como recursos.
Todos los recursos están conectados automaticamente entre sí y cada uno tiene su propia función. En total son 8 recursos. 

## Recursos

- **Component**:
- **Controller**:
- **Helper**:
- **Style**:
- **Documentation**:
- **Rendered**:
- **Design**:
- **SVG**:

## Previsualización

Lamentablemente, a diferencia de una Visualforce, no se puede previsualizar el aspecto del componente hasta que no se encuentre dentro de un contenedor. Una manera rápida de probar el componente es crear una aplicación Lightning desde la **Developer console** --> **Nuevo** --> **Lightning application** y llamar al componente de la siguiente forma. 

```Apex
<aura:application >
	<c:NombreDelComponente/>
</aura:application>
```
En el costado derecho de la aplicación hay una opción de preview.



