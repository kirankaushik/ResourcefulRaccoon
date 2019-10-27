@isTest
public class MaintenanceRequestTest {

    @isTest
    static void positiveScenarioTest(){
        TestDataFactory.insertVehicles(10,TRUE);
        TestDataFactory.insertProducts(10,TRUE);
        List<Case> casesList = TestDataFactory.insertCaseList(2,TRUE);
        system.debug(casesList);
        TestDataFactory.insertWorkParts(4);
        casesList.get(0).Status = 'Closed';
        UPDATE casesList;
        system.assertEquals(3,[SELECT COUNT() FROM Case],'Expected case is not created');
    }
    
    @isTest
    static void negativeScenarioTest(){
        TestDataFactory.insertVehicles(10,TRUE);
        TestDataFactory.insertProducts(10,TRUE);
        List<Case> casesList = TestDataFactory.insertCaseList(4,FALSE);
        TestDataFactory.insertWorkParts(4);
        casesList.get(0).Status = 'Closed';
        UPDATE casesList;
        system.assertEquals(4,[SELECT COUNT() FROM Case],'Case is created for wrong condition');
    }
    
    @isTest
    static void bulkScenarioTest(){
        TestDataFactory.insertVehicles(200,TRUE);
        TestDataFactory.insertProducts(200,TRUE);
        List<Case> casesToConsider = TestDataFactory.insertCaseList(300, TRUE);
        List<Case> casesNotToConsider = TestDataFactory.insertCaseList(300, FALSE);
        List<Case> casesToUpdate = new List<Case>();
        List<Case> casesToCheck = new List<Case>();
        casesToCheck.addAll(casesToConsider);
        casesToCheck.addAll(casesNotToConsider);
        TestDataFactory.insertWorkParts(500);
        Integer workParts = [SELECT COUNT() FROM Work_Part__c];
        system.debug(workParts);
        for(Case c : casesToCheck){
            c.Status = 'Closed';
            casesToUpdate.add(c);
        }
        if(!casesToUpdate.isEmpty()){
            UPDATE casesToUpdate;
        }
        system.assertEquals(900,[SELECT COUNT() FROM Case],'Bulk scenario failed');
    }
}