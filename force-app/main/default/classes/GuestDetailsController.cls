public class GuestDetailsController {

    public Boolean showMessage;
    public String nameInfo;
    public Integer ageInfo;
    public String favCricketerInfo;
    public String favColourInfo;
    
    public Boolean getshowMessage(){
        return showMessage;
    }
    
    public PageReference save(){
        showMessage = TRUE;
        return NULL;
    }
    
    public String getNameInfo(){
        return nameInfo;
    }
    
    public void setNameInfo(String name){
        nameInfo = name;
    }
    
    public Integer getageInfo(){
        return ageInfo;
    }
    
    public void setageInfo(Integer age){
        ageInfo = age;
    }
    
    public String getfavCricketerInfo(){
        return favCricketerInfo;
    }
    
    public void setfavCricketerInfo(String cricketer){
        favCricketerInfo = cricketer;
    }
    
    public String getfavColourInfo(){
        return favColourInfo;
    }
    
    public void setfavColourInfo(String colour){
        favColourInfo = colour;
    }
}