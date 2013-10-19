ContactManager.module 'Entities', (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.Contact = Backbone.Model.extend
    defaults:
      firstName: '[No first name provided]'
      lastName: '[No last name provided]'
      phoneNumber: '[No phone number provided]'

  Entities.ContactCollection = Backbone.Collection.extend
    model: Entities.Contact
    comparator: (c) -> "#{c.get('firstName')} #{c.get('lastName')}"
