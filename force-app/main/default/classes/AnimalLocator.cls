public class AnimalLocator {

    public static String getAnimalNameById(Integer id){
        Http http = new Http();
        HttpRequest httpRequest = new HttpRequest();
        httpRequest.setMethod('GET');
        httpRequest.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        HttpResponse response = http.send(httpRequest);
        system.debug(response.getBody());
        Map<String,Object> responseBody = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());
        system.debug(responseBody);
        /*List<Object> animalsList = (List<object>) responseBody.get('animals');
        for(Object animal : animalsList){
            system.debug(animal);
        }*/
        Map<String,Object> animalsMap = (Map<String,Object>) responseBody.get('animal');
        String animalName = (String) animalsMap.get('name');
        
        return animalName;
    }
}