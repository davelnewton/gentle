ContactManager.module 'ContactsApp.Show', (Show, ContactManager, Backbone, Marionette, $, _) ->
  Show.Controller =
    showContact: (model) ->
      console.log 'DBG Entering Show.Controller#showContact...'
      contactView = new Show.Contact
        model: model
      ContactManager.mainRegion.show contactView
