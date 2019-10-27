public class DisplayNameUsingActionFunctionCtrl {

    public String userName { get; set; }
    
    public PageReference getUserName(){
        userName = UserInfo.getUserName();
        return null;
    }
}