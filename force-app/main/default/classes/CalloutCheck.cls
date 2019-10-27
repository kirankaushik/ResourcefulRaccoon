public class CalloutCheck {

    public static String makeGetCallout(Integer id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        HttpResponse response = http.send(request);
        String animalName;
        system.debug(response);
        if(response.getStatusCode() == 200){
            Map<String,Object> responseBodyMap = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());
            system.debug(responseBodyMap);
            Map<String,Object> animalsMap = (Map<String,Object>) responseBodyMap.get('animal');
            animalName = (String) animalsMap.get('name');
            
        }
        return animalName;
    }
    
    public static void doPostCallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setHeader('content-type','application/json');
        request.setBody('{"name":"Horse"}');
        HttpResponse response = http.send(request);
        system.debug(response);
        if(response.getStatusCode() == 201){
            Map<String,Object> responseBodyMap = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());
            system.debug(responseBodyMap);
        }
    }
}