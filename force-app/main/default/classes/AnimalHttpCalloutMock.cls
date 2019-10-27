public class AnimalHttpCalloutMock implements HttpCalloutMock{

    public static HttpResponse respond(HttpRequest request){
        HttpResponse response = new HttpResponse();
        response.setBody('{"animals":["chicken","horse"]}');
        response.setStatusCode(200);
        return response;
    }
}