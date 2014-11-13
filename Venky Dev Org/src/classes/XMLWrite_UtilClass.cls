public with sharing class XMLWrite_UtilClass {
	Xmlstreamwriter xmlW = new Xmlstreamwriter();
	public void createNode(String name,String value) {
		xmlW.writeStartElement(null,name,null);
		xmlW.writeCharacters(value);
		xmlW.writeEndElement();
	}
	public void createStartNode(String name) {
		xmlW.writeStartElement(null,name,null);
	}
	public void createEndNode() {
		xmlW.writeEndElement();
	}
	public void createChild(String name) {
		
	}
}