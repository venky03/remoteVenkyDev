global class DeveloperExtension2 { 
    public DeveloperExtension2(ApexPages.StandardController controller){}
    @RemoteAction
    global static List<Contact> showContacts(String accName){
        accName = '%'+ accName+'%';
        List<Contact> lst_contacts = new List<Contact>([select id, name, email, Account.Name from contact where Account.Name LIKE : accName  ]);
        List<Contact> lst_Contact = new List<Contact>();
        for(Contact c : lst_contacts){
            c.Email= 'RemoteTestContact@sdf.com';
            lst_Contact.add(c);
        }
        system.debug('###### ' + JSON.serialize(lst_Contact));
        return lst_Contact ;
    }
}