public class TableTemplateController {

    public List<Account> accounts { get; set; }
    
    public TableTemplateController(ApexPages.StandardSetController stdSetCon){
        accounts = (List<Account>) stdSetCon.getRecords();
    }
}