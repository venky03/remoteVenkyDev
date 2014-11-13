trigger Opp_stages on Opportunity (before update) {
	List<Opportunity> oppList=new List<Opportunity>();
	for(Opportunity opp:Trigger.new) {
		if(Trigger.oldMap.get(opp.Id).StageName!='Closed Won') {
			
	
			if(opp.StageName=='Closed Won') {
				Opportunity newOpp2 = opp.clone(false, true);
				newOpp2.CloseDate=opp.CloseDate.addYears(1);
				newOpp2.Name='Renewed'+opp.Name;
				oppList.add(newOpp2);
				System.debug('*************Trigger on Opportunity to clone when closed won**********');
			}
			
		}
	}
	insert oppList;
}