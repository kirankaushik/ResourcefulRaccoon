@isTest
public class TestDataFactory1{
    
    public static List<Case> insertCaseList(Integer numberOfCases,Boolean positive){
        List<Case> casesToInsert = new List<Case>();
        if(positive){
        	for(Integer i=0;i<numberOfCases;i++){
            Case c = new Case();
            c.Subject = 'Test repair case';
            c.Type = 'Repair';
            c.Origin = 'Email';
            c.Priority = 'High';
            c.Status = 'New';
            c.vehicle__c = insertVehicles(1,FALSE).get(0).Id;
            c.Equipment__c = insertProducts(1,FALSE).get(0).Id;
            casesToInsert.add(c);
        }    
        }
        else{
        	for(Integer i=0;i<numberOfCases;i++){
            
            Case c= new Case();
            c.Subject = 'Test other case';
            c.Type = 'Electronic';
            c.Origin = 'Email';
            c.Priority = 'High';
            c.Status = 'New';
            c.vehicle__c = insertVehicles(1,FALSE).get(0).Id;
            c.Equipment__c = insertProducts(1,FALSE).get(0).Id;
            casesToInsert.add(c);
        }    
        }
        
        //system.debug(casesToInsert);
        INSERT casesToInsert;
        return casesToInsert;
    }
    
    public static List<Vehicle__c> insertVehicles(Integer numberOfVehicles,Boolean insertRec){
        List<Vehicle__c> vehcilesToInsert = new List<Vehicle__c>();
        for(Integer i=0;i<numberOfVehicles;i++){
            Vehicle__c vehicle = new Vehicle__c();
            vehicle.Name = 'Test Vehcile'+i;
            vehicle.Air_Conditioner__c = FALSE;
            vehicle.Bathrooms__c = 1;
            vehicle.Bedrooms__c = 2;
            vehicle.License_Plate__c = 'TN1234';
            vehicle.Type__c = 'Economy';
            vehicle.Make__c = 'Toyota';
            vehicle.Model__c = 'Innova';
            vehcilesToInsert.add(vehicle);
        }
        if(insertRec){
            INSERT vehcilesToInsert;
        }
        return vehcilesToInsert;
    }
    
    public static List<Product2> insertProducts(Integer numberOfProducts,Boolean insertRec){
        List<Product2> products = new List<Product2>();
        for(Integer i=0;i<numberOfProducts;i++){
            Product2 product = new Product2();
            product.Name = 'Test Product'+i;
            product.Description = 'Test Description';
            product.Cost__c = 1000.0;
            product.Current_Inventory__c = 200;
            product.Maintenance_Cycle__c = 100;
            product.Replacement_Part__c = TRUE;
            product.Warehouse_SKU__c = 'A1234';
            products.add(product);
        }
        if(insertRec){
            INSERT products;
        }
        
        return products;
    }
    
    public static List<Work_part__c> insertWorkParts(Integer numberOfWorkParts){
        List<Work_part__c> workPartsList = new List<Work_part__c>();
        List<Product2> products = [SELECT ID FROM Product2];
        List<Case> cases = [SELECT ID FROM Case];
        system.debug(products.size());
        system.debug(cases);
        for(Integer i=0;i<numberOfWorkParts/2;i++){
            Work_part__c wp = new Work_part__c();
            wp.Equipment__c = products .get(0).Id;
            wp.Quantity__c = 2;
            if(cases.size()> 100){
               wp.Maintenance_Request__c = cases.get(300).Id;
            }
            else{
                wp.Maintenance_Request__c = cases.get(0).Id;
            }
            
            workPartsList.add(wp);
        }
        for(Integer i=(numberOfWorkParts/2);i<numberOfWorkParts;i++){
            Work_part__c wp = new Work_part__c();
            wp.Equipment__c = products .get(0).Id;
            wp.Quantity__c = 2;
            if(cases.size()> 100){
               wp.Maintenance_Request__c = cases.get(400).Id;
            }
            else{
                wp.Maintenance_Request__c = cases.get(0).Id;
            }
            workPartsList.add(wp);
        }
        INSERT workPartsList;
        return workPartsList;
    }
    
    public static List<Account> insertAccounts(Integer numberOfAccounts){
        List<Account> lstAccounts = new List<Account>();
        for(Integer i=1;i<=numberOfAccounts;i++){
            Account acct = new Account();
            acct.Name = 'Test Account '+i;
            acct.Rating = 'Hot';
            acct.Industry = 'Agriculture';
            acct.NumberOfEmployees = 100;
            lstAccounts.add(acct);
        }
        INSERT lstAccounts;
        return lstAccounts;
    }
}