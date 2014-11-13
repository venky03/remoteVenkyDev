public with sharing class XMLWrite_Try {
	public String xmlStringxmlRes{get;set;}
	public String inventoryID{get;set;}
	public Pagereference getxmlRes() {
 
	Xmlstreamwriter xmlW = new Xmlstreamwriter();
		xmlW.writeStartElement(null,'PendInventoryRequest', null); 
			xmlW.writeAttribute(null,null,'xmlns','http://svcs.martindale.com/MHIntegration/PendInventoryRequest/v1.00');
			xmlW.writeStartElement(null,'CLIENT',null);
				xmlW.writeAttribute(null,null,'email','xx.xx@xx.xx');
				xmlW.writeStartElement(null,'BASIC_FIELDS',null);
					xmlW.writeAttribute(null,null,'id','1');

					xmlW.writeStartElement(null,'ADRESS_LINE_1',null);
					xmlW.writeAttribute(null,null,'id','2');
						xmlW.writeCharacters('4 rue de rocher');
					xmlW.writeEndElement(); //Close ADRESS_LINE_1

					xmlW.writeStartElement(null,'CITY',null);
						xmlW.writeAttribute(null,null,'id','3');
						xmlW.writeCharacters('Paris');
					xmlW.writeEndElement(); //Close CITY

				xmlW.writeEndElement(); //Close BASIC_FIELDS
			xmlW.writeEndElement(); //Close CLIENT
		xmlW.writeEndElement(); //Close SERVICE
	xmlW.writeEndDocument(); //Close XML document

	xmlStringxmlRes = xmlW.getXmlString();
	System.debug('The XML :'+xmlW.getXmlString());     
	xmlW.close();
	return null;
}
	public void parseXML(Dom.Document resp) {
		Dom.XMLNode address = resp.getRootElement();
		String code = address.getChildElement('HttpResponseCode', null).getText();
		System.debug('code received is :'+code);
		if(code == '200') {
			String invId = address.getChildElement('InventoryId',null).getText();
			System.debug('inventoryId is :'+invId);
			inventoryID = invId;
		}
	}
	public Pagereference parseResponse(String resp) {
		inventoryID='';
		Dom.Document response = new Dom.Document();
		response.load(resp);
		dom.Xmlnode res = response.getRootElement();
		dom.Xmlnode res1 = res.getChildElement('Messages',null).getChildElement('Message',null).getChildElement('Text',null);
		System.debug('res is'+res+'res1 is :'+res1);
		String uniqueId = res1.getText();
		System.debug('response text:'+uniqueId);
		inventoryID = uniqueId;
		return null;
	}
	public void parse() {
		parseResponse('<PendInventoryResponse xmlns:xsi="http://www.martindale.com/mhintegration/data-model-instance" xmlns:xsd="http://www.martindale.com/mhintegration/data-model"><RequestId>a0VL00000035qGdMAI-4/2/2014 5:00 AM</RequestId><HttpResponseCode>200</HttpResponseCode><Messages><Message><Code>200</Code><Text>Customer already has an Inactive order for this AOP/GEO Combination. Do you wish to activate it?</Text></Message></Messages><IsInventoryAvailable>false</IsInventoryAvailable><InventoryId /></PendInventoryResponse>');
	}
}