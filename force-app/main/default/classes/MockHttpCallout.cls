@isTest
global class MockHttpCallout implements HttpCalloutMock{

    global HttpResponse respond(HttpRequest request){
        HttpResponse response = new HttpResponse();
        response.setHeader('content-type','application/json');
        response.setStatusCode(200);
        response.setBody('{"animals":["chicken","Lion","Goat","Horse"]}');
        return response;
    }
}