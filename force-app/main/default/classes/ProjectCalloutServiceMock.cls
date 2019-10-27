public class ProjectCalloutServiceMock implements HttpCalloutMock{
   //Implement http mock callout here
   
    public static HttpResponse respond(HttpRequest request){
        HttpResponse response = new HttpResponse();
        response.setStatusCode(201);
        return response;
    }
}