public with sharing class DetailButtonController 
{
    private ApexPages.StandardController standardController;

    public DetailButtonController(ApexPages.StandardController standardController) 
    { 
        this.standardController = standardController;
    }

    public PageReference doSomething()
    {
        // Apex code for handling record from a Detail page goes here
        Id recordId = standardController.getId();
        Account record = (Account) standardController.getRecord(); 
        return null;
    }   
}