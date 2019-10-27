@isTest
public class CalculatorActionsControllerTest {

    @isTest
    static void testCalculatorActions(){
        CalculatorActionsController objCalculatorActionsController = new CalculatorActionsController();
        objCalculatorActionsController.getOptions();
        objCalculatorActionsController.number1 = 10;
        objCalculatorActionsController.number2 = 20;
        objCalculatorActionsController.selectedOperation = 'add';
        objCalculatorActionsController.PerformCalc();
        system.assertEquals(objCalculatorActionsController.result,30);
    }
}