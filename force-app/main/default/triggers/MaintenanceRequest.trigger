trigger MaintenanceRequest on Case (before update, after update) {
    // call MaintenanceRequestHelper.updateWorkOrders  
    if(trigger.isBefore && trigger.isUpdate){
        MaintenanceRequestHelper.updateWorkOrders(trigger.new,trigger.old,trigger.newMap,trigger.oldMap);
    }
    
}