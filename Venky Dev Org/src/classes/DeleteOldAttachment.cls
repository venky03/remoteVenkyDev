public with sharing class DeleteOldAttachment {
	public static void deleteMethod(Attachment[] attlist) {
		Database.delete(attlist);
	}
}