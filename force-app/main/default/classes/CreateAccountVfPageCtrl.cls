public class CreateAccountVfPageCtrl {

    public Boolean showMessage {get; set;} 
    public Account account;
    
    public CreateAccountVfPageCtrl(ApexPages.StandardController stdCon){
        this.account = (Account) stdCon.getRecord();
    }
    
    public PageReference save(){
        system.debug(account);
        INSERT account;
        showMessage = TRUE;
        return NULL;
    }
}