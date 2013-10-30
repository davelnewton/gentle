ContactManager.module 'ContactsApp.List', (List, ContactManager, Backbone, Marionette, $, _) ->
  List.Controller =
    listContacts: ->
      console.log 'DBG Entering List.Controller#listContacts...'
      contacts = ContactManager.request 'contact:entities'
      contactsListView = new List.Contacts { collection: contacts }

      contactsListView.on 'itemview:contact:delete', (childView, model) ->
        console.log 'DBG Entering List.Controller itemview:contact:delete handler...'
        model.destroy()

      contactsListView.on 'itemview:contact:show', (childView, model) ->
        console.log "DBG Entering List.Controller itemview:contact:show handler, model ID=#{model.get('id')}"
        ContactManager.trigger 'contact:show', model.get('id')

      ContactManager.mainRegion.show contactsListView
