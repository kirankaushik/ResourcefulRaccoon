@isTest(seeAllData = true)
private class ProjectCalloutServiceTest {
  //Implement mock callout tests here
  
    @isTest
    static void testCalloutLogic(){
        test.setMock(HttpCalloutMock.class,new ProjectCalloutServiceMock());
        List<ID> opptyIds = new List<ID>();
        for(Opportunity oppty : [SELECT ID FROM Opportunity]){
            opptyIds.add(oppty.Id);
        }
        ProjectCalloutService.postOpportunityToPMS(opptyIds);
    }
}