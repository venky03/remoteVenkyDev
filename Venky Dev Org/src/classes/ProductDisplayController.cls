public with sharing class ProductDisplayController {
	public class ProductWrapper {
		public String productName;
		public String productCode;
		ProductWrapper() {
			productName = '';
			productCode = '';
		}
	}
	public static String getlstProducts() {
		List<ProductWrapper> lstProductWrappers = new List<ProductWrapper>();
		for(Product2 prod : [Select p.ProductCode, p.Name, p.Id, p.Family, p.Description From Product2 p LIMIT 100]) {
			ProductWrapper pw = new ProductWrapper();
			pw.productName = prod.Name;
			pw.productCode = prod.ProductCode;
			lstProductWrappers.add(pw);
		}
		return JSON.serialize(lstProductWrappers);
	}
}