public class CalculatorWithActionSupportCtrl {

    public Integer value1 { get; set; }
    public Integer value2 { get; set; }
    public String selectedOperation { get; set; }
    public Integer result { get; set; }
    
    public List<SelectOption> getpossibleOperations(){
        List<SelectOption> lstSelectOption = new List<SelectOption>();
        lstSelectOption.add(new SelectOption('add','Add'));
        lstSelectOption.add(new SelectOption('sub','Subtract'));
        lstSelectOption.add(new SelectOption('mul','Multiply'));
        lstSelectOption.add(new SelectOption('div','Divide'));
        return lstSelectOption;
    }
    
    public void getcalculateNewResult(){
        if(selectedOperation == 'add'){
            result = value1+value2;
        }
        else if(selectedOperation == 'sub'){
            result = value1-value2;
        }
        else if(selectedOperation == 'mul'){
            result = value1*value2;
        }
        else if(selectedOperation == 'div'){
            result = value1/value2;
        }
   }
}