public class CreateOpptyFromAccountPageController {

	public Id accountId;
	public Opportunity oppty;
	public String accountName { get; set; }

	public CreateOpptyFromAccountPageController(ApexPages.StandardController stdcon){
		accountId = ApexPages.Currentpage().getParameters().get('AcctId');
		accountName = ApexPages.currentpage().getParameters().get('AcctName');
		oppty = (Opportunity) stdcon.getRecord();
		system.debug(accountId);
	}

	public PageReference save(){
		system.debug(oppty);
		system.debug(accountId);
		oppty.accountId = accountId;
		INSERT oppty;
		system.debug(oppty);
		PageReference pageRef = new PageReference('/'+oppty.Id);
		pageRef.setRedirect(true);//view state will be flushed
		return pageRef;
	}

	public PageReference cancel(){
		PageReference pageRef = new PageReference('/apex/DisplayAccountUsingControllerExtension?id='+accountId);//check how to hide save button during this redirect
		return pageRef;
	}
}