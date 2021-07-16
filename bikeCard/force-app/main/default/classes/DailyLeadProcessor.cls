public  class DailyLeadProcessor implements Schedulable{ 
    public void Execute(SchedulableContext ctx){
        List<Lead> leads = [SELECT Id, LeadSource  FROM Lead WHERE LeadSource = null LIMIT 200 ];
        for( Lead l: leads){
            l.LeadSource = 'Dreamforce';
        }
        update leads;
    } 
}
