trigger AccountCaseValTrigger on Account (before insert,before update) {
    List<Id>caseVal=new List<Id>();
     Map<Id,List<Contact>>AccNContact=new Map<Id,List<Contact>>();
      List<Contact>contactList=new List<Contact>();  
    for(Account acc:Trigger.new){
        if(acc.CaseValue__c=='A'){
         	caseVal.add(acc.Id);   
        }
    
    }
    for(Account acc:[select Id,CaseValue__c,(select Id from Contacts) from Account where Id in :caseVal]){
		
    }
}