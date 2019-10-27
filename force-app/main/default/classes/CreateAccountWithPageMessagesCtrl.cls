public class CreateAccountWithPageMessagesCtrl {

    public Account account { get; set; }
    public Boolean error;
    
    public CreateAccountWithPageMessagesCtrl(ApexPages.StandardController stdCon){
        this.account = (Account) stdCon.getRecord();
    }
    
    public PageReference save(){
        error = FALSE;
        if(account.Name == 'test'){
            error = TRUE;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR , 'There are already test accounts.give some different name','To see records that start with test, query !!'));
        }
        if(account.Rating == 'Cold'){
            system.debug('Inside rating validation');
            error = TRUE;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Warning,'Try to insert accounts with hot or warm ratings'));
        }
        if(account.Industry == 'Agriculture'){
            error = TRUE;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Info,'Thanks for adding a agri account'));
        }
        if(account.NumberOfEmployees >= 100000){
            error = TRUE;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Confirm,'Are you sure about the number of employees??'));
        }
        system.debug(error);
        if(!error){
		INSERT account;
       	PageReference pageRef = new PageReference('/'+account.Id);
		return pageRef;            
        }
        return null;
    }
}