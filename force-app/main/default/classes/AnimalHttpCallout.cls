public class AnimalHttpCallout {

    public static void getAnimal(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals');
        HttpResponse response = http.send(request);
        system.debug(response);
        if(response.getStatusCode() == 200){
            system.debug('Successful response from server');
            Map<String,Object> requestBodyMap = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());
            system.debug(requestBodyMap.keyset());
            List<Object> animals = (List<Object>) requestBodyMap.get('animals');
            for(Object animal : animals){
                system.debug('I am a '+animal);
            }
        }
    }
    
    public static void putAnimal(){
        Http http = new Http();
        Httprequest request = new Httprequest();
        request.setMethod('POST');
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setHeader('Content-type','application/json');
        request.setBody('{"name":"Horse"}');
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
        if(response.getStatusCode() == 201){
            system.debug(response.getBody());
        }
    }
}