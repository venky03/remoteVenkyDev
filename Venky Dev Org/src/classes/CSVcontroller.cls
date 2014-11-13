public class CSVcontroller{
    public ID DocId {get; set;}

    public CSVcontroller(){
    }

    public void autoRun(){
        PageReference csvPage = Page.MyCSVPageName;   
        Blob csvBlob = csvPage.getContent(); 

        /* create & insert a document in Salesforce.com */
        /* if you don't want the file to be stored forever in Documents, you can write code to delete the file after your user is finished with it */
        Document tDoc = new Document();
        tDoc.Name = 'MyCSVFileName';
        tDoc.Type = 'csv';
        tDoc.body = csvBlob;
        tDoc.FolderId = '00l90000000fk2G';  /* id of whatever Salesforce document folder you want to use*/
        insert tDoc;

        /*after this, you can use the ID from your newly inserted document as a URL parameter for the download link*/
        DocId = tDoc.id;  
    
    }

}