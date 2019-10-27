public class DisplayInfoController {

    public String objectNameInCaps;
    
    public String getobjectNameInCaps(){
        return objectNameInCaps;
    }
    
    public void setobjectNameInCaps(String objectName){
        objectNameInCaps = objectName.toUpperCase();
    }
}