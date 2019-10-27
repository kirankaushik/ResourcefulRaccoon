@isTest
public class WarehouseSyncScheduleTest {

    @isTest
    static void testSchedule(){
        String CRON_EXP = '00 00 01 5 * ? 2020';
        Test.startTest();
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new WarehouseSyncSchedule());  
        Test.stopTest();
    }
}