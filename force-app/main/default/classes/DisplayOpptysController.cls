public class DisplayOpptysController {

	public List<Opportunity> opportunities { get; set; }

	public DisplayOpptysController(ApexPages.StandardSetController stdsetcon){
		system.debug(stdsetcon.getResultSize());
		system.debug(stdsetcon.getpageSize());
		//system.debug(stdsetcon.getRecords());//will give all opptys
		opportunities = [SELECT ID,Name,Account.Name,StageName,CloseDate FROM Opportunity WHERE AccountID != NULL];

	}


}