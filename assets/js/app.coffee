ContactManager = new Marionette.Application

ContactManager.addRegions
  mainRegion: '#main-region'

ContactManager.on 'initialize:after', ->
  ContactManager.ContactsApp.List.Controller.listContacts()
