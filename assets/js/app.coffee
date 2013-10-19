app = ->
  ContactManager = new Marionette.Application

  ContactManager.addRegions
    mainRegion: '#main-region'
    listRegion: '#list-region'

  ContactManager.ContactView = Marionette.ItemView.extend
    template: '#contact-template'
    
    events:
      'click p.clickable': 'alertPhoneNumber'
    
    alertPhoneNumber: ->
      alert @model.escape('phoneNumber')

  ContactManager.Contact = Backbone.Model.extend
    defaults:
      firstName: '[No first name provided]'
      lastName: '[No last name provided]'
      phoneNumber: '[No phone number provided]'

  ContactManager.on 'initialize:after', ->
    alice = new ContactManager.Contact
      firstName: 'Alice'
      lastName: 'Arten'
      phoneNumber: '555-0184'

    aliceView = new ContactManager.ContactView
      model: alice

    ContactManager.mainRegion.show aliceView

  ContactManager.start()
