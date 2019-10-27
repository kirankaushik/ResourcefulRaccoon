public class AccountHandler {

    public static void fillDesc(List<Account> lstAccounts){
        for(Account acct : lstAccounts){
            acct.Description = acct.Description+' Updated by trigger';
        }
    }
}