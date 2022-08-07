# Consumir Servicios Web

Usar la clase **IP_ConsumoRestExample_cls**

A través de Apex es posible consumir servicios web. Existe dos tipos de llamados que podemos usar para dicho proposito, REST y SOAP. 

## Servicio REST

Las llamadas REST se basan en el protocolo HTTP. Cada solicitud se asocia a un método de este protocolo, así como a un endPoint.

### Método HTTP

- **GET:** Permite recuperar datos del servicio a través de un endpoint o url
- **POST:** Permite enviar y crear información en el servicio
- **DELETE:** Permite borrar un recurso identificado en el servicio
- **PUT:** Permite crear o actualizar un recurso identificado en el servicio

Las respuestas del servicio pueden ser en formato JSON o XML. Además, el servicio también retorna un código de estado que indica si el llamado se proceso correctamente
o no.

200 : Correcto
404 : recurso no encontrado
500 : Erro interno del servicio

Antes de hacer un llamado a un servicio web, este debe registrarse en la opción **Remote settings** dentro de configuraciones. 

#### Ejemplo solicitud método GET

Para hacer consumir un servicio web usamos tres clases:

- **Http:** Esta clase permite iniciar un request y un responde Http.
- **HttpRequest:** Esta clase permite construir el request de la solicitud
- **HttpResponse:** Esta clase permitealmacenar la respuesta por parte del servicio

```Apex
Http http = new Http();

HttpRequest request = new HttpRequest();
request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
request.setMethod('GET');

HttpResponse response = http.send(request);

if(response.getStatusCode() == 200) {

    Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());

    List<Object> animals = (List<Object>) results.get('animals');
    
    System.debug('Received the following animals:');
    for(Object animal: animals) {
        System.debug(animal);
    }
}
```
Para leer la respuesta del servicio se puede usar el método **deserializeUntyped** de la clase JSON. Esta forma se usa cuando queremos obtener una tributo especifico
de la respuesta.

```Apex
Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
```

Para obtener la estrucrutra completa de la respuesta, podemos crear una clase wrapper que simule el mismo formato que esperamos recibir. Para ello debemos usar 
el método **deserialize** de la clase JSON.

Usar la clase **IP_AnimalService_wpr**. Es importante que los attributos de mi clase wrapper se llamen igual que los de la respuesta JSON.

```Apex
IP_AnimalService_wpr results = (IP_AnimalService_wpr) JSON.deserialize(response.getBody(),IP_AnimalService_wpr.class);
```

#### Ejemplo recibiendo respuesta XML

Cuando el servicio envian un respuesta en formato XML usamos los siguientes métodos para gestionarla. Supongamos que la respuesta del servicio es:

```Apex
<address>
    <name>Kirk Stevens</name>
    <street1>808 State St</street1>
    <street2>Apt. 2</street2>
    <city>Palookaville</city>
    <state>PA</state>
    <country>USA</country>
</address>
```

Lo primero que haremos sera ubicarnos en el documento por medio del método **getBodyDocument** de la clase HttpRequest.

```Apex
Dom.Document doc = res.getBodyDocument();
```

Posteriormente nos moveremos a la etiqueta principal o Raiz con el método **getRootElement**.

```Apex
 Dom.XMLNode address = doc.getRootElement();
```

Por último, para acceder al valor de cada etiqueta, usamos el método **getChildElement**

```Apex
String name = address.getChildElement('name', null).getText();
String state = address.getChildElement('state', null).getText();
```

El ejemplo completo es:

```Apex
public void parseResponseDom(String url){
    Http h = new Http();
    
    HttpRequest req = new HttpRequest();
    req.setEndpoint(url);
    req.setMethod('GET');
    
    HttpResponse res = h.send(req);
    Dom.Document doc = res.getBodyDocument();

    Dom.XMLNode address = doc.getRootElement();

    String name = address.getChildElement('name', null).getText();
    String state = address.getChildElement('state', null).getText();

    System.debug('Name: ' + name);
    System.debug('State: ' + state);

    for(Dom.XMLNode child : address.getChildElements()) {
       System.debug(child.getText());
    }
}
```

#### Ejemplo solicitud método POST

```Apex
Http http = new Http();

HttpRequest request = new HttpRequest();
request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
request.setMethod('POST');	
request.setHeader('Content-Type', 'application/json;charset=UTF-8');
request.setBody('{"name":"mighty moose"}');

HttpResponse response = http.send(request);

if(response.getStatusCode() != 201)
  System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
else 
  System.debug(response.getBody());
```

Para crear el body en formato JSON se pueden usar tres formas: 

- Crearlo manualmente concatenando Strings hasta crear la estrcutura, como se ve en el ejmplo de arriba.
- Usando la clase JSONGenerator 

```Apex
JSONGenerator gen = JSON.createGenerator(true);
gen.writeStartObject();
gen.writeStringField('name', 'Tiburon');
gen.writeEndObject();
String pretty = gen.getAsString();
System.debug('pretty: '+pretty);
```
- Con una clase wrapper. El nombre de los atributos o propiedades deben ser tal cual los espera el servicio

```Apex
public class IP_AnimalService_wpr {
   public String name;
}
```

```Apex
IP_AnimalService_wpr objAnimal = new IP_AnimalService_wpr();
objAnimal.Name = 'Leon'; 
String JSONData = JSON.serialize(objAnimal);
System.debug('JSONData: '+JSONData);
```

### Clases de prueba Servicio REST

Usar clases **IP_ConsumoRestExample_mck** y ****

Para cubrir una clase que consume servicios web, es necesario crear una clase que implementa la interfaz **HttpCalloutMock**  para simular la respuesta por parte del servicio.

```Apex
global class YourHttpCalloutMockImpl implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req) {
        // Create a fake response.
        // Set response values, and 
        // return response.
    }
}
```

Después, en la clase de prueba, usamos el método **setMock** de la clase Test para obtener dicha respuesta. Este método recibe una instancia de la clase
HttpCalloutMock, y una instancia del mock que creamos.

```Apex
@isTest
public static void consumirAnimalsServiceTest(){
  Test.setMock(HttpCalloutMock.class, new IP_ConsumoRestExample_mck());   
  IP_ConsumoRestExample_cls.consumirAnimalsService();
}
```

## Servicio SOAP

Para consumir un servicio SOAP, primero es necesario tener el archivo wsdl del servicio. [Ejemplo archivo] (https://th-apex-soap-service.herokuapp.com/assets/calculator.xml?_ga=2.118020682.23553583.1659735192-527544349.1658848405)

1. Una vez se tiene ese recurso, desde el boton **Generate From WSDL** ubicado en **Apex classes** en configuraciones, generamos las clases Apex correspondientes a dicho archivo.   
2. Al final se generan dos clases, una para llamados síncronos y otra para llamados asíncronos comenzada con el sufijo Async. Apartir de esta clases consumimos el servicio.
3. Para probar un consumo SOAP, se debe crear una clase que implemente la interfaz **WebServiceMock** 










