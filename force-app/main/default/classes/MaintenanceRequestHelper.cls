public class MaintenanceRequestHelper {//Good. its bulkified
    
    public static void updateWorkOrders(List<Case> newList,List<Case> oldList,Map<Id,Case> newMap,Map<ID,case> oldMap){
        Map<ID,Case> casesToConsider = new Map<ID,Case>();
        List<Case> casesToCreate = new List<Case>();
        for(Case c : newList){
            if((c.Type == 'Repair' || c.Type =='Routine Maintenance') && oldMap.get(c.Id).Status != 'Closed' && c.Status == 'Closed'){
                casesToConsider.put(c.Id,c);
            }
        }
        Map<ID,Date> dueDateMap = findDueDateForEachProduct(casesToConsider.keySet());
        for(Id caseId : casesToConsider.keySet()){
            Case caseToCreate = new Case();
            caseToCreate.Type = 'Routine Maintenance';
            caseToCreate.Subject = 'Created to handle future maintenance.This is created by trigger';
            caseToCreate.Vehicle__c = casesToConsider.get(caseId).Vehicle__c;
            caseToCreate.Equipment__c = casesToConsider.get(caseId).Equipment__c;
            caseToCreate.Date_Reported__c = system.today();
            caseToCreate.Date_Due__c = dueDateMap.get(caseId);
            casesToCreate.add(caseToCreate);
        }
        if(!casesToCreate.isEmpty()){
            INSERT casesToCreate;
        }
    }        
    
   /* public static Date calculateDueDate(ID caseId){
        system.debug(caseId);
        Date dueDate;
       	List<ID> productsToQuery = new List<ID>();
        Product2 productRecord = new Product2();
        for(Work_Part__c wp : [SELECT ID,Equipment__c FROM Work_Part__c WHERE Maintenance_Request__c = :caseId]){
            productsToQuery.add(wp.Equipment__c);
        }
        productRecord = [SELECT ID,Maintenance_Cycle__c FROM Product2 WHERE ID IN :productsToQuery ORDER BY Maintenance_Cycle__c ASC LIMIT 1];
        dueDate =  System.Today() + (Integer) productRecord.Maintenance_Cycle__c;
        return dueDate;
    }*/
    
    public static Map<ID,Date> findDueDateForEachProduct(Set<ID> casesToConsider){
        Map<ID,Date> dueDateMap = new Map<ID,Date>();
		Map<ID,List<ID>> caseWithEquipmentMap = new Map<ID,List<Id>>();
        Set<ID> productsId = new Set<ID>();
        Map<ID,Date> productWithDueDate = new Map<ID,Date>();
        for(Case cs : [SELECT ID,(SELECT ID,Equipment__c FROM work_parts__r) FROM CASE WHERE ID IN : casesToConsider]){
            List<Id> equipmentList = new List<Id>();
            for(Work_part__c wp : cs.work_parts__r){
                equipmentList.add(wp.Equipment__c);
                productsId.add(wp.Equipment__c);
            }
            caseWithEquipmentMap.put(cs.Id,equipmentList);
        }
        system.debug(caseWithEquipmentMap);
        for(Product2 product : [SELECT ID,Maintenance_Cycle__c FROM Product2 WHERE ID IN :productsId]){
            Date dueDate = System.today()+(Integer) product.Maintenance_Cycle__c;
            productWithDueDate.put(product.Id,dueDate);
        }
        for(ID caseId : caseWithEquipmentMap.keySet()){
        	List<ID> productsList = caseWithEquipmentMap.get(caseId);
            List<Date> dueDatesList = new List<Date>();
            Date minDate;
            for(ID productId : productsList){
                dueDatesList.add(productWithDueDate.get(productId));
            }
            system.debug(dueDatesList);
            dueDatesList.sort();
            for(Date d : dueDatesList){
                minDate = d;
                break;
            }
            dueDateMap.put(caseId,minDate);
        }
        return dueDateMap;
    }
}