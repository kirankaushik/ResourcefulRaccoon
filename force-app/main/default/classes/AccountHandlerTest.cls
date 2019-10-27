//By default seeAllData is false
@isTest
public class AccountHandlerTest {

    //testsetup methods are executed first
    @testSetup
    static void createAccounts(){
        Account acct = new Account();
        acct.Name = 'Test 1';
        acct.Rating = 'Hot';
        acct.Industry = 'Agriculture';
        acct.NumberOfEmployees = 100;
        INSERT acct;
    }
    
    @isTest
    static void useCreatedAccounts(){//all methods can use the test data created by test setup method
    	Account acct = [Select Id FROM Account];
        system.assert(acct != NULL);
    }
    
    @isTest
    static void checkDescription(){
        List<Account> lstAccounts = Test.loadData(Account.SObjectType,'AccountTestRecords');
    }
    
    @isTest
    static void usingTestDataFactory(){
        TestDataFactory1.insertAccounts(10);
    }
    
    @isTest
    static void usingRunAsMethod(){
        User userToTest = [SELECT Id FROM User WHERE Name Like 'Test%' LIMIT 1];//instead of query, if we instantiate a user and pass it as an argument to system.runAs method,user will be inserted implicitly
        system.runAs(userToTest){
            TestDataFactory1.insertAccounts(10);
        }
        
    }
    
    @isTest
    static void usingStartAndStopTest(){
        Account acct = new Account();
        acct.name = 'test 1';
        INSERT acct;
        Test.startTest();//calling starttest gives new set of governor limits
        system.assert(Limits.getDmlStatements() == 0);
        TestDataFactory1.insertAccounts(10);
        Test.stopTest();//after stoptest, execution continues in original context
   }
}