@RestResource(UrlMapping='/Accounts/*/contacts')
global class AccountManager {

    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        List<SObject> recordsToReturn = new List<SObject>();
        String requestUri = request.requestURI;
        String accountId = requestUri.substringBetween('Accounts/','/contacts');//getting the account id from the request uri
        system.debug(accountId);
        return [SELECT ID,Name,(SELECT ID,Name FROM Contacts) FROM Account  WHERE ID = :accountId];
   }
}