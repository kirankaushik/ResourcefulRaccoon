public class CalculatorActionsController {

    public Integer number1 { get; set; }
    public Integer number2 { get; set; }
    public Integer result { get; set; }
    public String selectedOperation { get; set; }
    
    public List<SelectOption> getOptions(){
        List<SelectOption> lstOptions = new List<SelectOption>();
        lstOptions.add(new SelectOption('add','ADD'));
        lstOptions.add(new SelectOPtion('sub','SUB'));
        return lstOptions;
    }
    
    public PageReference PerformCalc(){
        if(selectedOperation == 'add'){
            result = number1+number2;
        }
        else if(selectedOperation == 'sub'){
            result = number1-number2;
        }
        return null;
    }
}