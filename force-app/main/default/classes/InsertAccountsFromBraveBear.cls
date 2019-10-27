@RestResource(UrlMapping='/insertAccountsFromBraveBear/*')
global class InsertAccountsFromBraveBear {

    /*@HttpPost//Commented out as patch is not allowed from callout. this method handles insert,below method handles update when account change is changed
    global static void insertAccounts(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        List<Account> lstAccountsToInsert = new List<Account>();
        system.debug(req.headers);
        system.debug(req.requestBody.toString());
        system.debug(req.requestURI);
        List<Object> lstAccounts = (List<Object>) JSON.deserializeUntyped(req.requestBody.toString());
        for(Object account : lstAccounts){
            Map<String,Object> mapAccounts = (Map<String,Object>) account;
            Account objAccount = new Account();
            objAccount.Name = (String) mapAccounts.get('Name');
            objAccount.Industry = (String) mapAccounts.get('Industry');
            objAccount.Rating = (String) mapAccounts.get('Rating');
            lstAccountsToInsert.add(objAccount);
        }
        
        if(!lstAccountsToInsert.isEmpty()){
            INSERT lstAccountsToInsert;
            res.statusCode = 403;
        }
    }*/
    
    @HttpPost
    global static void updateAccounts(){
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        system.debug(request.requestURI);
        system.debug(request.requestBody.toString());
        List<Object> accountsList = (List<Object>) JSON.deserializeUntyped(request.requestBody.toString());
        List<Account> lstAccountsToUpdate = new List<Account>();
        Schema.SObjectField externalId = Account.Fields.BraveBearId__c;
        for(Object account : accountsList){
            Map<String,Object> accountsMap = (Map<String,Object>) account;
            Account objAccount = new Account();
            objAccount.BraveBearId__c = (String) accountsMap.get('Id');
            objAccount.Name = (String) accountsMap.get('Name');
            lstAccountsToUpdate.add(objAccount);
        }
        
        if(!lstAccountsToUpdate.isEmpty()){
            Database.upsertResult[] srList = Database.upsert(lstAccountsToUpdate,externalId,FALSE);
            response.statusCode = 200;
        }
    }
}