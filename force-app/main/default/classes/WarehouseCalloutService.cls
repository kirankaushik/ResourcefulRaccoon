public with sharing class WarehouseCalloutService{

    private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
    
    // complete this method to make the callout (using @future) to the
    // REST endpoint and update equipment on hand.
    @future(callout=true)
    public static void runWarehouseEquipmentSync(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint(WAREHOUSE_URL);
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
        if(response.getStatusCode() == 200){
            system.debug(response.getBody());
            List<Object> bodyList = (List<Object>) JSON.deserializeUntyped(response.getBody());
            List<Product2> productsToUpsert = new List<Product2>();
            for(Object singleRecord : bodyList){
                Map<String,Object> recordMap = (Map<String,Object>) singleRecord;
                system.debug(recordMap);
                Product2 product = new Product2();
                product.Name = (String) recordMap.get('name');
                product.Replacement_Part__c = true;
                product.Cost__c = (Decimal) recordMap.get('cost');
                product.Current_Inventory__c = (Decimal) recordMap.get('quantity');
                product.Lifespan_Months__c = (Integer) recordMap.get('lifespan');
                product.Maintenance_Cycle__c = (Integer) recordMap.get('maintenanceperiod');
                product.Warehouse_SKU__c = (String) recordMap.get('sku');
                productsToUpsert.add(product);
            }
            system.debug(productsToUpsert.size());
            UPSERT productsToUpsert Warehouse_SKU__c;
        }
    }

}