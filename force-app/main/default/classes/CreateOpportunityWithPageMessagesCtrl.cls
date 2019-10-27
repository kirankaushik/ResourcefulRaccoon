public class CreateOpportunityWithPageMessagesCtrl {
    public Opportunity opportunity { get; set; }
    public Boolean hasError;
    
    public CreateOpportunityWithPageMessagesCtrl(ApexPages.StandardController stdCon){
    	this.opportunity = (Opportunity)stdCon.getRecord();    
    }
    
    public PageReference save(){
        hasError = FALSE;
        if(Opportunity.Name.contains('test')){
            hasError = TRUE;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Please enter valid oppty name'));
        }
        if(Opportunity.CloseDate < System.today()){
            hasError = TRUE;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Please enter date in future'));
        }
        if(Opportunity.Amount < 0){
            hasError = TRUE;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Please enter amount greater than zero'));
        }
        if(!hasError){
            INSERT opportunity;
            PageReference pageRef = new PageReference('/'+opportunity.Id);
            return pageRef;
        }
        return null;
    }
}