ContactManager.module 'ContactsApp', (ContactsApp, ContactManager, Backbone, Marionette, $, _) ->
  console.log 'DBG Creating ContactsApp module...'

  ContactsApp.Router = Marionette.AppRouter.extend
    appRoutes:
      'contacts':     'listContacts'
      'contacts/:id': 'showContact'

  console.log 'DBG Created ContactsApp.Router'

  API =
    listContacts: ->
      console.log 'DBG listContacts via route...'
      ContactsApp.List.Controller.listContacts()

    showContact: (id) ->
      console.log "DBG showContact via route; id=#{id}"
      ContactsApp.Show.Controller.showContact id

  ContactManager.on 'contacts:list', ->
    console.log 'DBG contacts:list handler; nav#contacts and list contacts...'
    @navigate 'contacts'
    ContactsApp.List.Controller.listContacts()

  ContactManager.on 'contact:show', (id) ->
    console.log 'DBG contact:show handler; nav#contacts/:id and show contact...'
    @navigate "contacts/#{id}"
    API.showContact id

  ContactManager.addInitializer ->
    console.log 'DBG addInitializer enter; creating router...'
    new ContactsApp.Router
      controller: API

  window.ContactsApp = ContactsApp
