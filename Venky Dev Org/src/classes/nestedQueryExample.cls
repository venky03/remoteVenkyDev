public class nestedQueryExample
{
  public List<Account> getaccsandtmember()
  {
      List<Account> accounts = [Select Id,(Select Id,Name from Opportunities), Name, BillingCountry from Account];
      return accounts;
  }
}