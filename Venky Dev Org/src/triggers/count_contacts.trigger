trigger count_contacts on Contact (after insert,after delete,after update) {
List<SObject> a = [select AccountId Id, count(Id) c from Contact group by AccountId ];
List<Account> account_list=new List<Account>();
for(SObject x: a)
{
    Account acc=new Account();
    acc.Id=String.valueOf(x.get('Id'));
    acc.Number_of_Contacts__c=Integer.valueOf(x.get('c'));
    account_list.add(acc);
}
update account_list;
}