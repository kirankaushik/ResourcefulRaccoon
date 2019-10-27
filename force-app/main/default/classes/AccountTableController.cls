public class AccountTableController {

	public List<Account> accounts { get; set; }
	public AccountTableController(ApexPages.standardsetController stdsetcon){
		accounts = (List<Account>) stdsetcon.getRecords();
	}
}