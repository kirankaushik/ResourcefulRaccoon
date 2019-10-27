@isTest
public class AnimalLocatorTest {

    @isTest
    public static void testgetAnimalNameById(){
        test.setMock(HttpCalloutMock.class,new AnimalLocatorMock());
        String animal = AnimalLocator.getAnimalNameById(1);
    }
}