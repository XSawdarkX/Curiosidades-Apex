# Exponer Servicios Web

Salesforce permite exponer servicios para que puedan ser consumidos por sistemas externos. 

## Servicio REST

Usar la clase **IP_ExponerRestExample_cls**

Para exponer un servicio REST es necesario crear una clase con la anotación **@RestResource**, a partir de esta anotación se especifica el final del endpoint al que tendra que apuntar el servicio que desea hacer el consumo.

La url base tiene una estructura similar a la siguiente:

https://yourInstance.my.salesforce.com/services/apexrest/

```Apex
@RestResource(urlMapping='/Book/*')
global class IP_ExponerRestExample_cls {

}
```

Dentro de la clase se puede crear una función por cada método Http. Estos deben ser marcados por la anotación del método correspondiente. Cada método debe ser global y estatico.

```Apex
@HttpGet
global static Libro__c getBook() {
    RestRequest request = RestContext.request;
    String numeroSerie = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        
    return [Select id,Name from Libro__c where IP_NumeroSerie__c =:numeroSerie];  
}
```
Para probar este ejemplo hacer una petición GET a la siguiente url en Workbench:

/services/apexrest/Book/1B

### Ejemplo método Post

```Apex
@HttpPost
global static String createBook(String nombre, String numeroSerie){

    Libro__c objLibro = new Libro__c();
    objLibro.Name = nombre;
    objLibro.IP_NumeroSerie__c = numeroSerie;
    insert objLibro;

    return 'El registro '+objLibro.Id+' se inserto correctamente';
}
```
Para probar este ejemplo usar la siguiente url y body:

/services/apexrest/Book/

{
"nombre" : "La ciudad fantasma",
"numeroSerie" : "200B"
}

## Servicio SOAP
