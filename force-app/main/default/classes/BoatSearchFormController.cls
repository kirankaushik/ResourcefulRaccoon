public class BoatSearchFormController {

    @AuraEnabled
    public static List<BoatType__c> loadBoatTypes(){
        List<BoatType__c> boatTypes = new List<BoatType__c>();
        for(BoatType__c bt : [SELECT ID,Name FROM BoatType__c]){
            boatTypes.add(bt);
        }
        return boatTypes;
    }
}