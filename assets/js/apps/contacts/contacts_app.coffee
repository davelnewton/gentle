ContactManager.module 'ContactsApp', (ContactsApp, ContactManager, Backbone, Marionette, $, _) ->
  console.log 'DBG Creating ContactsApp module...'

  ContactsApp.Router = Marionette.AppRouter.extend
    appRoutes:
      'contacts': 'listContacts'
  console.log 'DBG Created ContactsApp.Router'

  API =
    listContacts: ->
      console.log 'DBG listContacts via route...'
      ContactsApp.List.Controller.listContacts();

  ContactManager.addInitializer ->
    console.log 'DBG addInitializer enter; creating router...'
    new ContactsApp.Router
      controller: API

  window.ContactsApp = ContactsApp
