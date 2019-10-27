({
    doInit : function(component, event, helper){
        console.log('Inside init of boat search form');
        component.set("v.showNewButton",$A.get("e.force:createRecord"));
        var action = component.get("c.loadBoatTypes");
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var boatTypes = response.getReturnValue();
                component.set("v.boatTypes",boatTypes);
            }
            else{
                console.log('Error while retrieving boat types '+state);
            }
        });
        $A.enqueueAction(action);
    },
    
    handleNew : function(component, event, helper){
        var selectedBoatType = component.get("v.selectedBoatType");
        console.log(selectedBoatType);
        var createRecordEvent = $A.get("e.force:createRecord");
        	createRecordEvent.setParams({
            	"entityApiName": "Boat__c",
            });
        	if(!selectedBoatType == ''){
                createRecordEvent.setParams({
                  	"defaultFieldValues" : {
                    'BoatType__c' : selectedBoatType
                }
        	});
            }
        	createRecordEvent.fire();
    },
    
    onFormSubmit : function(component,event,helper){
        var eventRef = component.getEvent("formsubmit");
        eventRef.setParams({
            "formData": {"boatTypeId" : boatTypeId}
        });
        eventRef.fire();
    }
})