ContactManager.module 'Entities', (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.Contact = Backbone.Model.extend
    defaults:
      firstName: '[No first name provided]'
      lastName: '[No last name provided]'
      phoneNumber: '[No phone number provided]'

  Entities.ContactCollection = Backbone.Collection.extend
    model: Entities.Contact
    comparator: (c) -> "#{c.get('firstName')} #{c.get('lastName')}"

  contacts = null
  initializeContacts = ->
    new ContactManager.Entities.ContactCollection [
      {
        id: 1
        firstName: 'Bob'
        lastName: 'Brigham'
        phoneNumber: '555-0163'
      },
      { 
        id: 2
        firstName: 'Alice'
        lastName: 'Smith'
        phoneNumber: '555-0184'
      },
      {
        id: 3
        firstName: 'Charlie'
        lastName: 'Campbell'
        phoneNumber: '555-0129'
      },
      {
        id: 4
        firstName: 'Alice'
        lastName: 'Arten'
        phoneNumber: '555-4242'
      }
    ]

  API =
    getContactEntities: ->
      contacts = initializeContacts() unless contacts?
      contacts

  ContactManager.reqres.setHandler 'contact:entities', ->
    API.getContactEntities()
