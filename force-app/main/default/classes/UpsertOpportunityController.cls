public class UpsertOpportunityController {

	public Opportunity oppty { get; set; }

	public UpsertOpportunityController(){
		Id opptyId = ApexPages.currentpage().getParameters().get('Id');
		oppty = (opptyId == NULL) ? new Opportunity() : [SELECT Id,Name,CloseDate,AccountId,Amount,StageName FROM Opportunity WHERE Id = : opptyId];
	}

	public pageReference save(){
		upsert oppty;
		PageReference pageRef = new PageReference('/'+oppty.Id);
		return pageRef;
	}

	public pageReference cancel(){
		PageReference pageRef = new PageReference('/apex/UpsertOpportunityPage');
		return pageRef;
	}
}