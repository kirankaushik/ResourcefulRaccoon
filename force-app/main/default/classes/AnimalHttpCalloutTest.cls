@isTest
public class AnimalHttpCalloutTest {

    @isTest
    public static void testGetMethod(){
        test.setMock(HttpCalloutMock.class , new AnimalHttpCalloutMock());
        AnimalHttpCallout.getAnimal();
    }
    
    @isTest
    public static void testPutMethod(){
        test.setMock(HttpCalloutMock.class , new AnimalHttpCalloutMock());
        AnimalHttpCallout.putAnimal();
    }
}