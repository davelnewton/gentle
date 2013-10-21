(function() {
  var ContactManager;

  ContactManager = new Marionette.Application;

  console.log('DBG Created ContactManager', ContactManager);

  ContactManager.addRegions({
    mainRegion: '#main-region'
  });

  ContactManager.on('initialize:after', function() {
    console.log('DBG Main initialize:after handler enter...');
    if (Backbone.history) {
      Backbone.history.start();
    }
    console.log("DBG Checking fragment; '" + Backbone.history.fragment + "' (" + (!!Backbone.history.fragment) + ")...");
    if (!Backbone.history.fragment) {
      Backbone.history.navigate('contacts');
      return ContactsApp.List.Controller.listContacts();
    }
  });

  window.ContactManager = ContactManager;

}).call(this);
