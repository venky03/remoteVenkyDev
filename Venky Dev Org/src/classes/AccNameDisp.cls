public with sharing class AccNameDisp {
	public List<Account> lstAcc{get;set;}
	public AccNameDisp() {
		lstAcc = [Select Id,Name from Account];
		System.debug('hi'); 
		System.debug('making changes');
	}
}