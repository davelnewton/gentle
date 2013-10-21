(function() {
  ContactManager.module('ContactsApp.List', function(List, ContactManager, Backbone, Marionette, $, _) {
    return List.Controller = {
      listContacts: function() {
        var contacts, contactsListView;
        console.log('DBG Entering List.Controller#listContacts...');
        contacts = ContactManager.request('contact:entities');
        contactsListView = new List.Contacts({
          collection: contacts
        });
        contactsListView.on('itemview:contact:delete', function(childView, model) {
          return contacts.remove(model);
        });
        contactsListView.on('itemview:contact:show', function(childView, model) {
          return ContactManager.ContactsApp.Show.Controller.showContact(model);
        });
        return ContactManager.mainRegion.show(contactsListView);
      }
    };
  });

}).call(this);
