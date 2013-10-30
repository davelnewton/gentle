ContactManager.module('Entities', function(Entities, ContactManager, Backbone, Marionette, $, _) {
  var API, initializeContacts;
  Entities.Contact = Backbone.Model.extend({
    urlRoot: 'contacts'
  });
  Entities.configureStorage(Entities.Contact);
  Entities.ContactCollection = Backbone.Collection.extend({
    url: 'contacts',
    model: Entities.Contact,
    comparator: function(c) {
      return "" + (c.get('firstName')) + " " + (c.get('lastName'));
    }
  });
  Entities.configureStorage(Entities.ContactCollection);
  initializeContacts = function() {
    var contacts;
    console.log('DBG Entering initializeContacts...');
    contacts = new Entities.ContactCollection([
      {
        id: 1,
        firstName: "Alice",
        lastName: "Arten",
        phoneNumber: "555-0184"
      }, {
        id: 2,
        firstName: "Bob",
        lastName: "Brigham",
        phoneNumber: "555-0163"
      }, {
        id: 3,
        firstName: "Charlie",
        lastName: "Campbell",
        phoneNumber: "555-0129"
      }
    ]);
    contacts.forEach(function(contact) {
      return contact.save();
    });
    return contacts;
  };
  API = {
    getContactEntities: function() {
      var contacts;
      console.log('DBG Entering API#getContactEntities...');
      contacts = new Entities.ContactCollection();
      contacts.fetch();
      if (contacts.length === 0) {
        console.log('DBG   No contacts; initializing...');
        return initializeContacts();
      }
      console.log("DBG   Have contacts; returning list of size " + contacts.length + "...");
      return contacts;
    },
    getContactEntity: function(id) {
      var contact;
      console.log('DBG Entering API#getContactEntity...');
      contact = new Entities.Contact({
        id: id
      });
      contact.fetch();
      return contact;
    }
  };
  ContactManager.reqres.setHandler('contact:entities', function() {
    console.log("DBG ContactManager contact:entities...");
    return API.getContactEntities();
  });
  return ContactManager.reqres.setHandler('contact:entity', function(id) {
    console.log("DBG ContactManager contact:entity id=" + id + "...");
    return API.getContactEntity(id);
  });
});
