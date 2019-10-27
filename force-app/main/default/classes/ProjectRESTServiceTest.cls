@isTest(seeAllData=true)
private class ProjectRESTServiceTest {
  //Implement Apex REST service tests here
  
    @isTest
    static void testInsert(){
        RestRequest req = new RestRequest();
        req.addHeader('content-type', 'application/json');
        req.httpMethod = 'POST';
        RestContext.request = req;
        ProjectRESTService.postProjectData('Test', 'test project', '0066F00000zxQXAQA2', system.today(), system.today()+60, 15000, 'In Progress');
    }
}