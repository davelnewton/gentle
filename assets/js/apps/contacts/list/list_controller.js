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
          console.log('DBG Entering List.Controller itemview:contact:delete handler...');
          return contacts.remove(model);
        });
        contactsListView.on('itemview:contact:show', function(childView, model) {
          console.log('DBG Entering List.Controller itemview:contact:show handler...');
          return ContactManager.trigger('contact:show', model.get('id'));
        });
        return ContactManager.mainRegion.show(contactsListView);
      }
    };
  });

}).call(this);
