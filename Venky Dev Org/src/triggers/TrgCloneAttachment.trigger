trigger TrgCloneAttachment on Attachment (after insert) {
	public List<Attachment> attList = new List<Attachment>();
	public List<Attachment> attOldList = new List<Attachment>();
	public Map<Id,Id>mapAttachmentNQuote = new Map<Id,Id>();
	public Map<Id,Id>mapQuoteNOpp = new Map<Id,Id>();
	for(Attachment att : Trigger.new) {
		if(att.parentId.getsObjectType()==Quote.getsObjectType()) {
			attOldList.add(att);
			mapAttachmentNQuote.put(att.Id,att.ParentId);
		}
	}
	for(Quote q:[Select Id,OpportunityId  From Quote q where q.Id in : mapAttachmentNQuote.values()]) {
		mapQuoteNOpp.put(q.Id,q.OpportunityId);
	}
	for(Attachment a : attOldList) {
		if(mapQuoteNOpp.containsKey(mapAttachmentNQuote.get(a.Id))){
		Attachment attClone = new Attachment();
		attClone = a.clone(false,true);
			attClone.ParentId = mapQuoteNOpp.get(mapAttachmentNQuote.get(a.Id));
		attList.add(attClone);
	
		}
	}
	System.debug('Old Attachemnt list'+attOldList);
	System.debug('New Attachment List'+attList);
	if(attList.size() >0) {
		Database.insert(attList);
	}
}