@isTest
public class AccountManagerTest {

   @isTest
    public static void testGetAccounts(){
        Account acct = new Account();
        acct.Name = 'Test';
        insert acct;
        Contact con = new Contact();
        con.FirstName = 'Test';
        con.LastName = 'Contact';
        con.AccountId = acct.Id;
        insert con;
        String accountId = acct.Id;
        RestRequest request = new restRequest();
        request.httpMethod = 'GET';
        request.requestURI = 'https://resourceful-raccoon-wdr713-dev-ed.lightning.force.com/services/apexrest/Accounts/'+accountId+'/contacts';
        system.debug(request);
        RestContext.request = request;
       	Account recordsReturned = AccountManager.getAccount();
        system.debug(recordsReturned);
    }
    
    @isTest
    public static void testGetAccountsNegative(){
        Account acct = new Account();
        acct.Name = 'Test';
        insert acct;
        Contact con = new Contact();
        con.FirstName = 'Test';
        con.LastName = 'Contact';
        con.AccountId = acct.Id;
        insert con;
        String accountId = acct.Id;
        RestRequest request = new restRequest();
        request.httpMethod = 'GET';
        //request.requestURI = 'https://resourceful-raccoon-wdr713-dev-ed.lightning.force.com/services/apexrest/Accounts/'+accountId+'/contacts';
        system.debug(request);
        RestContext.request = request;
       	Account recordsReturned = AccountManager.getAccount();
        system.debug(recordsReturned);
    }
}