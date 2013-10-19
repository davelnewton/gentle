ContactManager.module 'ContactsApp.List', (List, ContactManager, Backbone, Marionette, $, _) ->
  List.Controller =
    listContacts: ->
      console.log 'DBG Entering List.Controller#listContacts...'
      contactsListView = new List.Contacts
        collection: ContactManager.request 'contact:entities'
      ContactManager.mainRegion.show contactsListView
