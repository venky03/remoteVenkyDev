Public class SendEmail
{
    public String subject {get; set;}
    public String body {get; set;}
 
    private opportunity opp;
   
    // Constructor to populate instance of your object
    public SendEmail(ApexPages.StandardController controller) {
    this.opp= (opportunity )controller.getRecord();
    //opp= [SELECT opp fields required FROM opportunity WHERE id = :ApexPages.CurrentPage().getParameters().get('id')];
    }
             
    public Opportunity getOpportunity(){
    return opp;
    }
   
   
    public pageReference send(){
    Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();  
     
    email.setSubject(subject);
    //email.setToAddresses(address);//Use SOQL to retrieve addresses in the address
    email.setPlainTextBody(body);
    email.setBccSender(true);
   
    Messaging.SendEmailResult [] r = Messaging.SendEmail(new Messaging.SingleEmailMessage[] {email});     
    for ( Messaging.sendEmailResult result : r ) {

           if ( !r[0].isSuccess () ) {
              
               System.debug ( result  );
           }

           else{

               ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.INFO, 'Email Sent Successfully' );
               ApexPages.addMessage(msg);
           }
       }
    return null;  
}
}