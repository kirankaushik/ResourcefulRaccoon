public class ContactsTableController {

	public ApexPages.StandardSetController setcon{
		get{
			if(setcon == null){
				setcon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT ID,FirstName,LastName,Account.Name,MailingCountry FROM Contact WHERE AccountId != NULL]));
			}
			return setcon;
		}
		set;
	}

	public List<Contact> getContacts(){
		return (List<COntact>) setcon.getRecords();
	}
}