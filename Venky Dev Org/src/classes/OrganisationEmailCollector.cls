public class OrganisationEmailCollector {

    public List<OrgWideEmailAddress> orgmails {get;set;}
    public List<SelectOption> items {get;set;}
    public OrgWideEmailAddress fromaddressObj {get;set;}
    public List<String> toAddress {get;set;}
    public String fromAddr {get;set;}
    public OrgWideEmailAddress frm {get;set;}
    
    public String replyTo {get;set;}
    public String dispnames {get;set;}
    
        public OrganisationEmailCollector (){
        
       
        toAddress = new List<String>();
        fromaddressObj = new OrgWideEmailAddress();
        
        orgmails = new List<OrgWideEmailAddress>();
        frm = new OrgWideEmailAddress ();
        items = new List<SelectOption>();
        toAddress.add('annamalaisenthil92@gmail.com');
       
        orgmails = [select id, Address, DisplayName from OrgWideEmailAddress where IsAllowAllProfiles = true];
        for(OrgWideEmailAddress org: orgmails)
            {
            String name_address = org.DisplayName+' '+'<'+org.Address+'>';
                items.add(new SelectOption(org.id,name_address));
               
            }
            System.debug('***'+items);
            
        }    
        public void send()
        {
            System.debug('here');
            
            frm.id = (Id)fromAddr;
            fromaddressObj = [select id, DisplayName, Address from OrgWideEmailAddress where id =: frm.id];
           
                replyTo = (String)fromaddressObj.Address;
            
                dispnames = (String)fromaddressObj.DisplayName;
            
            System.debug('@@@'+fromAddr);
            System.debug('@@@'+replyTo);
            System.debug('@@@'+dispnames);
            System.debug('@@@'+frm);
            
            Contact whatIds = new Contact();
            //whatIds = [Select id from Contact where Name = 'Annu Test'];
            
            List<Id> targets = new List<Id>();
                
                //targets.add(whatIds.id);
                //whatIds = [Select id from Contact where Name = 'A Test'];
                //targets.add(whatIds.id);
                
                whatIds = [Select id from Contact where Name = 'Venki Test'];
                targets.add(whatIds.id);
                whatIds = [Select id from Contact where Name = 'Venkat Test'];
                targets.add(whatIds.id);
            String templateIdStr = '00X90000001Uuf2';
            Id templateId = (Id) templateIdStr;
            
            
        /*    Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setOrgWideEmailAddressId(fromaddressObj.id);
            email.setToAddresses(toAddress);
            email.setSubject('Sending email..');
            email.setPlainTextBody('You have just changed your SalesForce contact email from If this was not intentional please log back into Salesforce.com and ammend you details.');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
          */  
            Messaging.MassEmailMessage email = new Messaging.MassEmailMessage();
            email.setReplyTo(fromaddressObj.Address);
            email.setSaveAsActivity(false);
            email.setSenderDisplayName(fromaddressObj.DisplayName);
            email.setTargetObjectIds(targets);
            email.setTemplateId(templateId);
            Messaging.sendEmail(new Messaging.MassEmailMessage[] { email });
             
              }
           
    }