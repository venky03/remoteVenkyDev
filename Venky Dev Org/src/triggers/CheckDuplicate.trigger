trigger CheckDuplicate on Lead (before insert, before update) {

Map<String, Lead> leadMap = new Map<String, Lead>();
    for (Lead lead : Trigger.new) 
    {
        if ((lead.Email != null) &&(Trigger.isInsert ||(lead.Email != Trigger.oldMap.get(lead.Id).Email))) 
                {
                if (leadMap.containsKey(lead.Email))
                    {
                    lead.Email.addError('Some of  new lead has the same email address.');
                    }
                else
                    {
                    leadMap.put(lead.Email, lead);
                    }
               }
    }
    
    for (Lead lead : [SELECT Email FROM Lead WHERE Email IN :leadMap.KeySet()]) {
        Lead newLead = leadMap.get(lead.Email);
        newLead.Email.addError('Email Already Exists Try New Email!!');
    }
  
}