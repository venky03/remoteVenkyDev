public with sharing class PortalLoginController {
	public Account acc{get;set;}
	public PortalLoginController() {
		acc = new Account();
	}
	public void saveRec() {
		acc.Name = acc.UserName__c;
		insert acc;
	}
	public void reset() {
		acc.UserName__c = '';
		acc.Password__c = '';
		update acc;
	}
	public Pagereference login() {
		
		return null;
	}
}