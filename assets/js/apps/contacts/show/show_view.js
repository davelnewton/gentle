ContactManager.module('ContactsApp.Show', function(Show, ContactManager, Backbone, Marionette, $, _) {
  Show.Contact = Marionette.ItemView.extend({
    template: '#contact-view'
  });
  Show.missingContact = Marionette.ItemView.extend({
    template: '#missingContact-view'
  });
  return Show.Contact.viewFor = function(model) {
    return new Show.Contact({
      model: model
    });
  };
});
