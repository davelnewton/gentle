(function() {
  ContactManager.module('ContactsApp.Show', function(Show, ContactManager, Backbone, Marionette, $, _) {
    return Show.Controller = {
      events: {
        'click a.js-back-to-contacts': 'backToContacts'
      },
      showContact: function(id) {
        var deferredContact;
        console.log("DBG Entering Show.Controller#showContact(" + id + ")...");
        deferredContact = ContactManager.request('contact:entity', id);
        return $.when(deferredContact).done(function(contact) {
          var contactView;
          console.log("    showContact fetch complete. Processing...", contact);
          contactView = contact ? (console.log("DBG   ... fetched contact", contact), new Show.Contact({
            model: contact
          })) : (console.log("DBG   ... did not fetch contact"), new Show.missingContact());
          console.log(contactView);
          return ContactManager.mainRegion.show(contactView);
        });
      },
      backToContacts: function(e) {
        ContactManager.stopEvent(e);
        return ContactManager.navigate('contacts');
      }
    };
  });

}).call(this);
