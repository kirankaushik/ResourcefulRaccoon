@RestResource(UrlMapping='/Accounts/*/contacts')
global class AccountManager {//To perform GET call in below method

    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        List<SObject> recordsToReturn = new List<SObject>();//Declare list of sobjects
        String requestUri = request.requestURI;
        String accountId = requestUri.substringBetween('Accounts/','/contacts');//getting the account id from the request uri
        system.debug(accountId);
        return [SELECT ID,Name,(SELECT ID,Name FROM Contacts) FROM Account  WHERE ID = :accountId];
   }
}