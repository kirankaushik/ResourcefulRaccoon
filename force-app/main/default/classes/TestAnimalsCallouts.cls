@isTest
public class TestAnimalsCallouts {

    @isTest
    public static void testPostRequest(){
        test.setMock(HttpCalloutMock.class,new MockHttpCallout());
        HttpResponse response = AnimalsCallouts.makePostCallout();
        string contentType = response.getHeader('content-type');
        String responseBody = response.getBody();
        
    }
    
    @isTest
    public static void testGetRequest(){
        test.setMock(HttpCalloutMock.class,new MockHttpCallout());
        HttpResponse response = AnimalsCallouts.makeGetCallout();
    }
}