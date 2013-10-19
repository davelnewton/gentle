ContactManager = new Marionette.Application

ContactManager.addRegions
  mainRegion: '#main-region'

app = ->
  ContactManager.on 'initialize:after', ->
    contactsListView = new ContactManager.ContactsApp.List.Contacts
      collection: ContactManager.request 'contact:entities'

    ContactManager.mainRegion.show contactsListView

  ContactManager.start()
