trigger quote_total on Quote (before delete, before insert, after update) {
    Map<Id,List<Quote>> Opp_Quote=new Map<Id,List<Quote>>();
    List<Quote> qList=new List<Quote>();
    List<Opportunity> oList=new List<Opportunity>();
    List<Quote> tmpList=new List<Quote>();
    //Getting Quote List from trigger.new
    for(Quote qObj:trigger.new) {
        qList.add(qObj);
    
    } 
    //getting all opportunities for quotes obtained
    for(Opportunity opp:[select AccountId from Opportunity where SyncedQuoteId in :qList])  {
        oList.add(opp);
    }
    for(Quote q:qList) {
        if(Opp_Quote.containsKey(q.Id)) {
            System.debug('*********************'+q.Id);
            //tmpList.add(q.Id);
            //Opp_Quote.put(
        }
   
    }
    
    
}