public class WarehouseCalloutServiceMock implements HttpCalloutMock{
    // implement http mock callout
    
    public static HttpResponse respond(HttpRequest request){
        HttpResponse res = new HttpResponse();
        res.setStatusCode(200);
        res.setBody('[{"id":"55d66226726b611100aaf741","replacement":false,"name":"enerator 1000 kW","maintenanceperiod":365,"lifespan":120,"cost":5000,"sku":"100003"},{"id":"55d66226726b611100aaf741","replacement":false,"name":"enerator 1000 kW","maintenanceperiod":365,"lifespan":120,"cost":5000,"sku":"100004"}]');
        return res;
    }
}