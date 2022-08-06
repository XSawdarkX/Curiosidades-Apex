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



