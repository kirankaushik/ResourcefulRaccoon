public class testaccttablectrl {

	public List<Account> accounts { get; set; }

	public testaccttablectrl(ApexPages.StandardSetController stdsetcon){
		system.debug(stdsetcon.getResultSize());
		system.debug(stdsetcon.getpageSize());
        accounts = (List<Account>) stdsetcon.getRecords();
		//system.debug(stdsetcon.getRecords());//will give all opptys
		//accounts = [SELECT ID,Name,Account.Name,StageName,CloseDate FROM Opportunity WHERE AccountID != NULL];

	}


}