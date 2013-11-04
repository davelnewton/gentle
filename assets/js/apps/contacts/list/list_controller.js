ContactManager.module('ContactsApp.List', function(List, ContactManager, Backbone, Marionette, $, _) {
  return List.Controller = {
    listContacts: function() {
      var deferredContacts;
      console.log('DBG Entering List.Controller#listContacts...');
      deferredContacts = ContactManager.request('contact:entities');
      return $.when(deferredContacts).done(function(contacts) {
        var contactsListView;
        contactsListView = new List.Contacts({
          collection: contacts
        });
        contactsListView.on('itemview:contact:delete', function(childView, model) {
          console.log('DBG Entering List.Controller itemview:contact:delete handler...');
          return model.destroy();
        });
        contactsListView.on('itemview:contact:show', function(childView, model) {
          console.log("DBG Entering List.Controller itemview:contact:show handler, model ID=" + (model.get('id')));
          return ContactManager.trigger('contact:show', model.get('id'));
        });
        return ContactManager.mainRegion.show(contactsListView);
      });
    }
  };
});
