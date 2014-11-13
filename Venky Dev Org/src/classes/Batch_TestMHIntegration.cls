global class Batch_TestMHIntegration implements Database.Batchable<sObject>,Database.AllowsCallouts
{
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query = 'SELECT Id,Name FROM Account LIMIT 1';
        return Database.getQueryLocator(query);
    }
  
    global void execute(Database.BatchableContext BC, List<Account> scope)
    {
        SampleHTTPRequestCls a = new SampleHTTPRequestCls();
		a.postDataToRemote();
    }  
    global void finish(Database.BatchableContext BC)
    {
    }
}