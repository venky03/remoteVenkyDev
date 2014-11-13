public with sharing class ListButtonController 
{
    private ApexPages.StandardSetController standardSetController;

    public ListButtonController(ApexPages.StandardSetController standardSetController) 
    { 
        this.standardSetController = standardSetController;
    }

    public PageReference doSomething()
    {
        // Apex code for handling records from a List View goes here
        List<Account> listViewRecords = 
            (List<Account>) standardSetController.getRecords();
        List<Account> selectedListViewRecords = 
            (List<Account>) standardSetController.getSelected();
        Boolean hasMore = standardSetController.getHasNext();
        return null;
    }
}