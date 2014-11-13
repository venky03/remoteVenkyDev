public with sharing class SampleHTTPRequestCls {
	String endPoint = 'http://cert3-svcs.martindale.com/MHIntegration/Inventory?cache=true';
	public void postDataToRemote(){
   		performAction('POST');   
	}
	public void performAction(String method){
		HttpRequest req = new HttpRequest();
        req.setEndpoint(endPoint);
        req.setMethod(method);
        req.setTimeout(1000);
        req.setBody('<PendInventoryRequest xmlns="http://svcs.martindale.com/MHIntegration/PendInventoryRequest/v1.00"><RequestId>0f8fad5b-d9cb-469f-a165-70867728950e</RequestId><UserName>SFDC user login</UserName><ProductCode>01920</ProductCode><ProductName>Preferred City Results</ProductName><ServiceAccountName>Belote, LLP</ServiceAccountName><CustomerNumber>005004163800</CustomerNumber><AOP>Criminal Law</AOP><ProductDeliveryAddress><City>New York</City><County></County><State>NY</State> <Country>USA</Country></ProductDeliveryAddress></PendInventoryRequest>');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug(res.getBodyDocument());
        XMLWrite_Try x= new XMLWrite_Try();
        x.parseXML(res.getBodyDocument());
        
	}
}