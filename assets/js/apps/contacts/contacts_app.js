ContactManager.module('ContactsApp', function(ContactsApp, ContactManager, Backbone, Marionette, $, _) {
  var API;
  console.log('DBG Creating ContactsApp module...');
  ContactsApp.Router = Marionette.AppRouter.extend({
    appRoutes: {
      'contacts': 'listContacts',
      'contacts/:id': 'showContact'
    }
  });
  console.log('DBG Created ContactsApp.Router');
  API = {
    listContacts: function() {
      console.log('DBG listContacts via route...');
      return ContactsApp.List.Controller.listContacts();
    },
    showContact: function(id) {
      console.log("DBG showContact via route; id=" + id);
      return ContactsApp.Show.Controller.showContact(id);
    }
  };
  ContactManager.on('contacts:list', function() {
    console.log('DBG contacts:list handler; nav#contacts and list contacts...');
    this.navigate('contacts');
    return ContactsApp.List.Controller.listContacts();
  });
  ContactManager.on('contact:show', function(id) {
    console.log('DBG contact:show handler; nav#contacts/:id and show contact...');
    this.navigate("contacts/" + id);
    return API.showContact(id);
  });
  ContactManager.addInitializer(function() {
    console.log('DBG addInitializer enter; creating router...');
    return new ContactsApp.Router({
      controller: API
    });
  });
  return window.ContactsApp = ContactsApp;
});
