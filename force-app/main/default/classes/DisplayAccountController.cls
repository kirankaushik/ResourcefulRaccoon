public class DisplayAccountController {

	public Account account;

	public DisplayAccountController(ApexPages.StandardController account){
		this.account = (Account) account.getRecord();
	}

	public string getWelcomeMessage(){
		system.debug(account);
		if(account.Name != NULL){
			return 'Welcome '+account.Name;
		}
		return 'Welcome Please create an account';
	}

	public PageReference save(){
		INSERT account;
		PageReference pageref = new PageReference('/apex/CreateOpptyFromAccountPage');
		pageref.setRedirect(false);//view state is maintained
		pageref.getParameters().put('AcctId',account.Id);
		pageref.getParameters().put('AcctName',account.Name);
		return pageref;
	}
}