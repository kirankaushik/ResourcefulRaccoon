global class CalloutToGetAnimals {

    @future(callout=true)
    global static void getAnimals(){
        Http http = new Http();
		HttpRequest httpRequest = new HttpRequest();
		httpRequest.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals');
		httpRequest.setMethod('GET');
		HttpResponse response = http.send(httprequest);
		if(response.getStatusCode() == 200){
    		system.debug(response.getBody());
    		Map<String,Object> responseBodyString = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
    		system.debug(responseBodyString);
    		List<Object> animalsList = (List<Object>)responseBodyString.get('animals');
            for(Object animal : animalsList){
                system.debug(animal);
            }
            for(Integer i=0;i<animalsList.size();i++){
                system.debug(animalsList.get(i));
            }
	}
	else{
    	system.debug(response.getStatusCode());
	}
    }
    
    @future(callout=true)
    global static void addAnimal(){
        Http http = new Http();
        HttpRequest httpRequest = new HttpRequest();
        httpRequest.setMethod('POST');
        httpRequest.setHeader('content-type','application/json');
        httpRequest.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        httpRequest.setBody('{"name":"Lion"}');
        HttpResponse response = http.send(httpRequest);
        system.debug(response.getStatusCode()+' '+response.getStatus()+' '+response.getBody());
    }
}