@isTest
public  class DailyLeadProcessorTest {

private static String CRON_EXP ='0 0 0 ? * * *';

    @isTest
    private static void testShedulableClass(){
    List<Lead> leads =  new List<Lead>();

    for (Integer i=0;i<500;i++) {
        if(i<250){
            leads.add(new Lead(LastName='Osoprilko', Company='BSTU'));
        }
        else{
            leads.add(new Lead(LastName='Osoprilko', Company='BSTU', LeadSource='Other'));
        }
    }

    insert leads;

    Test.startTest();
    String jobId = System.schedule('Process Leads', CRON_EXP, new DailyLeadProcessor());
    Test.stopTest();

    List<Lead> updateLeads=[SELECT Id, LeadSource FROM Lead WHERE LeadSource ='DreamForce'];
    System.assertEquals(200, updateLeads.size(), 'Error: At least 1 record not updated correctly');

    List<CronTrigger> cts = [SELECT Id, TimesTriggered, NextFireTime FROM CronTrigger WHERE Id = :jobId];
    System.debug('Next fire time' + cts[0].NextFireTime);
    }
}

