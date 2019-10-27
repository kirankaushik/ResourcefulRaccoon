public class WarehouseSyncSchedule implements Schedulable{
  // implement scheduled code here
  
    public static void execute(SchedulableContext sc){
        WarehouseCalloutService.runWarehouseEquipmentSync();
    }
}