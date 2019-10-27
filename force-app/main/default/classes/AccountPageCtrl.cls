public class AccountPageCtrl {
	
    public Account account { get; set; }
    public Boolean showDetailPage { get; set; }
    public Boolean showButton { get; set; }
    
    public AccountPageCtrl(ApexPages.StandardController stdSetCon){
        showButton = TRUE;
    }
    
    public void showDetail(){
        showDetailPage = TRUE;
        showButton = FALSE;
    }
}