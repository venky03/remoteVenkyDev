public class myControllerExtension {
	public Merchandise1__c m1{get;set;}   
	public String id1;
    public myControllerExtension(ApexPages.StandardController stdController) {
        id1=ApexPages.currentPage().getParameters().get('id');
        for(Merchandise1__c m:[Select m.ZipCode__c, m.Total_Inventory__c, m.SystemModstamp, m.Street__c, m.State__c, m.Price__c, m.OwnerId, m.Name, m.LastViewedDate, m.LastReferencedDate, m.LastModifiedDate, m.LastModifiedById, m.LastActivityDate, m.IsDeleted, m.Id, m.Description__c, m.CreatedDate, m.CreatedById, m.Country__c, m.City__c From Merchandise1__c m where m.Id =: id1]) {
        	/*m1.City__c = m.City__c;
        	m1.ZipCode__c = m.ZipCode__c;
        	m1.Country__c = m.Country__c;
        	m1.State__c = m.State__c;
        	m1.Street__c = m.Street__c;*/
        }
    }
	public PageReference save() {
			m1.Addr__c = m1.City__c +  m1.Street__c + m1.Country__c;
			upsert m1;
			return null;
	}
    
}