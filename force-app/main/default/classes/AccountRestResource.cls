@RestResource(urlMapping='/insertAccounts/*')
global class AccountRestResource {

    @HttpPost
    global static void insertAccounts(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        //system.debug(req.headers);
        //system.debug(req.params);
        //system.debug(req.requestURI);
        //system.debug(req.requestBody);
        List<Object> accountRecords = (List<Object>) JSON.deserializeUntyped(req.requestBody.toString());
        system.debug(accountRecords);
        List<Account> lstAccount = new List<Account>();
        for(Object account : accountRecords){
            Map<String,Object> recordMap = (Map<String,Object>)account;
            Account acct = new Account();
            acct.Name = (String)recordMap.get('Name');
            acct.Industry = (String)recordMap.get('Industry');
            lstAccount.add(acct);
        }
        INSERT lstAccount;
    }
}