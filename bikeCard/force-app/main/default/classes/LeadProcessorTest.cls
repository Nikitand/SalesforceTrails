@isTest
private class LeadProcessorTest {
 @isTest
 private static void testBatchClass(){
     List<Lead> leads = new List<Lead>();
     for (Integer i=0; i<200; i++){
         leads.add(new Lead(LastName='Osoprilko', Company='BSTU'));
     }
     insert leads;

     Test.startTest();
     LeadProcessor lp =  new LeadProcessor();
     Id batchId =  Database.executeBatch(lp,200);
     Test.stopTest();

     List<Lead> updatedLeads =  [SELECT Id FROM Lead WHERE LeadSource ='DreamForce'];
     System.assertEquals(200, updatedLeads.size(), 'Error'); 
 }
}
