trigger AccountTrigger on Account (before insert) {

    if(trigger.isBefore && trigger.isInsert){
        AccountHandler.fillDesc(trigger.new);
    }
}