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

Si bien se puede usar **Workbench** para probar el consumo, esta herramienta al estar directamente conectada con la instancia, se salta el paso de autenticación.

Pero en un entorno real, el sistema externo primero debe autenticarse ante Salesforce. Pare ello es necesario crear una aplicación conectada con un usuario relacionado, el llamado usuario de integración.

Lo primero que debe hacer el sistema externo es hacer un llamado POST a la siguiente dirección

https://login.salesforce.com/services/oauth2/token

En el body de la solicitud se debe agregar el username y la password del usuario de integración, asi como los atriutos Client id y Client secret generados en la
aplicación conectada. 

Es importante mencionar que cuando se le genera la contraseña por primera vez al usuario, o cada vez que se cambia, se genera un token asociado a la misma. Ese token
debe ser concatenado a la contraseña en el body de la solicitud.

Esta petición POST devuelve lo que se conoce como un token de acceso. Este token debe ser pasado en el Header de la solicitud final para consumir el servicio. 


### Clase de prueba

Para probar una clase que expone un servicio, se usa la misma lógica utilzada para cubrir una clase normal.

Sin embargo, si se desea probar el pasar parametros por la url, se debe usar la clase **RestRequest** y **RestContext** para simular el endpoint como se muestra en el ejemplo de abajo:

```Apex
@isTest
public static void getBookTest(){
    RestRequest request = new RestRequest();
    request.requestUri = 'https://globant-63c-dev-ed.salesforce.com/services/apexrest/Book/2B';
    request.httpMethod = 'GET';
    RestContext.request = request;

    IP_ExponerRestExample_cls.getBook();
}
```

## Servicio SOAP

Usar la clase **IP_ExponerSoapExample_cls**

Para exponer un servicio SOAP se debe crear una clase con métodos **webservice** 

```Apex
global class IP_ExponerSoapExample_cls {
	
    webservice static Account getRecord(String id) {
        return null;
    }
}
```
Luego, es neceario pasarle dos archivos WSDL al sistema externo que quiere consumir el servicio

1. WSDL de la instancias para que se pueda autenticar.  Este WSDL se genera en **API** dentro de configuraciones.
2. WSDL de la clase para que pueda consumir el servicio. Este WSDL se genera en **Apex classes** dentro de configuraciones.

